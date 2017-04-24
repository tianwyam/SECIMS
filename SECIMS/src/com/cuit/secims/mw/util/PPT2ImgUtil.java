package com.cuit.secims.mw.util;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics2D;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.imageio.ImageIO;

import org.apache.log4j.Logger;
import org.apache.poi.hslf.model.Slide;
import org.apache.poi.hslf.model.TextRun;
import org.apache.poi.hslf.usermodel.RichTextRun;
import org.apache.poi.hslf.usermodel.SlideShow;
import org.apache.poi.xslf.usermodel.XMLSlideShow;
import org.apache.poi.xslf.usermodel.XSLFShape;
import org.apache.poi.xslf.usermodel.XSLFSlide;
import org.apache.poi.xslf.usermodel.XSLFTextParagraph;
import org.apache.poi.xslf.usermodel.XSLFTextRun;
import org.apache.poi.xslf.usermodel.XSLFTextShape;


/**
 * PPT转换成图片 工具类
 */
public class PPT2ImgUtil {
	
	
	private transient static final Logger log = Logger.getLogger(PPT2ImgUtil.class);
	
	
	
	/**
	 * ppt2003 文档的转换 后缀名为.ppt
	 * @param pptFile ppt文件
	 * @param imgFile 图片将要保存的目录（不是文件）
	 * @return
	 */
	public static boolean doPPT2003toImage(File pptFile,File imgFile,List<String> list) {
			
		
		try {

			FileInputStream is = new FileInputStream(pptFile);
			SlideShow ppt = new SlideShow(is);
			
			//及时关闭掉 输入流
			is.close();
			
			Dimension pgsize = ppt.getPageSize();
			Slide[] slide = ppt.getSlides();
			
			for (int i = 0; i < slide.length; i++) {
				
				log.info("第" + i + "页。");

				TextRun[] truns = slide[i].getTextRuns();
				
				for (int k = 0; k < truns.length; k++) {
					
					RichTextRun[] rtruns = truns[k].getRichTextRuns();
					
					for (int l = 0; l < rtruns.length; l++) {
						
						// 原有的字体索引 和 字体名字
						int index = rtruns[l].getFontIndex();
						String name = rtruns[l].getFontName();
						
						log.info("原有的字体索引 和 字体名字: "+index+" - "+name);
						
						// 重新设置 字体索引 和 字体名称
						rtruns[l].setFontIndex(1);
						rtruns[l].setFontName("宋体");
					}
					
				}
				
				//根据幻灯片大小生成图片
				BufferedImage img = new BufferedImage(pgsize.width,pgsize.height+20, BufferedImage.TYPE_INT_RGB);
				Graphics2D graphics = img.createGraphics();
				
				graphics.setPaint(Color.white);
				graphics.setBackground(Color.white);
				graphics.fill(new Rectangle2D.Float(0, 0, pgsize.width,pgsize.height+50));
				slide[i].draw(graphics);

				// 图片的保存位置
				String absolutePath = imgFile.getAbsolutePath()+"/"+ (i + 1) + ".jpeg";
				File jpegFile = new File(absolutePath);
				// 图片路径存放
				list.add((i + 1) + ".jpeg");
				
				// 如果图片存在，则不再生成
				if (jpegFile.exists()) {
					continue;
				}
				
				// 这里设置图片的存放路径和图片的格式(jpeg,png,bmp等等),注意生成文件路径
				FileOutputStream out = new FileOutputStream(jpegFile);
				
				ImageIO.write(img, "jpeg", out);
				
				out.close();
				
			}
			
			log.error("PPT转换成图片 成功！");
			
			return true;
			
		} catch (Exception e) {
			log.error("PPT转换成图片 发生异常！", e);
		}
		
		return false;
		
	}

	
	
	
	/**
	 * ppt2007文档的转换 后缀为.pptx
	 * @param pptFile PPT文件
	 * @param imgFile 图片将要保存的路径目录（不是文件）
	 * @param list 存放文件名的 list
	 * @return
	 */
	public static boolean doPPT2007toImage(File pptFile,File imgFile,List<String> list) {
		
		
		FileInputStream is = null ;
		
        
        try {
        	
            is = new FileInputStream(pptFile);
            
            XMLSlideShow xmlSlideShow = new XMLSlideShow(is);
            
            is.close();
            
            // 获取大小
            Dimension pgsize = xmlSlideShow.getPageSize();
            
            // 获取幻灯片
            XSLFSlide[] slides = xmlSlideShow.getSlides();
            
            for (int i = 0 ; i < slides.length ; i++) {
            	
            	
            	// 解决乱码问题
            	XSLFShape[] shapes = slides[i].getShapes();
            	for (XSLFShape shape : shapes) {
            		
					if (shape instanceof XSLFTextShape) {
						XSLFTextShape sh = (XSLFTextShape) shape;
						List<XSLFTextParagraph> textParagraphs = sh.getTextParagraphs();
						
						for (XSLFTextParagraph xslfTextParagraph : textParagraphs) {
							List<XSLFTextRun> textRuns = xslfTextParagraph.getTextRuns();
							for (XSLFTextRun xslfTextRun : textRuns) {
								xslfTextRun.setFontFamily("宋体");
							}
						}
					}
				}
            	
            	
            	//根据幻灯片大小生成图片
				BufferedImage img = new BufferedImage(pgsize.width,pgsize.height+50, BufferedImage.TYPE_INT_RGB);
				Graphics2D graphics = img.createGraphics();
				
				graphics.setPaint(Color.white);
				graphics.setBackground(Color.white);
				graphics.fill(new Rectangle2D.Float(0, 0, pgsize.width,pgsize.height+50));
				
				// 最核心的代码
				slides[i].draw(graphics);

				//图片将要存放的路径
				String absolutePath = imgFile.getAbsolutePath()+"/"+ (i + 1) + ".jpeg";
				File jpegFile = new File(absolutePath);
				// 图片路径存放
				list.add((i + 1) + ".jpeg");
				
				//如果图片存在，则不再生成
				if (jpegFile.exists()) {
					continue;
				}
				// 这里设置图片的存放路径和图片的格式(jpeg,png,bmp等等),注意生成文件路径
				FileOutputStream out = new FileOutputStream(jpegFile);
				
				// 写入到图片中去
				ImageIO.write(img, "jpeg", out);
				
				out.close();
            	
            }
            
            
            log.error("PPT转换成图片 成功！");
            
            return true;
            
        } catch (Exception e) {
        	log.error("PPT转换成图片 发生异常！", e);
        } 
        
        
        return false;

    }

	
	
	/**
	 * PPT转换成图片
	 * @param PPTFilePath
	 * @param imgFilePath
	 * @return
	 */
	public static boolean doPPT2Img(String PPTFilePath, String imgFilePath,List<String> imgURList) {
		
		boolean isSuccess = false;

		// PPT 文件
		File pptFile = new File(PPTFilePath);
		// 将要生成的图片文件
		File imgFile = new File(imgFilePath);


		if (pptFile.exists()) {
			
			
			// 图片路径不存在，则创建
			if (!imgFile.exists()) {
				imgFile.mkdirs();
			}else {
				// 存在图片，则直接获取，不用去转换
				String[] list = imgFile.list();
				if(list != null && list.length > 0){
					
					//深拷贝  //浅拷贝 Arrays.asList(list)
					for (String name : list) {
						imgURList.add(name);
					}
					
					// 对 list 排序
					Collections.sort(imgURList,new Comparator<String>(){

						@Override
						public int compare(String o1, String o2) {
							
							String nameA = o1.split("\\.")[0];
							String nameB = o2.split("\\.")[0];
							
							int intA = Integer.parseInt(nameA);
							int intB = Integer.parseInt(nameB);
							
							return intA-intB;
						}
						
					});

					return true;
				}
			}

			String filename = pptFile.getName();
			String suffixname = null;

			if (filename != null && filename.indexOf(".") != -1) {

				suffixname = filename.substring(filename.indexOf("."));

				// 如果是PPT2003 后缀为.ppt 如果是PPT2007 后缀为.pptx 
				if (".ppt".equals(suffixname)) {
					isSuccess = doPPT2003toImage(pptFile, imgFile,imgURList);
				}else if (".pptx".equals(suffixname)) {
					isSuccess = doPPT2007toImage(pptFile, imgFile,imgURList);
				}
			}
			

		} else {
			
			log.error("将要转换的文件不是PPT文件格式或者不存在！");

			isSuccess = false;
		}

		
		return isSuccess;

	}
	
	
	
	
}
