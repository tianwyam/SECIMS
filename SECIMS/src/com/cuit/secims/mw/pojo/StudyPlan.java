package com.cuit.secims.mw.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.cuit.secims.mw.util.CommonUtils;

/**
 * 学习计划表 StudyPlan
 */
public class StudyPlan implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int planId ; // 学习计划ID
	private String  planTitle ; // 学习计划标题
	private String  planType ; // 学习计划类型 如web前端/开发技术/网络技术/操作系统/数据库/安全技术
	private String planContent ; // 学习计划内容
	
	private Date createTime ; // 学习计划开始时间
	
	private Date finishTime ; // 学习计划结束时间
	
	private int userid ; // 学习计划制定人
	private String status ; // 状态 F：完成/ E：正在执行
	private double progress ; // 完成进度情况
	
	private double score ; // 评分
	

	
	
	// 无参构造函数
	public StudyPlan(){}
	
	
	// setter and getter
	
	public int getPlanId() {
		return planId;
	}

	public void setPlanId(int planId) {
		this.planId = planId;
	}

	public String getPlanTitle() {
		return planTitle;
	}

	public void setPlanTitle(String planTitle) {
		this.planTitle = planTitle;
	}

	public String getPlanContent() {
		return planContent;
	}

	public void setPlanContent(String planContent) {
		this.planContent = planContent;
	}
	
	
	public String getPlanType() {
		return planType;
	}


	public void setPlanType(String planType) {
		this.planType = planType;
	}


	public Date getCreateTime() {
		return createTime;
	}
	
	// 获取 字符串开始时间
	public String getCreateTimeString() {
		return CommonUtils.getStringfromDate(createTime);
	}


	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}


	public Date getFinishTime() {
		return finishTime;
	}
	
	// 获取 字符串结束时间
	public String getFinishTimeString() {
		return CommonUtils.getStringfromDate(finishTime);
	}


	public void setFinishTime(Date finishTime) {
		this.finishTime = finishTime;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}
	
	public List<StudyPlanDetail> getStudyPlanDetails() {
		return studyPlanDetails;
	}

	public void setStudyPlanDetails(List<StudyPlanDetail> studyPlanDetails) {
		this.studyPlanDetails = studyPlanDetails;
	}
	
	
	public List<StudyPlanScore> getComments() {
		return comments;
	}


	public void setComments(List<StudyPlanScore> comments) {
		this.comments = comments;
	}


	public double getProgress() {
		return progress;
	}


	public void setProgress(double progress) {
		this.progress = progress;
	}

	
	public double getScore() {
		return score;
	}


	public void setScore(double score) {
		this.score = score;
	}



	@Override
	public String toString() {
		return "planId=" + planId + "&planTitle=" + planTitle + "&planType="
				+ planType + "&planContent=" + planContent + "&createTime="
				+ createTime + "&finishTime=" + finishTime + "&userid="
				+ userid + "&status=" + status + "&progress=" + progress
				+ "&score=" + score;
	}

	// 学习计划下详细执行的计划
	public List<StudyPlanDetail> studyPlanDetails ;
	
	
	// 学习计划下的评分
	public List<StudyPlanScore> comments ;
	
	
	
	
	
	
	
	
	

}