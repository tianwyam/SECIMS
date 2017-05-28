package com.cuit.secims.mw.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.cuit.secims.mw.pojo.MonthReview;
import com.cuit.secims.mw.pojo.MonthReviewResult;

/**
 * 月评管理
 */
@Repository
public interface IMonthReviewDao {
	
	
	
	// 根据 userID 获取 月评状况
	public List<MonthReview> getMonthByUserId(int userid);
	
	// 根据 reviewId获取月评信息
	public MonthReview getMonthByReviewId(int reviewId);
	
	
	// 增加月评详情
	public int addMonthReview(MonthReview month);
	
	
	
	// 删除 上传的月评PPT情况
	public int delMonth(int id);
	
	// 获取级联数据  月评信息+月评评论成绩表
	public List<MonthReview> getMonthResult(Map map);
	
	
	//###################### 企业导师 操作 月评PPT 相关  ##########################
	
	// 月评PPT - 企业导师 打分评论
	public int tutorMonthAddComment(Map map);

	// 月评PPT - 企业导师 修改打分评论
	public int tutorMonthModifyComment(Map map);

	// 判断 导师 是否已经评论了 月评PPT
	public int isExistsMonthComment(Map map);
	
	// 获取 月评 评论
	public MonthReviewResult getMonthReviewResult(Map map) ;

}
