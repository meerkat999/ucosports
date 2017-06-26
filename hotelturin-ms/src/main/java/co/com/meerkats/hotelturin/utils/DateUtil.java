package co.com.meerkats.hotelturin.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

	public final static String FORMATO_UNO = "yyyy/MM/dd";
	
	public static String dateToString(Date date, String format){
		SimpleDateFormat dateFormat = new SimpleDateFormat(format);
		return dateFormat.format(date);
	}
	
}
