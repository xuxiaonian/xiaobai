package com.huazhuo.shop.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtils {

	public static Date getStartTime(Date date) {
		Calendar todayStart = Calendar.getInstance();
		todayStart.setTime(date);
		todayStart.set(Calendar.HOUR, 0);
		todayStart.set(Calendar.MINUTE, 0);
		todayStart.set(Calendar.SECOND, 0);
		todayStart.set(Calendar.MILLISECOND, 0);
		return todayStart.getTime();
	}

	public static Date getEndTime(Date date) {
		if(date==null){
			return date;
		}
		Calendar todayEnd = Calendar.getInstance();
		todayEnd.setTime(date);
		todayEnd.set(Calendar.HOUR, 23);
		todayEnd.set(Calendar.MINUTE, 59);
		todayEnd.set(Calendar.SECOND, 59);
		todayEnd.set(Calendar.MILLISECOND, 999);
		return todayEnd.getTime();
	}

	public static Date getNextDay() {
		Calendar c = Calendar.getInstance();
		c.add(Calendar.DAY_OF_MONTH, 1);
		return c.getTime();
	}

	public static Date lastMonday() {
		Calendar c = Calendar.getInstance();
		c.add(Calendar.WEEK_OF_YEAR, -1);
		c.set(Calendar.DAY_OF_WEEK, 1);
		return c.getTime();
	}

	public static Date lastSunday() {
		Calendar c = Calendar.getInstance();
		c.add(Calendar.WEEK_OF_YEAR, 0);
		c.set(Calendar.DAY_OF_WEEK, 1);
		return c.getTime();
	}

	public static Date lastMonthFirst() {
		Calendar c = Calendar.getInstance();
		c.add(Calendar.MONTH, -1);
		c.set(Calendar.DAY_OF_MONTH, 0);
		return c.getTime();
	}

	public static Date lastMonthLast() {
		Calendar c = Calendar.getInstance();
		c.add(Calendar.MONTH, 0);
		c.set(Calendar.DAY_OF_MONTH, 0);
		return c.getTime();
	}

	public static Date getReportEndDay(Date date) {
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM");
		String start = f.format(date) + "-01";
		return parseDate(start);
	}

	public static Date parseDate(String start) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date date = df.parse(start);
			return date;
		} catch (ParseException e) {
			throw new RuntimeException(e);
		}
	}

	public static Date addtDay(int i) {
		Calendar c = Calendar.getInstance();
		c.add(Calendar.DAY_OF_MONTH, i);
		return c.getTime();
	}

	public static Date addtDay(Date date ,int i) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.add(Calendar.DAY_OF_MONTH, i);
		//TODO
		//c.add(Calendar.MINUTE, i);
		return c.getTime();
	}
	
	public static Date addtMinute(Date date ,int i) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.add(Calendar.MINUTE, i);
		return c.getTime();
	}
	
	public static Date getActionEndTime(Date date, int minute) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.add(Calendar.MINUTE, minute);
		date = c.getTime();
		return date;
	}

	public static Date getNextDay(Date date) {
		Calendar c = getCalendar(date);
		c.add(Calendar.DAY_OF_MONTH, 1);
		return c.getTime();
	}

	public static Date getPreDay(Date date) {
		Calendar c = getCalendar(date);
		c.add(Calendar.DAY_OF_MONTH, -1);
		return c.getTime();
	}

	public static Date getNowDateShort() throws ParseException {
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String dateString = formatter.format(currentTime);
		return formatter.parse(dateString);

	}

	public static Date addMonth(Date date, int number) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.add(Calendar.MONTH, number);

		date = c.getTime();
		return date;
	}

	public static Date addMonthDown(Date date, int number) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.add(Calendar.MONTH, number);
		c.add(Calendar.DAY_OF_MONTH, -1);
		date = c.getTime();
		return date;
	}

	public static long monthdaysBetween(Date begin, Date end) {
		long monthday;
		try {
			Calendar starCal = Calendar.getInstance();
			starCal.setTime(begin);
			int sYear = starCal.get(Calendar.YEAR);
			int sMonth = starCal.get(Calendar.MONTH);
			int sDay = starCal.get(Calendar.DATE);
			Calendar endCal = Calendar.getInstance();
			endCal.setTime(end);
			int eYear = endCal.get(Calendar.YEAR);
			int eMonth = endCal.get(Calendar.MONTH);
			int eDay = endCal.get(Calendar.DATE);
			monthday = ((eYear - sYear) * 12 + (eMonth - sMonth));
			if (sDay < eDay) {
				monthday = monthday + 1;
			}
		} catch (Exception e) {
			monthday = 0;
		}
		return monthday;
	}

	public static Date getDateFromStringtwo(String strDate) {
		SimpleDateFormat simple = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		if (StringUtils.isBlank(strDate)) {
			return new Date();
		}
		Date date = null;
		try {
			date = simple.parse(strDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return date;
	}

	public static Date getDateFromString(String strDate) {
		SimpleDateFormat simple = new SimpleDateFormat("yyyyMMddHHmmss");
		Date date = null;
		try {
			date = simple.parse(strDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return date;
	}

	public static Date getDateFromStringByYYMMDD(String strDate) {
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = simple.parse(strDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return date;
	}

	public static String getDateFromString(Date date) {
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
		String newDate = simple.format(date);
		return newDate;
	}

	public static String getDateFromStringHHMMSS(Date date) {
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String newDate = simple.format(date);
		return newDate;
	}

	public static String getDateFromStringHHMM(Date date) {
		SimpleDateFormat simple = new SimpleDateFormat("HH:mm");
		String newDate = simple.format(date);
		return newDate;
	}
	
	public static String getDateFromString(Date date, String formate) {
		SimpleDateFormat simple = new SimpleDateFormat(formate);
		String newDate = simple.format(date);
		return newDate;
	}

	public static Calendar getCalendar(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar;
	}

	public static Integer getMonth(Date date) {
		return DateUtils.getCalendar(date).get(Calendar.MONTH) + 1;
	}

	public static Integer getDay(Date date) {
		return DateUtils.getCalendar(date).get(Calendar.DAY_OF_MONTH);
	}

	public static Date setDay(Date date, Integer day) {
		Calendar calendar = getCalendar(date);
		calendar.set(Calendar.DAY_OF_MONTH, day);
		return calendar.getTime();
	}

	public static Integer getYear(Date date) {
		return DateUtils.getCalendar(date).get(Calendar.YEAR);
	}

	public static String formateDate(Integer i) {
		if (10 > i) {
			return "0" + i;
		}
		return i.toString();
	}

	public static Date getMonthFirstDateByDate(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.set(Calendar.DAY_OF_MONTH, 1);
		return c.getTime();
	}

	public static Date getMonthLastDateByDate(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.set(Calendar.DAY_OF_MONTH, c.getMaximum(Calendar.DAY_OF_MONTH));
		return c.getTime();
	}

	public static int getDifferMonthDate(Date startDate, Date endDate) {
		Calendar startCalendar = DateUtils.getCalendar(startDate);
		Calendar endCalendar = DateUtils.getCalendar(endDate);
		int count = 0;
		if (endCalendar.get(Calendar.DAY_OF_MONTH) >= startCalendar.get(Calendar.DAY_OF_MONTH)) {
			count += 1;
		}
		count += endCalendar.get(Calendar.MONTH) - startCalendar.get(Calendar.MONTH);
		count += (endCalendar.get(Calendar.YEAR) - startCalendar.get(Calendar.YEAR)) * 12;
		return count;
	}

	public static boolean compareDate(Date firstDate, Date lastDate) {
		if (lastDate.after(firstDate) || lastDate.equals(firstDate))
			return true;
		return false;
	}

	public static int compareDate1(Date dt1, Date dt2) {
        try {
            if (dt1.getTime() > dt2.getTime()) {
                return 1;
            } else if (dt1.getTime() < dt2.getTime()) {
                return -1;
            } else {
                return 0;
            }
        } catch (Exception exception) {
            exception.printStackTrace();
        }
        return 0;
    }
}
