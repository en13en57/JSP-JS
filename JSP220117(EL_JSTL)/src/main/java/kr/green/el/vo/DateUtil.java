package kr.green.el.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	public static String getDate1(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
		return sdf.format(date);
	}
	public static String getDate2(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
		return sdf.format(date);
	}
	public static String getTime1(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("hh:mm");
		return sdf.format(date);
	}
	public static String getTime2(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("hh:mm:ss");
		return sdf.format(date);
	}
		public static String getNow(Date date) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일(E요일) hh:mm:ss");
			return sdf.format(date);
	}
		
}
