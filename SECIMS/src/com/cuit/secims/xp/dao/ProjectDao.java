package com.cuit.secims.xp.dao;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.cuit.secims.xp.entity.Project;
import com.cuit.secims.xp.entity.ProjectDoc;

public interface ProjectDao {
	public int addProject(Project project);
	
	public List<String> getProjectList(Map<String,Object> map);
	
	public Project getProjectInfoById(Integer projectId);
	
	public List<ProjectDoc> getProjectDocById(Integer projectId);
	
	public int addProjectDoc(Map<String,Object> map);
	
	public int getAutoIncrement(String tableName);
	
	public int deleteProject(Integer projectId);
	
	public int deleteProjectDoc(Integer projectId);
	
	public int updateStatus(Map<String,Object> map);
	
	public int updateProjectById(Project project);
	
	public int updateProReceiver(Map<String,Object> map);
	
	public Set<String> getProjectInfoByReceiver(String name);
}
