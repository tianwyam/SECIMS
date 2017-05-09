package com.cuit.secims.mw.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	
	public List<LearningForumPosts> getForumPostsByconditions(Map map){
		return this.forumDao.getForumPostsByconditions(map);
	}
	
	/**
	 * 获取 我的帖子
	 * @param userid 用户ID
	 * @return 我的帖子列表  */
	public List<LearningForumPosts> getForumPostsByUserId(int userid){
		return this.forumDao.getForumPostsByUserId(userid);
	}
	
	
	
	/**
	 * 获取 我回复的帖子
	 * @param userid 用户ID
	 * @return 我回复的帖子列表 */
	public List<LearningForumPosts> getForumPostsByUserReply(int userid){
		return this.forumDao.getForumPostsByUserReply(userid);
	}
	
	
	// 根据ID获取帖子信息
	public LearningForumPosts getForumPostsById(int postsId) {
		
		// 每一次查询帖子信息时，都要更新帖子访问量
		this.forumDao.addBrowseNum(postsId);
		LearningForumPosts posts = this.forumDao.getForumPostsById(postsId);
		
		// 左连接后 子表没有的话，会产生 null
		if (posts.getChatMsgs() == null || posts.getChatMsgs().get(0).getMsgId() == null) {
			posts.setChatMsgs(null);
		}
		
		return posts;
	}
	
	
	// 发布 话题/增加 论坛帖子
	public int addForumPosts(LearningForumPosts posts){
		return this.forumDao.addForumPosts(posts);
	}
		
	
	
	// 删除 论坛帖子
	public int delForumPosts(int postsId){
		return this.forumDao.delForumPosts(postsId);
	}
	
	
	
	
	// 增加 聊天记录
	public int addForumChatMsg(String msgContent, int postsId, int userid, int parentId){
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("msgContent", msgContent);
		map.put("postsId", postsId);
		map.put("userid", userid);
		map.put("parentId", parentId);

		// 添加聊天记录时，要增加回复数
		this.forumDao.addAnswerNum(postsId);
		
		return this.forumDao.addForumChatMsg(map);
	}
	

}
