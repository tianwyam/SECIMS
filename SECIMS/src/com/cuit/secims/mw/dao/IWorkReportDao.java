package com.cuit.secims.mw.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.cuit.secims.mw.pojo.WeekReportWork;


@Repository
public interface IWorkReportDao {
	
	
	// 增加 周报
	public int addWeekly(WeekReportWork weekly) ;
	
	
	//发送周报（其实是直接把状态位改为 F ）
	public int sendWeeklytoF(int id);
	

	// 获取周报
	public List<WeekReportWork> getWeeklyAll(int userid) ;
	
	
	// 根据用户ID/状态  查询所以的已发送/保存中的周报
	public List<WeekReportWork> getWeeklyByCondition(Map map) ;
	
	
	//删除已发送周报(将状态位改为D)
	public int delWeeklyReport(int id);
	
	
	//删除草稿箱中的周报（不可恢复）
	public int delWeeklyDraftBox(int id);
	
	
}
