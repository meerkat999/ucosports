package co.com.meerkats.hotelturin.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

	public final static String FORMATO_UNO = "yyyy/MM/dd";
	public final static String FORMATO_DOS = "yyyy/MM/dd HH:mm:ss";
	
	public static String dateToString(Date date, String format){
		String dateString = "";
		if(date != null){
			SimpleDateFormat dateFormat = new SimpleDateFormat(format);
			dateString = dateFormat.format(date);
		}
		return dateString;
	}
	
	public static int daysBetween(Date d1, Date d2){
        return (int)( (d2.getTime() - d1.getTime()) / (1000 * 60 * 60 * 24));
	}
	
}
