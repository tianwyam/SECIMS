package com.cuit.secims.xp.dao;

import java.util.Map;
import java.util.Set;

import com.cuit.secims.xp.entity.User;
import com.cuit.secims.xp.entity.UserInfo;


public interface UserDao {

	/**
	 * ͨ通过用户名查找用户
	 * @param userName
	 * @return
	 */
	public User getByUserName(String userName);
	
	/**
	 * ͨ通过用户名查询角色
	 * @param userName
	 * @return
	 */
	public Set<String> getRoles(String userName);
	
	/**
	 * ͨ通过 用户名查询权限信息
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
	
	/**
	 * 获取所有用户
	 * @return
	 */
	public Set<String> getAllUser(Map<String,Object> map);
	
	/**
	 * 根据姓名模糊查找用户
	 * @return
	 */
	public Set<String> findUserByName(String userName);
	
	public Integer getTotalRecords();
	
	public Integer deleteUser(String userName);
	
	public Integer addUserInfo(UserInfo userInfo);
	
	public Integer getUserIdByName(String userName);
	
	public UserInfo getUserInfoById(Integer id);
	
	public Integer updateUserInfoById(UserInfo userInfo);
}
