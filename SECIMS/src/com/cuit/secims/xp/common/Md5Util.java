package com.cuit.secims.xp.common;

import org.springframework.util.DigestUtils;

/**
 * md5 加密工具
 * @author xp-zhao
 *
 */
public class Md5Util {
	private final static String slat = "ASDFSA@#$";
	
	public static String getMd5(String str){
		String base = str+"/"+slat;
		String md5 = DigestUtils.md5DigestAsHex(base.getBytes());
		return md5;
	}
	
	public static void main(String[] args){
		System.out.println(getMd5("000000"));
	}
}
