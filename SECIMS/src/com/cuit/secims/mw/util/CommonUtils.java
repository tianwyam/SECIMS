package com.cuit.secims.mw.util;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Description 
 * @author MW
 * @date 2017-4-7 下午4:17:06
 * @version V1.0
 * 处理乱码、日期转换等功能
 */
public class CommonUtils {
	
	
	
	
	/**
	 * 处理中文乱码问题
	 * @param str 待处理的字符串
	 * @return
	 */
	public static String dealStringEncoding(String str){
		
		String tmp = null;
		
		try {
			tmp =  new String(str.toString().getBytes("ISO8859_1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return tmp;
	}
	
	
	
	
	
	/**
	 * 日期转换成字符串格式：
	 * 获取的字符串格式是 yyyy年MM月dd日 HH:mm:ss(EEE)
	 * @param time 要转换的Date类型的时间
	 * @return 返回格式化后的字符串
	 */
	public  static String getStringfromDate(Date time){
		
		// 获取的字符串格式是 yyyy年MM月dd日 HH:mm:ss(EEE)
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss(EEE)");
		
		return sdf.format(time);
		
	}
	
	
	
	
	
	
	
	

}
