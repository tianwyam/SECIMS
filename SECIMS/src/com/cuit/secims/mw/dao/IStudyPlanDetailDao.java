package com.cuit.secims.mw.dao;

import com.cuit.secims.mw.pojo.StudyPlanDetail;

public interface IStudyPlanDetailDao {
	
	// 添加 学习计划详情
	public int addPlanDetail(StudyPlanDetail planDetail);
	
	
	// 删除 计划 详情
	public int deleteDetail(int id) throws Exception;
	
	
	// 修改 计划 详情
	public int updateDetail(StudyPlanDetail planDetail) throws Exception;
	

}
