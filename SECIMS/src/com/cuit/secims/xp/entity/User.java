package com.cuit.secims.xp.entity;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class User {

	private Integer id;
	private String userName;
	private String password;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")  
	private Date createTime;
	private String role;
	
	
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(String userName, Date createTime, String role) {
		super();
		this.userName = userName;
		this.createTime = createTime;
		this.role = role;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
}
