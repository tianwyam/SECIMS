package com.cuit.secims.mw.pojo;

import java.io.Serializable;
import java.util.Date;

import com.cuit.secims.mw.util.CommonUtils;

/**
 * @Description 学习计划详细表
 */
public class StudyPlanDetail implements Serializable{
	
	private static final long serialVersionUID = 7218371834273697735L;
	
	private int planDetailId ; // 学习计划详细表ID
	private int  planId ; // 学习计划ID
	
	
	private String planDetailTitle ; // 学习计划详细表标题
	private String planDetailContent ; // 学习计划详细表内容
	
	private Date createTime ; // 创建时间
	private Date finishTime ; //完成时间
	
	private String status ; //状态 F：完成/ E：正在执行
	
	
	// 无参构造函数
	public StudyPlanDetail(){}


	
	// setter and getter 
	
	public int getPlanDetailId() {
		return planDetailId;
	}


	public void setPlanDetailId(int planDetailId) {
		this.planDetailId = planDetailId;
	}


	public int getPlanId() {
		return planId;
	}


	public void setPlanId(int planId) {
		this.planId = planId;
	}


	public String getPlanDetailTitle() {
		return planDetailTitle;
	}


	public void setPlanDetailTitle(String planDetailTitle) {
		this.planDetailTitle = planDetailTitle;
	}



	public String getPlanDetailContent() {
		return planDetailContent;
	}


	public void setPlanDetailContent(String planDetailContent) {
		this.planDetailContent = planDetailContent;
	}
	

	public Date getCreateTime() {
		return createTime;
	}
	
	// 返回创建时间的字符串格式
	public String getCreateTimeString() {
		return CommonUtils.getStringfromDate(createTime);
	}



	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}


	public Date getFinishTime() {
		return finishTime;
	}
	
	// 返回结束时间的字符串格式
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


	@Override
	public String toString() {
		return planDetailId + "&" + planId + "&" + planDetailTitle + "&"
				+ planDetailContent + "&" + createTime + "&" + finishTime + "&"
				+ status;
	}


}
