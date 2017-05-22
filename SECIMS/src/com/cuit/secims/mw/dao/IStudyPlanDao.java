package com.cuit.secims.mw.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.cuit.secims.mw.pojo.StudyPlan;
import com.cuit.secims.mw.pojo.StudyPlanScore;


@Repository
public interface IStudyPlanDao {
	
	
	// 获取 全部 的 学习计划
	public List<StudyPlan> getStudyPlans(int userid);

	
	// 批量删除 学习计划 （通过 planIds）
	public int delStudyPlansByIDs(int[] ids);
	
	
	// 删除 计划 
	public int delPlan(int id);
	
	
	// 增加学习计划
	public int addStudyPlan(StudyPlan plan);
	
	
	// 修改 学习计划
	public int updatePlan(StudyPlan plan);
	
	// 获取学习计划 及 详细
	public List<StudyPlan> getPlanWithDetails(int userid);
	
	
	/**
	 *  获取学习计划 及详情和用户信息 （去掉userid 它自己的计划/供评估其他人的计划）
	 * @param userid 要去掉的用户ID
	 * @return 其他人的计划
	 */
	public List<StudyPlan> getPlansWithDetailsAndUser(int userid) ;
	
	
	
	public List<StudyPlan> getPlanWithDetailsAndComments(Map map) ;
	
	// 根据 planId 获取 学习计划 及 详细
	public StudyPlan getPlanByPlanIdWithDetails(int planId);
	
	
	// 修改 学习计划 状态
	public int revisePlanStatus(Map map);
	
	
	// 修改 完成进度 状态/增加
	public int addProgress(int planId);
	
	// 修改 完成进度 状态/减少
	public int subProgress(int planId);
	
	
	// 输出 正在执行的计划数量
	public int getPlansNumByUserIdAndStatus(Map map);
	
	
	// 批量修改成绩
	public int updateScores(List<Map<String, Object>> list);
	
	// 修改成绩
	public int updateScore(Map map);
	
	// 批量修改成绩/打分
	public int insertScores(List list);
	
	
	
	
	
	
	
	
	
	
	//###################### 企业导师 操作 学习计划相关  ##########################
	
	
	// 学习计划 - 企业导师 打分评论
	public int tutorAddComment(Map map);
	
	// 学习计划 - 企业导师 修改打分评论
	public int tutorModifyComment(Map map);
	
	// 判断 导师 是否已经评论了
	public int isExistsComment(Map map);
	
	// 获取评论打分
	public List<StudyPlanScore> getStudyPlanScore(Map map);
	
	
	
	
}
