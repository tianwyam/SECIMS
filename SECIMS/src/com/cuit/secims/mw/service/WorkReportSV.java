package com.cuit.secims.mw.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cuit.secims.mw.dao.IWorkReportDao;
import com.cuit.secims.mw.pojo.WeekReportWork;

/**
 * @Description 
 * @author MW
 * @date 2017-4-5 下午5:13:57
 * @version V1.0
 */
@Service
public class WorkReportSV {
	
	@Autowired
	private IWorkReportDao weeklyDao ;
	
	
	// 增加 周报
	public int addWeekly(WeekReportWork weekly)  {
		return this.weeklyDao.addWeekly(weekly);
	}
	
	
	
	// 获取周报
	public List<WeekReportWork> getWeeklyAll(int userid)  {
		return this.weeklyDao.getWeeklyAll(userid);
	}
	
	
	
	// 根据用户ID/状态  查询所以的已发送/保存中的周报
	public List<WeekReportWork> getWeeklyByCondition(int userid , String status) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("status", status);
		
		
		return this.weeklyDao.getWeeklyByCondition(map);
		
		
	}
	
	
	// 根据ID获取周报
	public WeekReportWork getWeeklyByWeekRepId(int weekRepId){
		return this.weeklyDao.getWeeklyByWeekRepId(weekRepId);
	}
	
	
	
	
	//删除已发送周报(将状态位改为D)
	public int delWeeklyReport(int id){
		return this.weeklyDao.delWeeklyReport(id);
	}
	
	
	
	
	
	
	//删除草稿箱中的周报（不可恢复）
	public int delWeeklyDraftBox(int id){
		return this.weeklyDao.delWeeklyDraftBox(id);
	}
	
	
	
	// 发送周报（其实是直接把状态位改为 F ）
	public int sendWeeklytoF(int id) {
		return this.weeklyDao.sendWeeklytoF(id);
	}
	
	
	
	
	
	

}
