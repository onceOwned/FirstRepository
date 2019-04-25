package com.cz.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class TimeResult {
	public static void main(String[] args) throws ParseException {
		String time1 = "2019-02-02 9:30";
		String time2 = "2019-02-23 10:30:34";
//		String time = getDatePoor(time1, time2);
//		System.out.println(time);
		System.out.println(getTime(time2));
//		System.out.println(getNowtime());
	}
	
	//返回date类型时间--》数据库
	public static Date getTime(String time) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date =null;
		try {
			 date = simpleDateFormat.parse(time);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return date;
	}
	
	//返回数据库totaltime
	public static String getDatePoor(String startTime,String endTime) throws ParseException{
			String totalTime="";
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date startDate = simpleDateFormat.parse(startTime);
			Date endDate = simpleDateFormat.parse(endTime);
			long nd = 1000 * 24 * 60 * 60;
		    long nh = 1000 * 60 * 60;
		    long nm = 1000 * 60;
		    // long ns = 1000;
		    // 获得两个时间的毫秒时间差异
		    long diff = endDate.getTime() - startDate.getTime();
		    // 计算差多少天
		    long day = diff / nd;
		    // 计算差多少小时
		    long hour = diff % nd / nh;
		    // 计算差多少分钟
		    long min = diff % nd % nh / nm;
		    // 计算差多少秒//输出结果
		    // long sec = diff % nd % nh % nm / ns;
		    totalTime = day + "day" + hour + "hours";
		    return totalTime;
	}
	
	
	//获取当前系统时间
	public static String getNowtime() {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = simpleDateFormat.format(new Date());
		return time;
	}

}
