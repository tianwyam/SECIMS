package com.cuit.secims.mw.pojo;

import java.util.Date;
import java.util.List;

import com.cuit.secims.mw.util.CommonUtils;

/**
 * @Description 学习论坛贴子
 * @author MW
 * @date 2017-4-10 上午9:53:41
 * @version V1.0
 */

public class LearningForumPosts {
	
	
	private int postsId ; // 学习论坛帖子ID
	private String title ; // 论坛帖子标题
	private String type ; // 论坛帖子类型
	private String content ; // 论坛帖子内容
	private Date createTime ; // 创建时间
	private int userid ; // 创建人用户ID
	private int browseNum ; // 浏览数量
	private int answerNum ; // 回答数量
	private String status ; // 状态（F:完成，E：执行中）
	
	
	
	
	// 构造函数
	public LearningForumPosts(){}



	// setter and getter
	public int getPostsId() {
		return postsId;
	}


	public void setPostsId(int postsId) {
		this.postsId = postsId;
	}



	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}



	public String getType() {
		return type;
	}



	public void setType(String type) {
		this.type = type;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public Date getCreateTime() {
		return createTime;
	}
	
	
	//时间以字符串格式输出
	public String getCreateTimeString(){
		
		return CommonUtils.getStringfromDate(createTime, "yyyy-MM-dd HH:mm:ss");
		
	}



	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}



	public int getUserid() {
		return userid;
	}



	public void setUserid(int userid) {
		this.userid = userid;
	}



	public int getBrowseNum() {
		return browseNum;
	}



	public void setBrowseNum(int browseNum) {
		this.browseNum = browseNum;
	}



	public int getAnswerNum() {
		return answerNum;
	}



	public void setAnswerNum(int answerNum) {
		this.answerNum = answerNum;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "postsId=" + postsId + "&title=" + title + "&type=" + type
				+ "&content=" + content + "&createTime=" + createTime
				+ "&userid=" + userid + "&browseNum=" + browseNum
				+ "&answerNum=" + answerNum + "&status=" + status;
	}
	
	
	
	
	// 论坛帖子中的聊天记录
	private List<LearningForumChatMsg> chatMsgs;



	public List<LearningForumChatMsg> getChatMsgs() {
		return chatMsgs;
	}


	public void setChatMsgs(List<LearningForumChatMsg> chatMsgs) {
		this.chatMsgs = chatMsgs;
	}
	
	
	
	
}
