package com.cuit.secims.mw.util;

import java.io.File;
import java.io.OutputStream;

import org.docx4j.Docx4J;
import org.docx4j.convert.out.HTMLSettings;
import org.docx4j.openpackaging.packages.WordprocessingMLPackage;

/**
 * 操作word文档工具类
 */
public class Docx4jUtil {
	
	
	public static void  main(String[] args) throws Exception {
		
		String docxPath = "‪F:\\MW\\AsiaInfo\\工作周报第一周(7.8).docx";
		String htmlPath = "F:\\MW\\AsiaInfo";
		
		DocxToHTML(docxPath, htmlPath);
		
	}
	
	
	
	@SuppressWarnings("deprecation")
	public static void DocxToHTML(String docxPath, String htmlPath) throws Exception{
		
		
		File wordfile = new File(docxPath);
		
		WordprocessingMLPackage wordMLPackage = WordprocessingMLPackage.load(wordfile);

    	HTMLSettings htmlSettings = Docx4J.createHTMLSettings();
    	
    	htmlSettings.setWmlPackage(wordMLPackage);
    	
//    	htmlSettings.setImageDirPath(dir + inputfilepath + "_files");
//    	htmlSettings.setImageTargetUri(dir + inputfilepath + "_files");
    	
    	String userCSS = "html, body, div, span, h1, h2, h3, h4, h5, h6, p, a, img,  ol, ul, li,"+
    			" table, caption, tbody, tfoot, thead, tr, th, td " +
    			"{ margin: 0; padding: 0; border: 0;}" +
    			"body {line-height: 1;} " ;
    	
    	htmlSettings.setUserCSS(userCSS);
    	
    	String htmlFilePath = htmlPath + "/123.html";
		OutputStream os = new java.io.FileOutputStream(htmlFilePath);


		
		Docx4J.toHTML(htmlSettings, os, Docx4J.FLAG_EXPORT_PREFER_NONXSL);
		
		os.close();
	}
	

}
