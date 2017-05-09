package com.cuit.secims.mw.dao;

import java.util.List;
import java.util.Map;

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
	
	
	/**
	 * 获取 我的帖子
	 * @param userid 用户ID
	 * @return 我的帖子列表
	 */
	public List<LearningForumPosts> getForumPostsByUserId(int userid);
	
	
	/**
	 * 获取 我回复的帖子
	 * @param userid 用户ID
	 * @return 我回复的帖子列表
	 */
	public List<LearningForumPosts> getForumPostsByUserReply(int userid);
	
	
	/**
	 * 根据条件来获取帖子信息
	 * @param map
	 * @return
	 */
	public List<LearningForumPosts> getForumPostsByconditions(Map map);
	
	// 根据ID获取帖子信息
	public LearningForumPosts getForumPostsById(int postsId) ; 
	

	// 发布 话题/增加 论坛帖子
	public int addForumPosts(LearningForumPosts posts);
	
	
	
	// 更新访问量
	public int addBrowseNum(int postsId);
	
	// 更新回复量
	public int addAnswerNum(int postsId);
	
	
	// 删除 论坛帖子
	public int delForumPosts(int postsId);
	
	
	
	// 增加 聊天记录
	public int addForumChatMsg(Map map);
	
}
