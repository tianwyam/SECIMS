package com.cuit.secims.mw.pojo;

/**
 * @Description 学习计划评定表/评分
 * @author MW
 * @date 2017-5-12 下午3:37:25
 * @version V1.0
 */
public class StudyPlanScore {
	
	
	
	private int scoreId ; // ID
	private int planId ; // 学习计划ID
	private int userId ; // 用户ID
	private int roleType ; // 角色类型（实习生互评/导师评价/实习生管理员）
	private double score ; // 评定成绩
	private String comment ; // 评语

	
	// 构造函数
	public StudyPlanScore(){}
	
	
	public StudyPlanScore(int planId, int userId, int roleType, double score) {
		this.planId = planId;
		this.userId = userId;
		this.roleType = roleType;
		this.score = score;
	}



	// setter and getter
	
	public int getScoreId() {
		return scoreId;
	}

	public void setScoreId(int scoreId) {
		this.scoreId = scoreId;
	}

	public int getPlanId() {
		return planId;
	}

	public void setPlanId(int planId) {
		this.planId = planId;
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

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}


	@Override
	public String toString() {
		return "StudyPlanScore [scoreId=" + scoreId + ", planId=" + planId
				+ ", userId=" + userId + ", roleType=" + roleType + ", score="
				+ score + ", comment=" + comment + "]";
	}
	

}
