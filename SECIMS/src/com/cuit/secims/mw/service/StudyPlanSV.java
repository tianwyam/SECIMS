package com.cuit.secims.mw.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cuit.secims.mw.dao.IStudyPlanDao;
import com.cuit.secims.mw.pojo.StudyPlan;
import com.cuit.secims.mw.pojo.StudyPlanScore;

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

	
	/**
	 * 获取 学习计划及详情和评分评语
	 * @param userId 要获取学习计划的用户ID
	 * @param roleType 获取评分评语的用户类型 0：实习生 1：企业导师 2：实习生管理员/经理
	 * @return
	 */
	public List<StudyPlan> getPlanWithDetailsAndComments(int userId,int roleType) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("roleType", roleType);
		
		List<StudyPlan> plans = this.plansDao.getPlanWithDetailsAndComments(map);
		
		for (int i = 0; plans != null && i < plans.size(); i++) {
			
			// 判断详情是否为空
			if (plans.get(i) != null && plans.get(i).getStudyPlanDetails() != null 
					&& plans.get(i).getStudyPlanDetails().get(0).getPlanDetailTitle() == null) {
				plans.get(i).setStudyPlanDetails(null);
			}
			
			// 判断评分评语是否为空
			if (plans.get(i) != null && plans.get(i).getComments() != null 
					&& plans.get(i).getComments().get(0).getScoreId() == 0) {
				plans.get(i).setComments(null);
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

	
	
	
	// 批量修改成绩
	public int updateScores(Double[] scores, int[] planIds){
		
		
		int len = planIds.length;
		List<Map<String, Object>> list = new ArrayList<>();
		
		for (int i = 0; i < len; i++) {
			
			HashMap<String, Object> map = new HashMap<>();
			map.put("planId", planIds[i]);
			map.put("score", scores[i]);
			list.add(map);		
		}
		
		
		return this.plansDao.updateScores(list);
	}
	
	
	/**
	 * 修改成绩/表示已经评分了
	 * @param planId 学习计划ID
	 * @param score 评分
	 * @return
	 */
	public int updateScore(int planId,double score){
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("planId", planId);
		map.put("score", score);
		
		return this.plansDao.updateScore(map);
	}
	
	
	
	/**
	 * 批量修改成绩/打分
	 * @param scores 分数数组
	 * @param planIds 计划ID数组
	 * @param userId 用户ID
	 * @param roleType 角色类型（0：实习生，1：企业导师，2：企业经理）
	 * @return
	 */
	public int insertScores(Double[] scores, int[] planIds, int userId, int roleType){
		
		ArrayList<StudyPlanScore> list = new ArrayList<>();
		int len = planIds.length;
		
		for (int i = 0; i < len; i++) {
			StudyPlanScore studyPlanScore = new StudyPlanScore(planIds[i], userId, roleType, scores[i]);
			list.add(studyPlanScore);
		}
		
		return this.plansDao.insertScores(list);
	}
	
	
	
	
	
	
	//###################### 企业导师 操作 学习计划相关  ##########################
	
	/**
	 * 学习计划 - 企业导师 打分评论
	 * 其中包含了先判断是否已打分，如果没有，则打分；有，则修改打分
	 * @param userId 用户ID
	 * @param planId 学习计划ID
	 * @param score 分数
	 * @param roleType 角色类型（0：实习生  1：企业导师  2：实习生管理员/经理）
	 * @param comment 评语
	 * @return
	 */
	public int tutorComment(int userId,int planId,double score,int roleType,String comment){
		
		int count = 0;
		
		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("planId", planId);
		map.put("score", score);
		map.put("roleType", roleType);
		map.put("comment", comment);
		
		int isExists = this.plansDao.isExistsComment(map);
		// 存在，则修改；不存在，则插入
		if (isExists > 0) {
			// 修改 打分
			count = this.plansDao.tutorModifyComment(map);
		}else {
			// 打分
			count = this.plansDao.tutorAddComment(map);
		}
		
		// 修改计划中的评分/表示已评过了
		updateScore(planId, score);
		
		return count;
	}
	
	
	
	/**
	 * 获取评论打分(包括企业导师和实习生互评的打分及评语)
	 * @param planId 学习计划ID
	 * @param userId 用户ID
	 * @param roleType 角色类型（0：实习生/1：企业导师/2：实习生管理员-经理）
	 * @return 
	 */
	public List<StudyPlanScore> getStudyPlanScore(Integer planId,Integer userId, Integer roleType){
		
		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("planId", planId);
		map.put("roleType", roleType);
		
		return this.plansDao.getStudyPlanScore(map);
	}
	
	
	
	
	
	
	
	
	
}
