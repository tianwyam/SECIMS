package com.cuit.secims.mw.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cuit.secims.mw.dao.IStudyPlanDetailDao;
import com.cuit.secims.mw.pojo.StudyPlanDetail;


@Service
public class StudyPlanDetailSV {
	
	@Autowired
	private IStudyPlanDetailDao planDetailDao;

	
	// 增加 计划详情
	public int addPlanDetail(StudyPlanDetail planDetail){
		
		return this.planDetailDao.addPlanDetail(planDetail);
		
	}
	
	
	
	//删除 计划 详情
	public int deleteDetail(int id) throws Exception {
		return this.planDetailDao.deleteDetail(id);
	}
	
	
	// 修改 计划 详情
	public int updateDetail(StudyPlanDetail planDetail) throws Exception {
		return this.planDetailDao.updateDetail(planDetail);
	}

}
