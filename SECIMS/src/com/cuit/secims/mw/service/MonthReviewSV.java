package com.cuit.secims.mw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cuit.secims.mw.dao.IMonthReviewDao;
import com.cuit.secims.mw.pojo.MonthReview;

@Service
public class MonthReviewSV {
	
	@Autowired
	private IMonthReviewDao dao;
	
	
	
	// 根据 userID 获取 月评状况
	public List<MonthReview> getMonthByUserId(int userid){
		return this.dao.getMonthByUserId(userid);
	}
	
	
	// 增加月评详情
	public int addMonthReview(MonthReview month){
		return this.dao.addMonthReview(month);
	}
	
	
	
	// 删除 上传的月评PPT情况
	public int delMonth(int id){
		return this.dao.delMonth(id);
	}

}
