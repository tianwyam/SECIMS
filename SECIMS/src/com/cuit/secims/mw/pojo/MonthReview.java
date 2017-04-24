package com.cuit.secims.mw.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 月度考核管理
 */
public class MonthReview {
	
	
	private Integer reviewId ; // 月评ID
	private Integer userid ; // 用户ID
	private String monthTitle ; // 月评PPT标题
	private String monthFileURL ; // PPT路径
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date createTime ; // 创建时间
	
	
	
	// 构造函数
	public MonthReview(){}
	
	public MonthReview(Integer reviewId, Integer userid, String monthTitle,
			String monthFileURL, Date createTime) {
		super();
		this.reviewId = reviewId;
		this.userid = userid;
		this.monthTitle = monthTitle;
		this.monthFileURL = monthFileURL;
		this.createTime = createTime;
	}




	// setter and getter
	
	public Integer getReviewId() {
		return reviewId;
	}


	public void setReviewId(Integer reviewId) {
		this.reviewId = reviewId;
	}



	public Integer getUserid() {
		return userid;
	}


	public void setUserid(Integer userid) {
		this.userid = userid;
	}


	public String getMonthTitle() {
		return monthTitle;
	}



	public void setMonthTitle(String monthTitle) {
		this.monthTitle = monthTitle;
	}



	public String getMonthFileURL() {
		return monthFileURL;
	}



	public void setMonthFileURL(String monthFileURL) {
		this.monthFileURL = monthFileURL;
	}


	public Date getCreateTime() {
		return createTime;
	}
	
	
	// 将日期形式 的 CreateTime 转换成 字符串类型  -- createTimeString
	public String getCreateTimeString(){
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		return sdf.format(createTime);
		
	}


	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}



	@Override
	public String toString() {
		return reviewId + "&" + userid + "&" + monthTitle + "&" + monthFileURL
				+ "&" + createTime;
	}



}
