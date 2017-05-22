package com.cuit.secims.mw.controller;

import java.io.File;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cuit.secims.mw.pojo.MonthReview;
import com.cuit.secims.mw.pojo.MonthReviewResult;
import com.cuit.secims.mw.service.MonthReviewSV;
import com.cuit.secims.mw.util.CommonConst;
import com.cuit.secims.mw.util.PPT2ImgUtil;
import com.cuit.secims.mw.util.Result;
import com.cuit.secims.mw.util.UserManager;
import com.google.gson.Gson;

/**
 * 月评管理 上传PPT
 */
@Controller
@RequestMapping("res")
public class MonthReviewController {
	
	private transient static final Logger log = Logger.getLogger(MonthReviewController.class);
	
	@Autowired
	private MonthReviewSV service ;
	
	
	
	
	// 跳转到月评页面
	@RequestMapping("getMonth")
	public ModelAndView getMonthPage(HttpServletRequest request,
			HttpServletResponse response){
		
		// 设置 用户ID 
		int userID = UserManager.getUserId();
		
		List<MonthReview> months = this.service.getMonthByUserId(userID); 
		
		ModelAndView mad = new ModelAndView("month");
		mad.addObject("months", months); 
		
		log.info("months : "+months);
		
		return mad;
	}
	
	
	// 上传月评PPT files+userid+monthfiles
	@RequestMapping(value="uploadPPT",method=RequestMethod.POST)
	public String uploadPPTFile(@RequestParam MultipartFile monthFile,
			HttpServletRequest request){
		
		// 获取 将要存储的文件夹 全路径
		String root = request.getSession()
						.getServletContext()
						.getRealPath(CommonConst.DIR_SEPARATOR1);
						
		
		String fileName = null;
		// 用户ID 后面改
		int userid = UserManager.getUserId();
		
		
		MonthReview month = new MonthReview();
		month.setUserid(userid); // 设置用户ID
		
		String monthPath = CommonConst.FILES_DIR
						+ CommonConst.DIR_SEPARATOR1 + userid
						+ CommonConst.DIR_SEPARATOR1 + CommonConst.MONTH_FILE_DIR;
		
		// 文件目录有+userID+monthFiles
		String fileUrl =root + monthPath;
		
		// 上传的文件
		if (!monthFile.isEmpty()) {
			// 获取 上传文件的名字
			fileName = monthFile.getOriginalFilename();
		}
		
		if (!StringUtils.isEmpty(fileName)) {
			
			File targetFile = new File(fileUrl,fileName);
			
			// 如果文件不存在，则添加目录及文件
			if (!targetFile.exists()) {
				targetFile.mkdirs();
			}
			
			log.info("path: "+targetFile.getAbsolutePath());
			
			try {
				
				// 文件存储/转移
				monthFile.transferTo(targetFile);
				
				log.info("上传月评PPT成功！ fileName = "+fileName);
				
				String[] split = fileName.split("\\.");
				
				
				// 文件名 不包括后缀名
				month.setMonthTitle(split[0]);
				
				// 文件路径 files+userId+monthFiles
				String monthfileurl = CommonConst.FILES_DIR+CommonConst.DIR_SEPARATOR2
									+ userid+CommonConst.DIR_SEPARATOR2
									+ CommonConst.MONTH_FILE_DIR;
				
				
				month.setMonthFileURL(monthfileurl+CommonConst.DIR_SEPARATOR2+fileName);
				
				int count = this.service.addMonthReview(month);
				
				if (count > 0) {
					log.info("上传月评PPT成功！ " + month);
				}
				
			} catch (Exception e) {
				log.error("上传月评PPT失败，发生异常！ ", e);
			}
			
		}
		
		
		return "redirect:getMonth";
		
	}
	
	
	
	// 删除上传的ppt月评
	@RequestMapping(value="delMonthReview",method=RequestMethod.POST)
	public @ResponseBody String delMonthReview(@RequestParam(value="reviewId")int reviewId,
			@RequestParam(value="monthFileURL")String monthFileURL,HttpServletRequest request){
		
		Result result = new Result();
		
		int userid = UserManager.getUserId();
		
		// 先删除数据库中的表数据
		int count = this.service.delMonth(reviewId);
		
		// 删除成功后，再删除上传的PPT文件
		if (count > 0 ) {
			
			String path = request.getSession()
						.getServletContext().getRealPath(CommonConst.DIR_SEPARATOR1);
			
			String filePath = path+monthFileURL;
			
			String  imgHead = path 
					+CommonConst.FILES_DIR+CommonConst.DIR_SEPARATOR1
					+userid+CommonConst.DIR_SEPARATOR1
					+CommonConst.MONTH_FILE_DIR+CommonConst.DIR_SEPARATOR1;
			
			
			String imgPath = imgHead+reviewId;
			
			File pptFile = new File(filePath);
			
			// 如果文件存在，则删除
			if (pptFile.exists()) {
				pptFile.delete();
			}
			
			// 如果PPT图片存在，则删除（delete方法只能删除文件/空文件夹）
			File imgFile = new File(imgPath);
			File[] listFiles = imgFile.listFiles();
			
			// 删除 文件夹下的所有文件
			if (listFiles != null && listFiles.length > 0) {
				for (File file : listFiles) {
					if(file.exists()){
						file.delete();
					}
				}
			}
			// 删除空文件夹
			if (imgFile.exists()) {
				imgFile.delete();
			}
			
			// 成功
			result.setSuccess(true);
			
			log.info("要删除的文件路径： "+filePath);
			log.info("要删除的PPT图片文件路径： "+imgPath);
		}
		
		return new Gson().toJson(result);
		
	}
	
	
	
	// 查看PPT
	@RequestMapping(value="toViewPPT",method=RequestMethod.GET)
	public ModelAndView PPTView(@RequestParam int reviewId, 
			@RequestParam String monthFileURL,
			@RequestParam(value="traineeId",required=false) Integer traineeId,
			HttpServletRequest request) throws Exception{
		
		request.setCharacterEncoding("UTF-8");
		
		ArrayList<String> imgURList = new ArrayList<>();
		
		int userid = 0;
		
		// 企业导师查看时
		if (traineeId != null) {
			userid = traineeId;
		}else {
			// 实习生自己查看
			userid = UserManager.getUserId();
		}
		
		//获取项目根目录
		String path = request.getSession()
						.getServletContext()
						.getRealPath(CommonConst.DIR_SEPARATOR1);
		
		String PPTFilePath = path+CommonConst.DIR_SEPARATOR1+monthFileURL;
		
		PPTFilePath = URLDecoder.decode(PPTFilePath, "UTF-8");
		
		// 文件路径 files+userID+monthFiles
		String monthfileurl = CommonConst.FILES_DIR+CommonConst.DIR_SEPARATOR1
				+ userid+CommonConst.DIR_SEPARATOR1
				+ CommonConst.MONTH_FILE_DIR;
		
		String imgFilePath = path+CommonConst.DIR_SEPARATOR1
					+monthfileurl+CommonConst.DIR_SEPARATOR1+reviewId;
		
		// PPT 转换 成图片
		boolean isSuccess = PPT2ImgUtil.doPPT2Img(PPTFilePath, imgFilePath,imgURList);
		
		// 获取评语评论
		MonthReviewResult monthResult = this.service.getMonthReviewResult(null, reviewId, 1);
		
		if (isSuccess) {
			log.info("成功！++++++++++++++");
		}
		
		ModelAndView mad = new ModelAndView("monthPPTView");
		
		mad.addObject("imgURLs", imgURList);
		mad.addObject("imgTotalNum", imgURList.size());
		
		
		String root = request.getSession()
					.getServletContext().getContextPath();
		
		String  imgHead = root+CommonConst.DIR_SEPARATOR3
				+CommonConst.FILES_DIR+CommonConst.DIR_SEPARATOR3
				+userid+CommonConst.DIR_SEPARATOR3
				+CommonConst.MONTH_FILE_DIR+CommonConst.DIR_SEPARATOR3;
		
		
		mad.addObject("imgHead", imgHead+reviewId);
		mad.addObject("reviewId", reviewId);
		mad.addObject("comments", monthResult);
		
		return mad;
	}
	
	
	
	//####### 月评考核/评定情况   #########
	
	
	// 跳转到 月评考核 页面/评定情况
	@RequestMapping(value="getMonthAssess",method=RequestMethod.GET)
	public String getMonthAssessPage(){
		
		return "monthAssess";
	}
	
	
	// 获取月评信息
	@RequestMapping(value="getMonthResult",method=RequestMethod.POST)
	public void getMonthResult(){
		
	}
	
	

}
