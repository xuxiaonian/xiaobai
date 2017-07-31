package com.huazhuo.shop.util;

import java.util.Calendar;
import java.util.Date;

/**
 * 获取定时器表达式
 * @author Administrator
 *
 */
public class CronExpression {
	
	public static String getCronExpression(Date date){
		Calendar now = Calendar.getInstance();
		now.setTime(date);
		String cronExpression =now.get(Calendar.SECOND)+" "+now.get(Calendar.MINUTE)+" "+now.get(Calendar.HOUR_OF_DAY)+" "+now.get(Calendar.DAY_OF_MONTH)+" "+(now.get(Calendar.MONTH) + 1)+" ? "+now.get(Calendar.YEAR);//59 50 19 15 3 ? 2017
		return cronExpression;
	}
}
