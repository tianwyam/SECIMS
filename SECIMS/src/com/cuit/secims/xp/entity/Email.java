package com.cuit.secims.xp.entity;

import java.util.Date;

public class Email {
	private int userId;
	private int receiveId ;
	private int type;
	private Date sendTime;
	
	public Email() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Email(int userId, int receiveId, int type, Date sendTime) {
		super();
		this.userId = userId;
		this.receiveId = receiveId;
		this.type = type;
		this.sendTime = sendTime;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getReceiveId() {
		return receiveId;
	}

	public void setReceiveId(int receiveId) {
		this.receiveId = receiveId;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public Date getSendTime() {
		return sendTime;
	}

	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}

	@Override
	public String toString() {
		return "Email [userId=" + userId + ", receiveId=" + receiveId
				+ ", type=" + type + ", sendTime=" + sendTime + "]";
	}
	
}
