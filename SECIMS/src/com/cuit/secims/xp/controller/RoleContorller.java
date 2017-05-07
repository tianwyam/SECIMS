package com.cuit.secims.xp.controller;

import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cuit.secims.xp.dto.TableResult;
import com.cuit.secims.xp.entity.Role;
import com.cuit.secims.xp.service.RoleService;
import com.google.gson.Gson;

@Controller
@RequestMapping("/role")
public class RoleContorller {
	@Resource
	private RoleService roleService;
	
	@RequestMapping(value="searchRole",produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getRoleList(String roleName,Model model,HttpServletResponse response){
//		model.addAttribute("roleList", roleService.getRoleByName(roleName));
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		Set<String> roles = roleService.getRoleByName(roleName);
		Gson gson = new Gson();
		String str = gson.toJson(roles);
		return str;
	}
	@RequestMapping(value="roleList",produces="application/json; charset=utf-8")
	@ResponseBody
	public String getRoleList(){
		Set<String> set = roleService.getAllRole();
		Gson gson = new Gson();
		String str = gson.toJson(set);
		System.out.println(str);
		return str;
	}
	
	@RequestMapping(value="addRole",produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public TableResult<Role> addRole(String roleName,String roleType){
		TableResult<Role> result;
		int num = roleService.addRole(roleName, roleType);
		int id = roleService.getAutoIncrement("t_role");
		if(num == 1){
			Role role = new Role(id,roleName, roleType);
			result = new TableResult<Role>(true, role);
		}else{
			result = new TableResult<Role>(false, "添加失败！");
		}
		return result;
	}
	
	@RequestMapping("removeRole")
	@ResponseBody
	public String removeRole(int roleId){
		int num = roleService.removeRole(roleId);
		if(num == 1){
			return "removeSuccess";
		}
		return "removeFail";
	}
}
