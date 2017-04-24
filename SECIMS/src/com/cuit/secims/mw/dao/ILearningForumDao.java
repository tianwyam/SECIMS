package com.cuit.secims.mw.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cuit.secims.mw.pojo.LearningForumPosts;

/**
 * @Description  学习论坛帖子
 * @author MW
 * @date 2017-4-10 上午10:38:26
 * @version V1.0
 */
@Repository
public interface ILearningForumDao {
	
	
	
	// 倒序获取 所有的帖子
	public List<LearningForumPosts> getForumPostsAll();
	
	
	// 根据ID获取帖子信息
	public LearningForumPosts getForumPostsById(int postsId) ; 
	

	// 发布 话题/增加 论坛帖子
	public int addForumPosts(LearningForumPosts posts);
	
	
	
	
	
	
	
	
}
