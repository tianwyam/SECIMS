package com.cuit.secims.xp.service.impl;

import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cuit.secims.xp.dao.UserDao;
import com.cuit.secims.xp.entity.User;
import com.cuit.secims.xp.entity.UserInfo;
import com.cuit.secims.xp.service.UserService;


@Service("userService")
public class UserServiceImpl implements UserService{

	@Resource
	private UserDao userDao;
	
	public User getByUserName(String userName) {
		return userDao.getByUserName(userName);
	}

	public Set<String> getRoles(String userName) {
		return userDao.getRoles(userName);
	}

	public Set<String> getPermissions(String userName) {
		return userDao.getPermissions(userName);
	}

	public void updatePassword(User user) {
		userDao.updatePassword(user);
	}

	public Integer addUser(Map<String,Object> map) {
		return userDao.addUser(map);
	}

	public Set<String> getAllUser(Map<String,Object> map) {
		return userDao.getAllUser(map); 
	}

	public Set<String> findUserByName(String userName) {
		return userDao.findUserByName(userName);
	}

	public Integer getTotalRecords() {
		return userDao.getTotalRecords();
	}
	
	public Integer deleteUser(String userName){
		return userDao.deleteUser(userName);
	}

	@Override
	public UserInfo getUserInfoById(String userName) {
		Integer id = userDao.getUserIdByName(userName);
		System.out.println("id="+id);
		return userDao.getUserInfoById(id);
	}

	@Override
	public Integer updateUserInfoById(UserInfo userInfo) {
		return userDao.updateUserInfoById(userInfo);
	}

	@Override
	public Integer addUserInfo(UserInfo userInfo) {
		return userDao.addUserInfo(userInfo);
	}

}
