package com.cuit.secims.mw.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cuit.secims.mw.pojo.LearningForumPosts;
import com.cuit.secims.mw.service.LearningForumSV;

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
		
		log.info("即将要发布的话题论坛帖子： "+posts);
		
		posts.setUserid(1); // 后面来修改
		
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
