package com.cuit.secims.mw.pojo;

import java.util.Date;

import com.cuit.secims.mw.util.CommonUtils;

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
	private Integer parentId ; // 它的父记录ID
	private  String status; // 状态
	
	
	
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
	
	
	public String getSendTimeString(){
		return CommonUtils.getStringfromDate(sendTime, "yyyy-MM-dd HH:mm:ss");
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
	
	
	
	public Integer getParentId() {
		return parentId;
	}


	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}



	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "LearningForumChatMsg [msgId=" + msgId + ", postsId=" + postsId
				+ ", msgContent=" + msgContent + ", sendTime=" + sendTime
				+ ", userid=" + userid + ", parentId=" + parentId + ", status="
				+ status + "]";
	}


	
}
