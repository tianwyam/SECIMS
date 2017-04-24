package com.cuit.secims.mw.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cuit.secims.mw.dao.IStudyPlanDao;
import com.cuit.secims.mw.pojo.StudyPlan;

@Service
public class StudyPlanSV {

	@Autowired
	private IStudyPlanDao plansDao;

	public List<StudyPlan> getStudyPlans(int userid) {
		return this.plansDao.getStudyPlans(userid);
	}

	// 批量删除 学习计划 （通过 planIds）
	public int delStudyPlansByIDs(int[] ids) {
		return this.plansDao.delStudyPlansByIDs(ids);
	}
	
	
	// 删除 计划 
	public int delPlan(int id){
		return this.plansDao.delPlan(id);
	}

	
	
	// 增加学习计划
	public int addStudyPlan(StudyPlan plan) {
		return this.plansDao.addStudyPlan(plan);
	}
	
	
	
	
	// 修改 学习计划
	public int updatePlan(StudyPlan plan){
		return this.plansDao.updatePlan(plan);
	}
	
	
	
	// 获取学习计划 及 详细
	public List<StudyPlan> getPlanWithDetails(int userid){
		
		List<StudyPlan> plans = this.plansDao.getPlanWithDetails(userid);
		
		// 去掉  左连接 后 形成的空详细 
		for (StudyPlan studyPlan : plans) {
			if (studyPlan.getStudyPlanDetails().get(0).getPlanDetailTitle() == null ) {
				studyPlan.setStudyPlanDetails(null) ;
			}
		}
		
		return plans;
	}
	
	
	
	// 根据 planId 获取 学习计划 及 详细
	public StudyPlan getPlanByPlanIdWithDetails(int planId){
		
		StudyPlan plan = this.plansDao.getPlanByPlanIdWithDetails(planId);
		
		if (plan != null && plan.getStudyPlanDetails() != null && plan.getStudyPlanDetails().get(0).getPlanDetailTitle() == null) {
			plan.setStudyPlanDetails(null);
		}
		
		return plan;
	}
	
	
	
	/**
	 *  获取学习计划 及详情和用户信息 （去掉userid 它自己的计划/供评估其他人的计划）
	 * @param userid 要去掉的用户ID
	 * @return 其他人的计划
	 */
	public List<StudyPlan> getPlansWithDetailsAndUser(int userid) {
		
		List<StudyPlan> plans = this.plansDao.getPlansWithDetailsAndUser(userid);
		for (int i = 0; i < plans.size(); i++) {
			
			if (plans.get(i) != null && plans.get(i).getStudyPlanDetails() != null 
					&& plans.get(i).getStudyPlanDetails().get(0).getPlanDetailTitle() == null) {
				plans.get(i).setStudyPlanDetails(null);
			}
		}
		
		return plans;
		
	}

	
	
	// 修改 学习计划 状态
	public int revisePlanStatus(int planId, String status){
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("planId", planId);
		map.put("status", status);
		
		return this.plansDao.revisePlanStatus(map);
		
	}
	
	
	// 修改 完成进度 状态/增加
	public int addProgress(int planId) {

		return this.plansDao.addProgress(planId);
	}
	
	// 修改 完成进度 状态/减少
	public int subProgress(int planId) {
		
		return this.plansDao.subProgress(planId);
	}
	
	
	// 输出 正在执行的计划数量
	public int getPlansNumByUserIdAndStatus(int userid, String status) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("status", status);
		
		
		return this.plansDao.getPlansNumByUserIdAndStatus(map);
	}

}
