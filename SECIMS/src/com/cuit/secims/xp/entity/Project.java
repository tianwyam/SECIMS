package com.cuit.secims.xp.entity;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Project {
	private Integer id;
	private String projectName;
	private String instruction;
//	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	private Date finishDate;
	private String postName;
	private String phone;
	private Integer status = 1;
	
	public Project() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Project(Integer id, String projectName, String instruction,
			Date finishDate, String postName, String phone,
			Integer status) {
		super();
		this.id = id;
		this.projectName = projectName;
		this.instruction = instruction;
		this.finishDate = finishDate;
		this.postName = postName;
		this.phone = phone;
		this.status = status;
	}
	


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getInstruction() {
		return instruction;
	}

	public void setInstruction(String instruction) {
		this.instruction = instruction;
	}

	public Date getFinishDate() {
		return finishDate;
	}

	public void setFinishDate(Date finishDate) {
		this.finishDate = finishDate;
	}

	public String getPostName() {
		return postName;
	}

	public void setPostName(String postName) {
		this.postName = postName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
	


	@Override
	public String toString() {
		return "Project [id=" + id + ", projectName=" + projectName
				+ ", instruction=" + instruction + ", finishDate=" + finishDate
				+ ", postName=" + postName + ", phone=" + phone + ", status="
				+ status + "]";
	}
}
