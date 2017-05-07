package com.cuit.secims.xp.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cuit.secims.xp.common.Constant;
import com.cuit.secims.xp.common.DateUtil;
import com.cuit.secims.xp.common.Md5Util;
import com.cuit.secims.xp.dto.TableResult;
import com.cuit.secims.xp.entity.User;
import com.cuit.secims.xp.entity.UserInfo;
import com.cuit.secims.xp.service.UserService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;



@Controller
@RequestMapping("/user")
public class UserController {

	@Resource
	private UserService userService;
	/**
	 * 用户登录
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping("/login")
	public String login(User user,HttpServletRequest request){
		Subject subject=SecurityUtils.getSubject();
		UsernamePasswordToken token=new UsernamePasswordToken(user.getUserName(), Md5Util.getMd5(user.getPassword()));
		try{
			subject.login(token);
			Session session=subject.getSession();
			System.out.println("sessionId:"+session.getId());
			System.out.println("sessionHost:"+session.getHost());
			System.out.println("sessionTimeout:"+session.getTimeout());
			session.setAttribute("info", "session的数据");
			if(subject.hasRole("trainee")){
				return "redirect:/res/index.jsp";
			}
			return "redirect:/resource/index.jsp";
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("user", user);
			request.setAttribute("errorMsg", "用户名或密码错误！");
			return "login";
		}
	}
	
	/**
	 * 密码修改
	 * @param newPassword
	 * @return
	 */
	@RequestMapping("modPassword")
	@ResponseBody
	public String modPassword(String username,String oldPwd,String newPwd){
//		Subject subject = SecurityUtils.getSubject();
//		String userName = subject.getPrincipals().toString(); //获取当前登录用户
		User user = userService.getByUserName(username);
		if(user == null){
			return "nouser";
		}
		if(!user.getPassword().equals(Md5Util.getMd5(oldPwd))){
			return "pwderror";
		}else{
			user.setPassword(Md5Util.getMd5(newPwd));
			userService.updatePassword(user);
		}
		return "success";
	}
	
	@RequestMapping(value="userList",produces="application/json;charset=utf-8")
	@ResponseBody
	public String getAllUser(){
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("start", null);
		map.put("size", null);
		Set<String> set = userService.getAllUser(map);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		String str = gson.toJson(set);
		System.out.println(str);
		return str;
	}
	
	@RequestMapping("findUserByName")
	@ResponseBody
	public String findUserByName(String userName){
		int num = userService.findUserByName(userName).size();
		if(num == 1){
			return "exist";
		}else{
			return "no";
		}
	}
	
	@RequestMapping("addUser")
	@ResponseBody
	@Transactional
	public TableResult<User> addUser(String userName,int roleId){
		TableResult<User> result;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userName", userName);
		map.put("password", Md5Util.getMd5(Constant.DEFAULT_PWD));
		map.put("roleId",roleId);
		int num = userService.addUser(map);
		if(num == 1){
			User user = userService.getByUserName(userName);
			UserInfo userInfo = new UserInfo(user.getId(), user.getUserName(), "", "");
			userService.addUserInfo(userInfo);
			result = new TableResult<User>(true, user);
		}else{
			result = new TableResult<User>(false, "添加失败");
		}
		return result;
	}
	
	@RequestMapping("removeUser")
	@ResponseBody
	public String removeUser(String userName){
		userService.deleteUser(userName);
		return "removeSuccess";
	}
	
	@RequestMapping("userInfo")
	public ModelAndView getUserInfoById(String userName){
//		System.out.println(userName);
		ModelAndView mav = new ModelAndView();
		mav.addObject("userInfo", userService.getUserInfoById(userName));
		mav.setViewName("resource/views/newViews/personalInfo");
		return mav;
	}
	
	@RequestMapping(value="updateInfo",produces="application/json;charset=utf-8")
	@ResponseBody
	public String updateInfo(HttpServletRequest request){
		String json = request.getParameter("userInfo");
		System.out.println("json="+json);
		Gson gson = new Gson();
		UserInfo userInfo = gson.fromJson(json, UserInfo.class);
		System.out.println("userInfo="+userInfo);
		userService.updateUserInfoById(userInfo);
		return "updateSuccess";
	}
}
