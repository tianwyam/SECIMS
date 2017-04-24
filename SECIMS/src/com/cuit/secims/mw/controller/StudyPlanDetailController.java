package com.cuit.secims.mw.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cuit.secims.mw.pojo.StudyPlanDetail;
import com.cuit.secims.mw.service.StudyPlanDetailSV;
import com.cuit.secims.mw.service.StudyPlanSV;
import com.cuit.secims.mw.util.Result;
import com.google.gson.Gson;


@Controller
@RequestMapping("res")
public class StudyPlanDetailController {
	
	
	private transient static final Logger log = Logger.getLogger(StudyPlanDetailController.class);

	
	@Autowired
	private StudyPlanDetailSV service ;
	
	@Autowired
	private StudyPlanSV planSV;
	
	
	
	// 增加 计划详情
	@RequestMapping(value="addDetail",method=RequestMethod.POST)
	public String addPlanDetail(StudyPlanDetail planDetail){
		
		int count = this.service.addPlanDetail(planDetail);
		
		if (count > 0) {
			// 每添加一个计划详情 则进度就完成 100/7 （学习计划是每周的，一周7天）
			planSV.addProgress(planDetail.getPlanId());
		}
		
		return "redirect:planDetais?planId="+planDetail.getPlanId();
		
	}
	
	
	
	// 删除 计划 详情
	@RequestMapping(value="delDetail",method=RequestMethod.POST)
	public @ResponseBody boolean deleteDetail(@RequestParam("detailId")int detailId,
			@RequestParam("planId") int planId) throws Exception{
		
		
		log.info("删除 计划 详情 : detailId = "+detailId);
		
		int count = this.service.deleteDetail(detailId);
		
		if (count > 0) {
			// 删除计划详情 的 同时，修改进度情况
			planSV.subProgress(planId);
			return true;
		}
		
		return false;
	}
	
	
	
	
	// 修改 计划 详情
	@RequestMapping(value="updateDetail",method=RequestMethod.POST)
	public @ResponseBody String modifyDetail(@RequestBody StudyPlanDetail planDetail) throws Exception{
		
		Result result = new Result();
		
		log.info("modify planDetail: "+planDetail);
		
		int count = this.service.updateDetail(planDetail);
		
		if (count > 0) {
			result.setSuccess(true);
		}
		
		return new Gson().toJson(result);
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
