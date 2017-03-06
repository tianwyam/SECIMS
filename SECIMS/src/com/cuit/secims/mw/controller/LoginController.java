package com.cuit.secims.mw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginController {
	
	
	
	// 登陆
	@RequestMapping("login")
	public @ResponseBody String hello(String username,String password){
		
		
			return "hello "+username+",your password is: "+password;
	}


}
