package com.cuit.secims.mw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cuit.secims.mw.dao.ILearningForumDao;
import com.cuit.secims.mw.pojo.LearningForumPosts;


@Service
public class LearningForumSV {
	
	@Autowired
	private ILearningForumDao forumDao;
	
	
	
	// 获取 所有的帖子
	public List<LearningForumPosts> getForumPostsAll(){
		return this.forumDao.getForumPostsAll();
	}
	
	
	// 根据ID获取帖子信息
	public LearningForumPosts getForumPostsById(int postsId) {
		return this.forumDao.getForumPostsById(postsId);
	}
	
	
	// 发布 话题/增加 论坛帖子
	public int addForumPosts(LearningForumPosts posts){
		return this.forumDao.addForumPosts(posts);
	}
		
	
	
	
	
	
	
	
	
	

}
