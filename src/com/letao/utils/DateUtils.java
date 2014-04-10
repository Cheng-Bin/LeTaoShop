package com.letao.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 
 * @author ChengBin
 *
 */
public class DateUtils {

	public static Date date;
	
	public static Date getCurrentDate() {
		try {
			date = new Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			return format.parse(format.format(date));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
}
