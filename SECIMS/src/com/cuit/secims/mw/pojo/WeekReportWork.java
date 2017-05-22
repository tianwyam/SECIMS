package com.cuit.secims.mw.pojo;

import java.sql.Date;

import com.cuit.secims.mw.util.CommonUtils;

/**
 * 周报
 */
public class WeekReportWork {
	
	
	private Integer weekRepId ; // 周报ID
	private String sender ; // 发送人
	private String recipient ; // 接受人
	private String title ; // 标题
	private String content ; // 内容
	private Date startTime ; // 开始时间
	private Date endTime ; // 结束时间
	private Date createTime ; // 创建时间
	private String  status ; // 状态（F:完成、E：保存中）
	private Integer userid ; //'发送用户ID
	
	
	
	
	// 构造函数
	
	public WeekReportWork(){}
	
	
	// setter and getter
	
	public Integer getWeekRepId() {
		return weekRepId;
	}

	public void setWeekRepId(Integer weekRepId) {
		this.weekRepId = weekRepId;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getRecipient() {
		return recipient;
	}

	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	
	public Date getStartTime() {
		return startTime;
	}


	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}


	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}


	public Date getCreateTime() {
		return createTime;
	}
	
	public String getCreateTimeString() {
		return CommonUtils.getStringfromDate(createTime, "yyyy年MM月dd日");
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}


	@Override
	public String toString() {
		return "weekRepId=" + weekRepId + "&sender=" + sender + "&recipient="
				+ recipient + "&title=" + title + "&content=" + content
				+ "&startTime=" + startTime + "&endTime=" + endTime
				+ "&createTime=" + createTime + "&status=" + status
				+ "&userid=" + userid;
	}




}
