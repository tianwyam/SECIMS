package com.cuit.secims.mw.pojo;

import java.util.Date;

/**
 * @Description 学习论坛聊天记录
 * @author MW
 * @date 2017-4-14 上午10:03:37
 * @version V1.0
 */
public class LearningForumChatMsg {
	
	
	private Integer msgId ; // 聊天记录ID
	private Integer postsId ; // 论坛帖子Id
	private String msgContent ; // 聊天内容
	private Date sendTime ; // 发送时间
	private Integer userid ; // 发送人
	
	
	
	// 构造函数
	public LearningForumChatMsg(){}


	
	// setting and getting
	
	public Integer getMsgId() {
		return msgId;
	}


	public void setMsgId(Integer msgId) {
		this.msgId = msgId;
	}


	public Integer getPostsId() {
		return postsId;
	}


	public void setPostsId(Integer postsId) {
		this.postsId = postsId;
	}


	public String getMsgContent() {
		return msgContent;
	}


	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}


	public Date getSendTime() {
		return sendTime;
	}


	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}


	public Integer getUserid() {
		return userid;
	}


	public void setUserid(Integer userid) {
		this.userid = userid;
	}



	
	@Override
	public String toString() {
		return "msgId=" + msgId + "&postsId=" + postsId + "&msgContent="
				+ msgContent + "&sendTime=" + sendTime + "&userid=" + userid;
	}
	
	
}
