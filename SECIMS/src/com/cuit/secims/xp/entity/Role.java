package com.cuit.secims.xp.entity;

public class Role {
	private Integer id;
	private String roleName;
	private String type;
	
	public Role() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	public Role(String roleName, String type) {
		super();
		this.roleName = roleName;
		this.type = type;
	}



	public Role(Integer id, String roleName, String type) {
		super();
		this.id = id;
		this.roleName = roleName;
		this.type = type;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
}	
