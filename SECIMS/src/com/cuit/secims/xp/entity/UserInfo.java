package com.cuit.secims.xp.entity;

public class UserInfo {
	private Integer id;
	private String actualName;
	private String email;
	private String phone;
	public UserInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UserInfo(Integer id, String actualName, String email, String phone) {
		super();
		this.id = id;
		this.actualName = actualName;
		this.email = email;
		this.phone = phone;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getActualName() {
		return actualName;
	}
	public void setActualName(String actualName) {
		this.actualName = actualName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "UserInfo [id=" + id + ", actualName=" + actualName + ", email="
				+ email + ", phone=" + phone + "]";
	}
	
	
}
