package com.cuit.secims.mw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cuit.secims.xp.dao.impl.UserDaoImpl;
import com.cuit.secims.xp.dao.interfaces.UserDao;
import com.cuit.secims.xp.domin.User;

@Controller
public class LoginController {
	
	
	
	// 登陆 + 页面
	@RequestMapping("login")
	public @ResponseBody String hello(String username,String password){
		UserDao userDao = new UserDaoImpl();
		User user = userDao.findUserByName(username);
		return "hello "+username+",your password is: "+password;
	}


}
