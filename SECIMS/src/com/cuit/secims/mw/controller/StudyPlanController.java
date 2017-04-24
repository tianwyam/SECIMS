package com.cuit.secims.mw.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cuit.secims.mw.pojo.StudyPlan;
import com.cuit.secims.mw.service.StudyPlanSV;
import com.cuit.secims.mw.util.Result;
import com.google.gson.Gson;

@Controller
@RequestMapping("res")
public class StudyPlanController {
	
	
	private transient static final Logger log = Logger.getLogger(StudyPlanController.class);

	@Autowired
	private StudyPlanSV service;
	
	
	// 获取学习计划列表
	@RequestMapping(value = "getStudyPlans", method = RequestMethod.GET)
	public ModelAndView getStudyPlans(HttpServletRequest request,
			HttpServletResponse response) {

		List<StudyPlan> plans = this.service.getStudyPlans(1); // 先定义 userid = 1
		
		
		Gson gson = new Gson();
		String json = gson.toJson(plans);
		
		log.info("plans: "+json );

		ModelAndView mav = new ModelAndView("plan");

		mav.addObject("plans", plans);

		return mav;

	}
	
	
	// 跳转到 增加 学习计划 界面
	@RequestMapping(value="getAddPlanPage",method=RequestMethod.GET)
	public String getAddPlanPage(){
		return "planAdd";
	}
	
	

	// 增加学习计划
	@RequestMapping(value = "addPlan", method = RequestMethod.POST)
	public String addPlan(StudyPlan plan , Model model) throws Exception {
		
		Result result = new Result();
		String viewName = "";

		plan.setUserid(1); // 此处以后有用户了再做修改
		
		log.info("addPlan : "+plan);
		
		// 获取正在执行的 计划 总数
		int plansNum = this.service.getPlansNumByUserIdAndStatus(1,"E");
		
		log.info("学习计划的总数有： "+plansNum);
		
		if (plansNum > 0) {
			result.setSuccess(false);
			result.setMsg("还有未完成的学习计划，请先完成后，再来添加！！");
			
			viewName =  "planAdd" ;
		}else {
			// 没有 未完成 的任务，所以可以添加
			int count = this.service.addStudyPlan(plan);
			
			if (count > 0) {
				viewName = "redirect:getStudyPlans" ;
			}
		}
		
		model.addAttribute("result", result);
		
		return viewName;
	}
	
	
	// 删除计划 只删除一条
	@ResponseBody
	@RequestMapping(value="delPlan",method=RequestMethod.POST)
	public boolean delPlan(@RequestParam(value="planId")int planId ){
		
		// 删除计划
		int count = this.service.delPlan(planId);
		
		if (count > 0) {
			return true;
		}
		
		return false;
		
	}
	
	
	

	// 批量删除 学习计划 （通过 planIds）
	@ResponseBody
	// 返回到请求处，而不是逻辑视图名
	@RequestMapping(value = "delPlanByIDs", method = RequestMethod.POST)
	public void delPlansByIDs(@RequestParam(value = "data") int[] ids,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String result = "N";

		int count = this.service.delStudyPlansByIDs(ids);

		if (count > 0) {
			result = "Y";
		}

		response.getWriter().write(result);

	}
	

	
	// 跳转到 增加 学习计划 界面
	@RequestMapping(value="getPlanModifyPage",method=RequestMethod.GET)
	public String getPlanModifyPage(){
		return "planModify";
	}
		
	
	// 修改 学习计划
	@RequestMapping(value="modifyPlan",method=RequestMethod.POST)
	public @ResponseBody String modifyPlan(@RequestBody StudyPlan plan){
		
		Result result = new Result();
		
		
		// 修改 学习计划
		int count = this.service.updatePlan(plan);
		
		if (count > 0) {
			result.setSuccess(true);
		}
		
		return new Gson().toJson(result);
		
	}
	
	
	
	// 获取学习计划 及 详细
	@RequestMapping(value="getStudyPlanDetails",method=RequestMethod.GET)
	public ModelAndView getStudyPlanDetails(){
		
		List<StudyPlan> planWithDetails = this.service.getPlanWithDetails(1); // 此处以后有用户ID时替换
		
		ModelAndView mad = new ModelAndView("studyPlanDetail");
		mad.addObject("planDetails", planWithDetails);
		
		return mad;
	}
	
	
	// 获取学习计划 及 详细
	@RequestMapping(value="planDetais",method=RequestMethod.GET)
	public ModelAndView readPlan(@RequestParam(value="planId")int planId){
		
		
		StudyPlan plan = this.service.getPlanByPlanIdWithDetails(planId) ;
		
		log.info("plan : "+plan) ;
		
		ModelAndView mad = new ModelAndView("planDetail");
		mad.addObject("plan", plan);
		// 存放 计划详情 数量
		mad.addObject("detailsNum", plan.getStudyPlanDetails() != null ? plan.getStudyPlanDetails().size() : 0);
		
		return mad;
	}
	
	
	
	
	// 修改 学习计划 状态
	@RequestMapping(value="revisePlanStatus",method=RequestMethod.POST)
	public @ResponseBody String revisePlanStatus(@RequestParam(value="planId")int planId,
			@RequestParam(value="status")String status){
		
		Result result = new Result();
		
		log.info("要修改的计划ID："+planId+" , 它的状态是："+status);
		
		int count = this.service.revisePlanStatus(planId, status);
		if (count > 0) {
			result.setSuccess(true);
		}
		
		
		return new Gson().toJson(result);
	}


	
	/**
	 * 跳转到 学习计划 互评 页面
	 * @return
	 */
	@RequestMapping(value="getPlanEvaluation",method=RequestMethod.GET)
	public ModelAndView getPlanEvaluationPage(){
		
		// 获取不是本人的计划 来 评估
		List<StudyPlan> plans = this.service.getPlansWithDetailsAndUser(0);
		
		ModelAndView mad = new ModelAndView("planEvaluation");
		mad.addObject("plans", plans);
		
		return mad;
	}
	
	
	

}
