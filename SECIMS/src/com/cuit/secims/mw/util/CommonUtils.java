package com.cuit.secims.mw.util;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

/**
 * @Description 
 * @author MW
 * @date 2017-4-7 下午4:17:06
 * @version V1.0
 * 处理乱码、日期转换等功能
 */
public class CommonUtils {
	
	
	private static String[] weekly = {"星期天","星期一","星期二","星期三","星期四","星期五","星期六"};
	
	
	
	
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
	
	
	
	/**
	 * 获取日期形式的字符串格式
	 * @param time 要转换的日期
	 * @param pattern 格式
	 * @return
	 */
	public  static String getStringfromDate(Date time,String pattern){
		
		// 获取的字符串格式是 yyyy年MM月dd日 HH:mm:ss(EEE)
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		
		return sdf.format(time);
		
	}
	
	
	
	/**
	 * 获取当前系统时间是星期几
	 * @return int
	 */
	public static int getWeek4System(){
		
		// 获取当前时间
		Date date = new Date();
		
		Calendar calender = Calendar.getInstance();
		calender.setTime(date);
		
		// 获取星期
		int weekIndex = calender.get(Calendar.DAY_OF_WEEK) - 1;
		
		if (weekIndex < 0) {
			weekIndex = 0;
		}
		
		
		System.out.println("当前系统时间是： "+weekly[weekIndex]);
		
		return weekIndex;
	}
	
	
	/**
	 * 判断当前时间是上午还是下午
	 * @return 
	 * 		true 上午
	 * 		false 下午
	 */
	public static boolean getIsAM4System(){
		
		GregorianCalendar calendar = new GregorianCalendar();
		
		// 结果: 0是上午  1是下午  
		int am = calendar.get(GregorianCalendar.AM_PM);
		
		if (am == 0) {
			return true;
		}
		
		return false;
	}
	
	
	
	
	
	public static void getUser(){
		
		Subject subject = SecurityUtils.getSubject();
		Session session = subject.getSession();
		Object info = session.getAttribute("info");
		
		System.out.println("当前信息： "+info);
		
	}
	
	
	

}
