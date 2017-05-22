package com.cuit.secims.mw.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cuit.secims.mw.pojo.MonthReview;
import com.cuit.secims.mw.pojo.StudyPlan;
import com.cuit.secims.mw.pojo.StudyPlanScore;
import com.cuit.secims.mw.pojo.WeekReportWork;
import com.cuit.secims.mw.service.MonthReviewSV;
import com.cuit.secims.mw.service.StudyPlanSV;
import com.cuit.secims.mw.service.WorkReportSV;
import com.cuit.secims.mw.util.Result;
import com.cuit.secims.mw.util.UserManager;
import com.google.gson.Gson;

/**
 * @Description 企业导师 管理实习生相关控制
 * @author MW
 * @date 2017-5-11 上午9:43:46
 * @version V1.0
 */
@Controller
@RequestMapping("res")
public class TutorManageController {

	
	// 学习计划相关服务
	@Autowired
	private StudyPlanSV planSV ;
	
	
	// 获取 实习生页面
	@RequestMapping("getTraineesPage")
	public ModelAndView getTraineesPage(){
		
		
		ModelAndView mav = new ModelAndView("tutor/enterpriseTrainee");
		
		return mav;
	}
	
	
	
	/** ############### 学习计划相关 ################### **/
	
	
	// 获取 实习生学习计划 界面
	@RequestMapping("getTraineePlan")
	public ModelAndView getTraineePlanPage(int traineeId){
		
		// 所有的计划
		List<StudyPlan> plans = this.planSV.getStudyPlans(traineeId);
		// 已评了的计划
		List<StudyPlan> plansWithComments = new ArrayList<StudyPlan>();
		// 没有评论的计划
		List<StudyPlan> plansWithOutComments = new ArrayList<StudyPlan>();
		//返回的视图
		ModelAndView mav = new ModelAndView("tutor/traineePlan");
		
		
		// 获取已评/未评论的计划
		for (int i = 0; plans!= null && i < plans.size(); i++) {
			if (plans.get(i).getScore() != 0) {
				plansWithComments.add(plans.get(i));
			}else {
				plansWithOutComments.add(plans.get(i));
			}
		}
		
		mav.addObject("plansWithComments", plansWithComments);
		mav.addObject("plansWithOutComments", plansWithOutComments);
		
		return mav;
	}
	
	
	
	// 获取实习生 学习计划界面
	@RequestMapping("getTraineePlanDetail")
	public ModelAndView getTraineePlanDetailPage(int planId){
		
		int userId = UserManager.getUserId();
		
		// 获取计划详情
		StudyPlan plan = planSV.getPlanByPlanIdWithDetails(planId);
		
		// 获取计划分数/企业导师的评分及评语
		List<StudyPlanScore> comments = planSV.getStudyPlanScore(planId,userId,1);
		
		// 获取企业实习生互评结果等等
		List<StudyPlanScore> traineeComments = this.planSV.getStudyPlanScore(planId, null, 0);
		// 实习生互评成绩
		double score = 0;
		// 总共评分人数
		int totalNum = traineeComments != null ? traineeComments.size() : 0 ;
		
		// 计算所有成绩之和
		for (int i = 0; traineeComments != null && i < traineeComments.size(); i++) {
			score += traineeComments.get(i).getScore();
		}
		
		
		ModelAndView mav = new ModelAndView("tutor/traineePlanDetail");
		mav.addObject("plan", plan);
		mav.addObject("comments", comments != null ? comments.get(0) : null); // 企业导师的评分及评语
		mav.addObject("score", totalNum != 0 ? (score / totalNum) : 0); // 实习生互评平均分
		mav.addObject("totalNum", totalNum); // 总人数
		
		return mav;
	}
	
	
	// 学习计划 - 导师评论
	@RequestMapping(value="tutorComment",method=RequestMethod.POST)
	public @ResponseBody String planTutorComment(@RequestParam double score,
			@RequestParam String comment,@RequestParam int planId){
		
		Result result = new Result();
		// 当前用户ID
		int tutor = UserManager.getUserId();
		
		// 企业导师打分
		int count = this.planSV.tutorComment(tutor, planId, score, 1, comment);
		if (count > 0) {
			result.setSuccess(true);
		}
		
		return new Gson().toJson(result);
	}
	
	
	
	
	
	
	
	/** ##################### 企业导师 操作 月评 相关 ######################### **/
	
	// 月评管理的服务层
	@Autowired
	private MonthReviewSV monthSV ;
	
	
	// 实习生 月评列表
	@RequestMapping("getTraineeMonth")
	public ModelAndView getTraineeMonthPage(int traineeId){
		
		// 获取实习生的月评信息
		List<MonthReview> months = this.monthSV.getMonthByUserId(traineeId);
		
		ModelAndView mav = new ModelAndView("tutor/traineeMonth");
		mav.addObject("months", months);
		
		return mav;
	}
	
	
	// 学习计划 - 导师评论
	@RequestMapping(value = "tutorMonthComment", method = RequestMethod.POST)
	public @ResponseBody String monthTutorComment(@RequestParam double score,
			@RequestParam String comment, @RequestParam int reviewId) {

		Result result = new Result();
		// 当前用户ID
		int tutor = UserManager.getUserId();

		// 企业导师打分 月评PPT
		int count = this.monthSV.tutorComment(tutor, reviewId, score, 1, comment);;
		if (count > 0) {
			result.setSuccess(true);
		}

		return new Gson().toJson(result);
	}
	
	
	
	
	
	// ########################## 企业导师 操作 工作周报相关 ############################### //
	
	// 工作周报相关服务
	@Autowired
	private WorkReportSV weeklySV ;
	
	
	// 跳转到实习生 已发送周报 列表 页面
	@RequestMapping("getTraineeWeekly")
	public ModelAndView getTraineeWeeklyPage(int traineeId){
		
		// 获取实习生 已发送的 周报列表
		List<WeekReportWork> weeklys = this.weeklySV.getWeeklyByCondition(traineeId, "F");
		
		ModelAndView mav = new ModelAndView("tutor/traineeWeekly");
		mav.addObject("weeklys", weeklys);
		mav.addObject("weeklyNum", weeklys.size());
		
		
		return mav;
	}
	
	
	
	
}
