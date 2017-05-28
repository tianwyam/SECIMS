package com.cuit.secims.mw.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cuit.secims.mw.dao.IMonthReviewDao;
import com.cuit.secims.mw.pojo.MonthReview;
import com.cuit.secims.mw.pojo.MonthReviewResult;

@Service
public class MonthReviewSV {
	
	@Autowired
	private IMonthReviewDao dao;
	
	
	
	// 根据 userID 获取 月评状况
	public List<MonthReview> getMonthByUserId(int userid){
		return this.dao.getMonthByUserId(userid);
	}
	
	
	// 根据 reviewId获取月评信息
	public MonthReview getMonthByReviewId(int reviewId){
		return this.dao.getMonthByReviewId(reviewId);
	}
	
	
	// 增加月评详情
	public int addMonthReview(MonthReview month){
		return this.dao.addMonthReview(month);
	}
	
	
	
	// 删除 上传的月评PPT情况
	public int delMonth(int id){
		return this.dao.delMonth(id);
	}
	
	
	
	/**
	 * 获取级联数据  月评信息+月评评论成绩表
	 * @param userId 被查询月评的用户ID
	 * @param roleType 查询评论月评的用户类型（1：企业导师/2：企业经理）
	 * @return 
	 */
	public List<MonthReview> getMonthResult(int userId, int roleType){
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("roleType", roleType);
		
		return this.dao.getMonthResult(map);
	}
	
	
	//###################### 企业导师 操作 月评PPT ##########################
	
	
	/**
	 * 月评PPT - 企业导师评语打分
	 * @param userId 导师用户ID
	 * @param reviewId 要评论的月评ID
	 * @param score result结果分数
	 * @param roleType 角色类型（1：企业导师/2实习生管理员-经理）
	 * @param comment 评语
	 * @return
	 */
	public int tutorComment(int userId,int reviewId,double score,int roleType,String comment){
		
		int count = 0;
		
		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("reviewId", reviewId);
		map.put("result", score);
		map.put("roleType", roleType);
		map.put("comment", comment);
		
		int isExists = this.dao.isExistsMonthComment(map);
		// 存在，则修改；不存在，则插入
		if (isExists > 0) {
			// 修改 打分
			count = this.dao.tutorMonthModifyComment(map);
		}else {
			// 打分
			count = this.dao.tutorMonthAddComment(map);
		}
		
		return count;
	}
	
	
	/**
	 * 获取 月评 评论
	 * @param userId 用户ID
	 * @param reviewId 月评ID
	 * @param roleType 角色类型（1：企业导师/2：企业经理）
	 * @return 月评评分及评语
	 */
	public MonthReviewResult getMonthReviewResult(Integer userId,Integer reviewId,Integer roleType) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("reviewId", reviewId);
		map.put("roleType", roleType);
		
		return this.dao.getMonthReviewResult(map);
	}
	
	
	
	
	
	

}
