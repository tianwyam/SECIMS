package com.cuit.secims.xp.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cuit.secims.xp.entity.Project;
import com.cuit.secims.xp.entity.ProjectDoc;
import com.cuit.secims.xp.service.ProjectService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
public class ProjectController {
	
	@Resource
	private ProjectService projectService;
	
	@RequestMapping("addProject")
	public String addProject(Project project,HttpServletRequest request){
		MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest) request;
		//获取项目路径
		ServletContext sc = request.getSession().getServletContext();
		
		String objectPath = "E:/springUpload/";
		File f = new File(objectPath);
		//文件夹不存在则创建
		if(!f.exists()){
			f.mkdirs();
		}
//		String path = objectPath+mRequest.getFile("file").getOriginalFilename();
//		project.setDocuments(path);
		
		Iterator iter = mRequest.getFileNames();
		while(iter.hasNext()){
			MultipartFile file = mRequest.getFile(iter.next().toString());
			try {
				String path = objectPath+mRequest.getFile("file").getOriginalFilename();
				file.transferTo(new File(path));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		projectService.addProject(project);
		return "projectList";
	}
	
	@RequestMapping("addProject1")
	public String addProject1(Project project, HttpServletRequest request,
			@RequestParam("file") CommonsMultipartFile[] files){
//		//获取项目路径
//		ServletContext sc = request.getSession().getServletContext();
//		//文件存放位置
//		String path = sc.getRealPath("/upload")+"/";
		System.out.println("project: "+project);
		//本地路径
		String path = "E:/upload/"+project.getProjectName()+"/";
		File file = new File(path);
		if(!file.exists()){
			file.mkdirs();
		}
		String tableName = "t_project";
		project.setId(projectService.getAutoIncrement(tableName));
		for(int i = 0; i < files.length; i++){
			//获取(设置)文件名
			String fileName = project.getProjectName()+"_"+files[i].getOriginalFilename();
			System.out.println(path+fileName);
			if(!files[i].isEmpty()){
				try {
					FileOutputStream fos = new FileOutputStream(path+fileName);
					InputStream in = files[i].getInputStream();
					int b = 0;
					while((b = in.read()) != -1){
						fos.write(b);
					}
					fos.close();
					in.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("projectId", project.getId());
				map.put("documents",path+fileName);
				map.put("operator",project.getPostName());
				projectService.addProjectDoc(map);
			}
		}
		projectService.addProject(project);
		return "projectList";
	}
	
	@RequestMapping("projectList")
	public ModelAndView getProjectList(){
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", 1);
		mav.addObject("projectList1",projectService.getProjectList(map));
		map.put("status", 2);
		mav.addObject("projectList2",projectService.getProjectList(map));
		map.put("status", 3);
		mav.addObject("projectList3",projectService.getProjectList(map));
		mav.setViewName("resource/views/newViews/admin/projectList");
		return mav;
	}
	
	@RequestMapping(value="projectListByStaus",produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getProjectListByStatus(){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", 1);
		List<String> list = projectService.getProjectList(map);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
//		System.out.println("list: "+list);
		String str = gson.toJson(list);
//		System.out.println("gson: "+str);
		return str;
	}
	
	@RequestMapping(value="/{projectId}/listFile")
	public String getProjectInfoById(@PathVariable("projectId") int projectId,Model model){
		model.addAttribute("project",projectService.getProjectInfoById(projectId));
		List<ProjectDoc> docList = projectService.getProjectDocById(projectId);
		model.addAttribute("projectDoc",docList);
		return "resource/views/newViews/projectInfo";
	}
	
	@RequestMapping(value="/{projectId}/delete")
	@ResponseBody
	public String deleteProject(@PathVariable("projectId") int projectId){
		projectService.deleteProject(projectId);
		return "deletSuccess";
	}
	
	@RequestMapping(value="/update",produces = "application/json; charset=utf-8")
	@ResponseBody
	public String updateProject(HttpServletRequest request){
		String json = request.getParameter("project");
//		System.out.println(json);
		Gson gson = new Gson();
		Project project = gson.fromJson(json, Project.class);
		System.out.println("project:"+project);
		int num = projectService.updateProjectById(project);
		if(num == 1){
			return "updateSuccess";
		}
		return "updateFail";
	}
	
	@RequestMapping("/updateProReceiver")
	@ResponseBody
	public String updateProReceiver(String receiver,Integer projectId){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("receiver", receiver);
		map.put("projectId", projectId);
		int num = projectService.updateProReceiver(map);
		if(num == 1){
			return "addsuccess";
		}else{
			return "addfail";
		}
	}
	
	@RequestMapping(value="/{name}/proListByReceiver",produces="application/json;charset=utf-8")
	@ResponseBody
	public String getProjectInfoByReceiver(@PathVariable("name") String name){
		Set<String> set = projectService.getProjectInfoByReceiver(name);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String str = gson.toJson(set);
		return str;
	}
}
