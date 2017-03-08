package com.cuit.secims.mw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cuit.secims.mw.service.UserSV;
import com.cuit.secims.xp.dao.impl.UserDaoImpl;
import com.cuit.secims.xp.dao.interfaces.UserDao;
import com.cuit.secims.xp.domin.User;

@Controller
public class LoginController {
	
	@Autowired
	private UserSV service ;
	
	// 登陆 + 页面
	@RequestMapping("login")
	public void hello(String username,String password){
//		UserDao userDao = new UserDaoImpl();
//		User user = userDao.findUserByName(username);
//		return "hello "+username+",your password is: "+password;
		
		System.out.println("hello "+username+",your password is: "+password);
		
		System.out.println(" +++++++++++++ ");
		
		List<com.cuit.secims.mw.pojo.User> users = this.service.getAll();
		
		for (com.cuit.secims.mw.pojo.User user : users) {
			System.out.println(user);
		}
		
	}

	
	
	

}
