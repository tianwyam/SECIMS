package com.cuit.secims.xp.entity;

import java.util.Date;

public class ProjectDoc {
	private int projectId;
	private String documents;
	private String docName;
	private String operator;
	private Date createTime;
	public ProjectDoc() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProjectDoc(int projectId, String documents, String operator,
			Date createTime) {
		super();
		this.projectId = projectId;
		this.documents = documents;
		this.operator = operator;
		this.createTime = createTime;
	}
	public int getProjectId() {
		return projectId;
	}
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	public String getDocuments() {
		return documents;
	}
	public void setDocuments(String documents) {
		this.documents = documents;
	}
	public String getOperator() {
		return operator;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getDocName() {
		return documents.substring(documents.lastIndexOf("/")+1);
	}
	public void setDocName(String docName) {
		this.docName = docName;
	}
	
}
