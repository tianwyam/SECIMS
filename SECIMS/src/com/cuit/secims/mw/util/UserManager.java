package com.cuit.secims.mw.util;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import com.cuit.secims.xp.entity.User;

/**
 * @Description 用户管理
 * @author MW
 * @date 2017-5-16 上午9:11:59
 * @version V1.0
 */
public class UserManager {

	
	private transient static final Logger log = Logger.getLogger(UserManager.class);
	
	
	
	/**
	 * 获取用户信息
	 * @return User 用户
	 */
	public static User getUser() {

		Subject subject = SecurityUtils.getSubject();
		Session session = subject.getSession();
		User user = (User)session.getAttribute("user");

		log.info("用户信息： user "+user);
		
		return user;
		
	}
	
	
	
	/**
	 * 获取用户ID
	 * @return 用户ID
	 */
	public static int getUserId(){
		
		Subject subject = SecurityUtils.getSubject();
		Session session = subject.getSession();
//		User user = (User)session.getAttribute("user");
//		
//		int userId = 0;
//
//		log.info("用户信息： user "+user);
//		
//		if (user != null) {
//			userId =  user.getId();
//		}
//		
//		return userId;
		
		log.info("用户ID： "+session.getAttribute("userId"));
		
		return (Integer)session.getAttribute("userId");
		
	}
	
	
	
	

}
