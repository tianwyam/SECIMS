package com.cuit.secims.xp.service.impl;

import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cuit.secims.xp.dao.RoleDao;
import com.cuit.secims.xp.service.RoleService;

@Service("roleService")
public class RoleServiceImpl implements RoleService {
	
	@Resource
	private RoleDao roleDao;
	
	public Set<String> getAllRole() {
		return roleDao.getAllRole();
	}
	
	public Set<String> getRoleByName(String roleName) {
		return roleDao.getRoleByName(roleName);
	}
	
	public Integer addRole(String roleName,String roleType){
		return roleDao.addRole(roleName, roleType);
	}
	
	public Integer removeRole(Integer roleId){
		return roleDao.removeRole(roleId);
	}
	
	public int getAutoIncrement(String tableName){
		return roleDao.getAutoIncrement(tableName);
	}

}
