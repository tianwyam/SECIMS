package com.cuit.secims.mw.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cuit.secims.mw.pojo.MonthReview;

/**
 * 月评管理
 */
@Repository
public interface IMonthReviewDao {
	
	
	
	// 根据 userID 获取 月评状况
	public List<MonthReview> getMonthByUserId(int userid);
	
	
	// 增加月评详情
	public int addMonthReview(MonthReview month);
	
	
	
	// 删除 上传的月评PPT情况
	public int delMonth(int id);
	

}
