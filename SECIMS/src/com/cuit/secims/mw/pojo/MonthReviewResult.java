package com.cuit.secims.mw.pojo;

/**
 * @Description 月评评定表
 * @author MW
 * @date 2017-5-12 下午3:45:50
 * @version V1.0
 */
public class MonthReviewResult {

	
	private int resultId ; // 月评评论表ID
	private int reviewId ; // 月评ID
	private int userId ; // 评论人Id
	private int roleType ; // 评论人类型/（如：企业导师/企业实习生管理员）
	private double result ; // 分数
	private String  comment ; // 评语

	
	
	// 构造函数
	public MonthReviewResult(){}
	
	
	// setter and getter 
	
	public int getResultId() {
		return resultId;
	}

	public void setResultId(int resultId) {
		this.resultId = resultId;
	}

	public int getReviewId() {
		return reviewId;
	}

	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getRoleType() {
		return roleType;
	}

	public void setRoleType(int roleType) {
		this.roleType = roleType;
	}

	public double getResult() {
		return result;
	}

	public void setResult(double result) {
		this.result = result;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	@Override
	public String toString() {
		return "MonthReviewResult [resultId=" + resultId + ", reviewId="
				+ reviewId + ", userId=" + userId + ", roleType=" + roleType
				+ ", result=" + result + ", comment=" + comment + "]";
	}
	
	
	
	
}
