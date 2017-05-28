package com.cuit.secims.mw.controller;

import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cuit.secims.mw.pojo.LearningForumPosts;
import com.cuit.secims.mw.service.LearningForumSV;
import com.cuit.secims.mw.util.CommonUtils;
import com.cuit.secims.mw.util.Result;
import com.cuit.secims.mw.util.UserManager;
import com.google.gson.Gson;

/**
 * @Description 学习论坛
 * @author MW
 * @date 2017-4-9 下午5:43:13
 * @version V1.0
 */
@Controller
@RequestMapping("res")
public class LearningForumController {
	
	private transient static final Logger log = Logger.getLogger(LearningForumController.class) ;
	
	@Autowired
	private LearningForumSV service ;
	
	
	
	
	
	// 跳转到 论坛帖子页面
	@RequestMapping(value="getLearningForum",method=RequestMethod.GET)
	public ModelAndView getLearningForumPage(){
		
		List<LearningForumPosts> posts = this.service.getForumPostsAll();
		
		log.info("论坛帖子： "+posts);
		
	 	ModelAndView mav = new ModelAndView("learningForumMain");
	 	mav.addObject("posts", posts);
	 	mav.addObject("postsNum", posts.size());
	 	
	 	return mav;
	}
	
	
	
	// 跳转到 发布话题 页面
	@RequestMapping(value="getLearningForumEditor",method=RequestMethod.GET)
	public ModelAndView getLearningForumEditorPage(){
		
		
		ModelAndView mav = new ModelAndView("learningForumEditor");
		
		return mav;
	}
	
	
	
	
	// 发布 话题
	@RequestMapping(value="sendForumPosts",method=RequestMethod.POST)
	public String addLearningForumPosts(LearningForumPosts posts){
		
		int userId = UserManager.getUserId();
		
		log.info("即将要发布的话题论坛帖子： "+posts);
		
		posts.setUserid(userId); 
		
		int count = this.service.addForumPosts(posts);
		if (count > 0) {
			log.error("发布话题论坛帖子 成功！！！！");
		}
		
		
		return "redirect:getLearningForum";
	}
	
	
	
	// 跳转到 论坛详细界面 / 聊天界面
	@RequestMapping("getLearningForumDetail")
	public ModelAndView getLearningForumDetailPage(int postsId){
		
		
		log.info("查询 === 帖子id："+postsId);
		
		LearningForumPosts post = this.service.getForumPostsById(postsId);
		
		log.info("查看 帖子信息： "+post);
		
		ModelAndView mav = new ModelAndView("learningForumDetail");
		mav.addObject("post", post);
		
		return mav;
	}
	
	
	
	
	
	// 跳转到 我发布的帖子页面
	@RequestMapping("getLearningForumMyPosts")
	public ModelAndView getLearningForumMyPostsPage(){
		
		// 用户ID 
		int userId = UserManager.getUserId();
		
		List<LearningForumPosts> posts = this.service.getForumPostsByUserId(userId); 
		
		ModelAndView mav = new ModelAndView("learningForumMyPosts");
		mav.addObject("posts", posts);
		mav.addObject("postsNum", posts.size());
		
		return mav;
	}
	
	
	
	
	// 跳转到 我回复的帖子页面
	@RequestMapping("getLearningForumMyReply")
	public ModelAndView getLearningForumMyReplyPage() {

		// 用户ID
		int userId = UserManager.getUserId();
		
		List<LearningForumPosts> posts = this.service.getForumPostsByUserReply(userId); 
																				

		ModelAndView mav = new ModelAndView("learningForumMyReply");
		mav.addObject("posts", posts);
		mav.addObject("postsNum", posts.size());

		return mav;
	}
	
	
	
	// 删除 我的帖子
	@RequestMapping(value="delForumPosts",method=RequestMethod.POST)
	public @ResponseBody String delForumPosts(int postsId){
		
		Result result = new Result();
		
		log.info("将要删除的帖子ID: "+postsId);
		
		int count = this.service.delForumPosts(postsId);
		if (count > 0) {
			result.setSuccess(true);
		}
		
		return new Gson().toJson(result);
	}
	
	
	
	
	
	
	//#################### 学习论坛类型 #####################//
	
	
	@RequestMapping(value="getLearningForumType")
	public ModelAndView getLearningForumTypePage(String type){
		
		// 处理一下中文乱码问题
		type = CommonUtils.dealStringEncoding(type).trim();
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("type", type);
		
		log.info("按照类型查找：type - "+type);
		
		// 获取帖子
		List<LearningForumPosts> posts = this.service.getForumPostsByconditions(map);
		
		ModelAndView mav = new ModelAndView("learningForumType");
		mav.addObject("posts", posts);
		mav.addObject("postsType", type);
		mav.addObject("postsNum", posts.size());
		
		
		return mav;
	}
	
	
	
	
	
	
	
	
	

}
