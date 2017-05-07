package com.cuit.secims.xp.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cuit.secims.xp.dao.ProjectDao;
import com.cuit.secims.xp.entity.Project;
import com.cuit.secims.xp.entity.ProjectDoc;
import com.cuit.secims.xp.service.ProjectService;

@Service("projectService")
public class ProjectServiceImpl implements ProjectService {

	@Resource
	private ProjectDao projectDao;
	
	public int addProject(Project project) {
		return projectDao.addProject(project);
	}

	public List<String> getProjectList(Map<String,Object> map) {
		return projectDao.getProjectList(map);
	}
	
	public Project getProjectInfoById(Integer projectId){
		return projectDao.getProjectInfoById(projectId);
	}
	
	public List<ProjectDoc> getProjectDocById(Integer projectId){
		return projectDao.getProjectDocById(projectId);
	}
	
	public int addProjectDoc(Map<String,Object> map){
		return projectDao.addProjectDoc(map);
	}

	public int getAutoIncrement(String tableName){
		return projectDao.getAutoIncrement(tableName);
	}
	
	@Transactional
	public int deleteProject(Integer projectId){
		projectDao.deleteProject(projectId);
		projectDao.deleteProjectDoc(projectId);
		return 1;
	}

	@Override
	public int updateProjectById(Project project) {
		return projectDao.updateProjectById(project);
	}

	@Override
	@Transactional
	public int updateProReceiver(Map<String, Object> map) {
		Map<String,Object> map1 = new HashMap<String, Object>();
		map1.put("status", 2);
		map1.put("id", map.get("projectId"));
		projectDao.updateStatus(map1);
		return projectDao.updateProReceiver(map);
	}

	@Override
	public Set<String> getProjectInfoByReceiver(String name) {
		return projectDao.getProjectInfoByReceiver(name);
	}
}
