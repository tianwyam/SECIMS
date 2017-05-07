package com.cuit.secims.xp.service;

import java.util.Set;

public interface RoleService {
	public Set<String> getAllRole();
	
	public Set<String> getRoleByName(String roleName);
	
	public Integer addRole(String roleName,String roleType);
	
	public Integer removeRole(Integer roleId);
	
	public int getAutoIncrement(String tableName);
}
