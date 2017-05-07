package com.cuit.secims.xp.common;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	public static String format(Date date){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String str = format.format(date);
		return str;
	}
}
