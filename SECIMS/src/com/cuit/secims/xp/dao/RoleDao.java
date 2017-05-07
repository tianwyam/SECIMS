package com.cuit.secims.xp.dao;

import java.util.Set;

import org.apache.ibatis.annotations.Param;

public interface RoleDao {
	public Set<String> getAllRole();
	
	public Set<String> getRoleByName(String roleName);
	
	public Integer addRole(@Param("roleName") String roleName,@Param("roleType") String roleType);
	
	public Integer removeRole(Integer roleId);
	
	public int getAutoIncrement(String tableName);
}
