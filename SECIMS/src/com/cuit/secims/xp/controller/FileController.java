package com.cuit.secims.xp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FileController {
	/**
	 * 获取所有文档
	 * @param request
	 * @return
	 */
	@RequestMapping("/listFile")
	public String listFile(HttpServletRequest request){
		//项目路径
		ServletContext sc = request.getSession().getServletContext();
		//文件路径
		String path = sc.getRealPath("/upload")+"/";
		//存储上传的所有文件名
		Map<String,String> fileNameMap = new HashMap<String, String>();
		//递归遍历path目录下所有文件和目录，将文件的文件名存储到map集合中
		listFile(new File(path), fileNameMap);
		request.setAttribute("fileNameMap", fileNameMap);
		return "resource/views/newViews/projectInfo";
	}
	
	public void listFile(File file,Map<String,String> map){
		//如何file不是一个文件，而是目录
		if(!file.isFile()){
			//列出该目录下所有的文件和目录
			File[] files = file.listFiles();
			//遍历files[]数组
			for(File f : files){
				//递归
				listFile(f, map);
			}
		}else{
			map.put(file.getName(), file.getName());
		}
	}
	
	/**
	 * 下载文档
	 * @param request
	 * @param response
	 */
	@RequestMapping("downFile")
	public void downFile(HttpServletRequest request,HttpServletResponse response,String fileName){
		try {
//			ServletContext sc = request.getSession().getServletContext();
//			//文件位置
//			String filePath = sc.getRealPath("/upload");
//			//要下载的文件
//			File file = new File(filePath+"\\"+fileName);
			File file = new File(fileName);
			if(!file.exists()){
				request.setAttribute("message", "文件已被删除");
				return;
			}
			//设置响应头，控制浏览器下载文件
			response.setHeader("content-disposition", "attachment;fileName="
					+URLEncoder.encode(fileName.substring(fileName.lastIndexOf("/")+1), "UTF-8"));
			//读取要下载的文件，保存到文件输入流
//			FileInputStream in = new FileInputStream(filePath+"\\"+fileName);
			
			FileInputStream in = new FileInputStream(fileName);
			//创建输出流
			OutputStream out = response.getOutputStream();
			//创建缓冲区
			byte[] buffer = new byte[1024];
			int len = 0;
			while((len = in.read(buffer)) > 0){
				out.write(buffer,0,len);
			}
			in.close();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
