package com.cuit.secims.mw.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cuit.secims.mw.pojo.WeekReportWork;
import com.cuit.secims.mw.service.WorkReportSV;
import com.cuit.secims.mw.util.Docx4jUtil;
import com.cuit.secims.mw.util.Result;
import com.cuit.secims.mw.util.UserManager;
import com.google.gson.Gson;

/**
 * 工作周报
 */
@Controller
@RequestMapping("res")
public class WorkReportController {
	
	private transient static final Logger log = Logger.getLogger(WorkReportController.class);
	
	@Autowired
	private WorkReportSV service;
	
	
	// 编辑周报
	@RequestMapping(value="getWeekly",method=RequestMethod.GET)
	public String getWeeklyPage(){
		return "weekly";
	}
	
	
	// 已发送的周报列表
	@RequestMapping(value="getWeeklyReport",method=RequestMethod.GET)
	public ModelAndView getWeeklyReportPage() throws Exception{
		
		// 设置用户ID
		int userId = UserManager.getUserId();
		
//		List<WeekReportWork> weeklyAll = this.service.getWeeklyAll(1);
		List<WeekReportWork> weeklys = this.service.getWeeklyByCondition(userId, "F");
		
		ModelAndView mad = new ModelAndView("weeklyReport");
		mad.addObject("weeklys", weeklys);
		mad.addObject("weeklyNum", weeklys.size());
		
		return mad;
	}
	
	
	
	// 已发送的周报列表
	@RequestMapping(value="getWeeklyReportJson",method=RequestMethod.GET)
	public @ResponseBody String getWeeklyReportJson() throws Exception{
			
		// 设置用户ID
		int userId = UserManager.getUserId();
			
//		List<WeekReportWork> weeklyAll = this.service.getWeeklyAll(1);
		List<WeekReportWork> weeklys = this.service.getWeeklyByCondition(userId, "F");
			
		return new Gson().toJson(weeklys);
	}
	
	
	// 草稿箱
	@RequestMapping(value="getWeeklyDraftBox",method=RequestMethod.GET)
	public ModelAndView getWeeklyDraftBoxPage(){
		
		// 设置用户ID
		int userId = UserManager.getUserId();
		
		List<WeekReportWork> weeklys = this.service.getWeeklyByCondition(userId, "E");
		
		ModelAndView mav = new ModelAndView("weeklyDraftBox");
		mav.addObject("weeklys", weeklys);
		mav.addObject("weeklysNum", weeklys.size());
		
		return mav;
	}
	
	
	// 垃圾箱（已删除的周报）
	@RequestMapping(value="getWeeklyDustbin",method=RequestMethod.GET)
	public ModelAndView getWeeklyDustbinPage() {
		
		// 设置用户ID
		int userId = UserManager.getUserId();

		List<WeekReportWork> weeklys = this.service.getWeeklyByCondition(userId, "D");

		ModelAndView mav = new ModelAndView("weeklyDustbin");
		mav.addObject("weeklys", weeklys);
		mav.addObject("weeklysNum", weeklys.size());

		return mav;
	}
	
	
	
	// 查看 周报
	@RequestMapping(value="getWeeklyDetailView",method=RequestMethod.GET)
	public ModelAndView getWeeklyDetailViewPage(int weekRepId,
			HttpServletRequest request) throws Exception{
		
		request.setCharacterEncoding("UTF-8");
		
		WeekReportWork weekly = this.service.getWeeklyByWeekRepId(weekRepId);
		
		log.info("查看周报情况： "+weekly);
		
		
		ModelAndView mav = new ModelAndView("weeklyDetailView");
		mav.addObject("weekly", weekly);
		
		
		return mav;
	}
	
	
	
	// 发送周报
	@RequestMapping(value="sendWeekly",method=RequestMethod.POST)
	public @ResponseBody String sendWeekly(@RequestBody WeekReportWork weekly) {
		
		Result result = new Result();
		
		weekly.setUserid(UserManager.getUserId()); 
		
		log.info("发送周报   weekly : " + weekly);
		
		
		int count = this.service.addWeekly(weekly);
		if (count > 0) {
			result.setSuccess(true);
		}
		
		return new Gson().toJson(result);
	}
	
	
	
	// 发送周报（其实是直接把状态位改为 F ）
	@RequestMapping(value="sendWeeklytoF",method=RequestMethod.POST)
	public @ResponseBody String sendWeeklytoF(@RequestParam int weekRepId){
		
		Result result = new Result();
		
		int count = this.service.sendWeeklytoF(weekRepId);
		if (count > 0) {
			result.setSuccess(true);
		}
		
		return new Gson().toJson(result);
	}
	
	
	
	// 存为 草稿箱
	@RequestMapping(value="saveToDraftBox",method=RequestMethod.POST)
	public @ResponseBody String saveToDraftBox(@RequestBody WeekReportWork weekly){
		
		Result result = new Result();
		
		weekly.setUserid(UserManager.getUserId()); 
		
		log.info("存为 草稿箱  weekly: "+weekly);
		
		int count = this.service.addWeekly(weekly);
		if (count > 0) {
			result.setSuccess(true);
		}
		
		return new Gson().toJson(result);
	}
	
	
	
	
	/**
	 * 删除已发送周报(将状态位改为D)
	 * @param weekRepId 周报ID
	 * @return
	 */
	@RequestMapping(value="delWeeklyReport",method=RequestMethod.POST)
	public @ResponseBody String delWeeklyReport(@RequestParam("weekRepId") int weekRepId){
		
		Result result = new Result();
		
		int count = this.service.delWeeklyReport(weekRepId);
		if (count > 0) {
			result.setSuccess(true);
		}
		
		return new Gson().toJson(result);
	}
	
	
	
	
	/**
	 * 删除草稿箱中的周报（不可恢复）
	 * @param weekRepId 周报ID
	 * @return
	 */
	@RequestMapping(value="delWeeklyDraftBox",method=RequestMethod.POST)
	public @ResponseBody String delWeeklyDraftBox(@RequestParam("weekRepId") int weekRepId){
		
		Result result = new Result();
		
		int count = this.service.delWeeklyDraftBox(weekRepId);
		if (count > 0) {
			result.setSuccess(true);
		}
		
		return new Gson().toJson(result);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="test")
	public void test(HttpServletRequest request) throws Exception{
		
		String realPath = request.getSession().getServletContext().getRealPath("WeeklyFiles");
		
		String docxPath =realPath+ "\\工作周报第一周(7.8).docx";
		String htmlPath =realPath;
		
		Docx4jUtil.DocxToHTML(docxPath, htmlPath);
		
		
	}
	
	
	
	
	
	

}
