package com.cuit.secims.xp.service;

import java.util.Map;
import java.util.Set;

import com.cuit.secims.xp.entity.User;
import com.cuit.secims.xp.entity.UserInfo;


public interface UserService {

	/**
	 *通过用户名查找用户
	 * @param userName
	 * @return
	 */
	public User getByUserName(String userName);
	
	/**
	 *ͨ通过用户名查询角色
	 * @param userName
	 * @return
	 */
	public Set<String> getRoles(String userName);
	
	/**
	 *ͨ通过 用户名查询权限信息
	 * @param userName
	 * @return
	 */
	public Set<String> getPermissions(String userName);
	
	/**
	 * 修改密码
	 * @param user
	 */
	public void updatePassword(User user);
	
	/**
	 * 添加用户
	 * @param user
	 */
	public Integer addUser(Map<String,Object> map);
	
	public Set<String> getAllUser(Map<String,Object> map);
	
	public Set<String> findUserByName(String userName);
	
	public Integer getTotalRecords();
	
	public Integer deleteUser(String userName);
	
	public Integer addUserInfo(UserInfo userInfo);
	
	public UserInfo getUserInfoById(String userName);
	
	public Integer updateUserInfoById(UserInfo userInfo);
}
