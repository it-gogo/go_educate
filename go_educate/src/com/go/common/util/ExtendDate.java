package com.go.common.util;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;

import org.apache.commons.lang.StringUtils;

/**
 * 陈永楠
 * 日期：2014-03-06
 * 扩展日期类
 * @author Administrator
 *
 */
public class ExtendDate {
    
	 static final SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
     static final SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");
     static final SimpleDateFormat formatter6 = new SimpleDateFormat("yyyyMMdd");
     static final SimpleDateFormat formatter2 = new SimpleDateFormat("HH:mm");
     static final SimpleDateFormat formatter3 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
     static final SimpleDateFormat formatter4 = new SimpleDateFormat("yyyy年MM月dd日");
     static final SimpleDateFormat formatter5 = new SimpleDateFormat("MM-dd");
     static final SimpleDateFormat formatter8 = new SimpleDateFormat("yyyy-MM");
     static final SimpleDateFormat formatter7 = new SimpleDateFormat("HH:mm:ss.SSS");
     public ExtendDate()
     {
    	
     }
     
     public  static  Date    getDateFromStr(String str){
    	 Date date=null;
    	 if(str!=null&&!str.equals("")){
    	   date=date.valueOf(str);
    	 }
		 return  date;
     }
     
     public  static  Time    getTimeFromStr(String str){
    	 Time date=null;
    	 date=Time.valueOf(str);
		return  date;
     }
    
     /**
      * 当天的起时间
      * @param cal Calendar
      * @return Calendar
      */
     public static Calendar getDayOfStart(Calendar cal)
     {
          cal.set(Calendar.HOUR, 0);
          cal.set(Calendar.MINUTE, 0);
          cal.set(Calendar.SECOND , 0);
          return cal;
     }

     /**
      * 当天的止时间
      * @param cal Calendar
      * @return Calendar
      */
     public static Calendar getDayOfEnd(Calendar cal)
     {
          cal.set(Calendar.HOUR, 23);
          cal.set(Calendar.MINUTE, 59);
          cal.set(Calendar.SECOND , 59);
          return cal;
     }
     
     

     public static String getHHMM(java.sql.Time time)
     {
          if (time == null)
               return null;
          return formatter2.format(time);

     }

     public static String getChineseYMD(Calendar cal)
     {
          if (cal == null)
               return null;
          return formatter4.format(cal.getTime());

     }

     public static String getHHMM(java.util.Date date)
     {
          if (date == null)
               return null;
          return formatter2.format(date);

     }

     public static String getHHMM(java.util.Calendar cal)
     {
          if (cal == null)
               return null;
          return formatter2.format(cal.getTime());

     }

    
	public static int getYear()
     {
          Calendar cal = Calendar.getInstance();
          return cal.get(cal.YEAR);
     }

     public static java.sql.Time getSqlTime(String strTime)
     {
          if (strTime == null)
               return null;
          String[] strs = StringUtils.split(strTime, ":");
          if (strs.length == 2)
          {
               if (Integer.parseInt(strs[0]) < 24 && Integer.parseInt(strs[1]) < 60)
                    return java.sql.Time.valueOf(strTime + ":0");
               return null;
          }
          else
          {
               return null;
          }
     }

     /**
      * 取得日期的YYYY-MM-DD HH:MM:SS
      * @param cal Calendar
      * @return String
      */
     public static String getYMD_h_m_s(Calendar cal)
     {
          if (cal == null)
               return null;
          return formatter.format(cal.getTime());

     }
     
     /**
      * 取得日期的YYYY-MM-DD HH:MM:SS
      * @param cal Calendar
      * @return String
      */
     public static String getYMD_h_m_s_sss(Calendar cal)
     {
          if (cal == null)
               return null;
          return formatter7.format(cal.getTime());

     }

     /**
      * 取得日期的YYYY-MM-DD HH:MM
      * @param cal Calendar
      * @return String
      */
     public static String getYMD_h_m(Calendar cal)
     {
          if (cal == null)
               return null;
          return formatter3.format(cal.getTime());

     }

     /**
      * 取得日期的YYYY-MM-DD
      * @param cal Calendar
      * @return String
      */
     public static String getYMD(Calendar cal)
     {
          if (cal == null)
               return null;
          return formatter1.format(cal.getTime());

     }
     
     /**
      * 取得日期的YYYY-MM
      * @param cal Calendar
      * @return String
      */
     public static String getYM8(Calendar cal)
     {
          if (cal == null)
               return null;
          return formatter8.format(cal.getTime());

     }
     
     /**
      * 取得日期的YYYYMMDD
      * @param cal Calendar
      * @return String
      */
     public static String getYMD6(Calendar cal)
     {
          if (cal == null)
               return null;
          return formatter6.format(cal.getTime());

     }
     

     /**
      * 取得日期的MM-DD
      * @param cal Calendar
      * @return String
      */
     public static String getMD(Calendar cal)
     {
          if (cal == null)
               return null;
          return formatter5.format(cal.getTime());

     }
     
     public static String getYMD(java.sql.Date date)
     {
          Calendar cal = new java.util.GregorianCalendar();
          cal.setTime(date);
          return getYMD(cal);
     }
     
     /**
      * 取得年月
      * @param date
      * @return
      */
     public static String getYM(java.util.Date date)
     {
          Calendar cal = new java.util.GregorianCalendar();
          cal.setTime(date);
          return getYM8(cal);
     }
     
     public static String getYMD6(java.util.Date date)
     {
          Calendar cal = new java.util.GregorianCalendar();
          cal.setTime(date);
          return getYMD6(cal);
     }
     
     public static String getYMD(java.util.Date date)
     {
          Calendar cal = new java.util.GregorianCalendar();
          cal.setTime(date);
          return getYMD(cal);
     }

     /**
      * 包含日期时间的
      * @param date
      * @return
      */
     public static String getYMD_h_m_s(java.util.Date date)
     {
          Calendar cal = new java.util.GregorianCalendar();
          cal.setTime(date);
          return getYMD_h_m_s(cal);
     }
     
     /**
      * 包含日期时间的
      * @param date
      * @return
     * @throws ParseException 
      */
     public static java.util.Date getYMD_h_m_s1(String date) throws ParseException
     {
    	 java.util.Date  ndate = (java.util.Date)formatter.parseObject(date);
    	 return ndate;
     }
     
     public static  String getYMD_h_m_s_sss(java.util.Date date){
    	 Calendar cal = new java.util.GregorianCalendar();
         cal.setTime(date);
         return getYMD_h_m_s_sss(cal);
     }
     
     

     /**
      * 通过字符串得到个日历类
      * @param strDate String
      * @return Calendar
      */
     
	@SuppressWarnings("deprecation")
	public static Calendar getCalendar(String strDate)
     {
          if (strDate == null || strDate.trim().length() == 0)
               return null;
          try
          {
               strDate = strDate.replaceAll("-", "/");

               java.util.Date date = new java.util.Date(strDate);
               Calendar calendar = Calendar.getInstance();
               calendar.setTime(date);
//               calendar.set(Calendar.MONTH, calendar.get(Calendar.MONTH) + 1);
               return calendar;
          }
          catch (Exception ex)

          {
               ex.printStackTrace();
               return null;
          }

     }

     public static Calendar addDayNumNoRelaxDate(Calendar cal, int dayNum)
     {
          for (int i = 1; i <= dayNum; i++)
          {
               cal.add(cal.DATE, i);
               while (cal.get(cal.DAY_OF_WEEK) == 7 ||
                      cal.get(cal.DAY_OF_WEEK) == 1)
               {
                    cal.add(cal.DATE, 1);
               }

          }
          return cal;

     }

     public static Calendar add(Calendar cal, int num, int addType)
     {
          cal.add(addType, num);
          return cal;

     }

     /**
      * 取得星期几，符合中国人的习惯
      * @param cal Calendar
      * @return int
      */
     public static int getDayOfWeek(Calendar cal)
     {
          if (cal == null)return -1;
          int _i = cal.get(cal.DAY_OF_WEEK) - 1;
          if (_i == 0) _i = 7;

          return _i;
     }

     public static int getDayOfWeek(java.sql.Date date)
     {

          if (date == null)
               return -1;
          Calendar cal = Calendar.getInstance();
          cal.setTimeInMillis(date.getTime());
          int _i = cal.get(cal.DAY_OF_WEEK) - 1;
          if (_i == 0)
               _i = 7;

          return _i;
     }

     /**
      * get the last date of param  cal
      * @param cal Calendar
      * @return Calendar
      */
     public static Calendar getLastDayOfMonth(Calendar cal)
     {
          int maxDate = -1;
          maxDate = cal.getActualMaximum(cal.DAY_OF_MONTH);
          System.out.println(maxDate);
          cal.set(cal.DAY_OF_MONTH, maxDate);
          System.out.println(getYMD(cal));
          return cal;
     }
     
     public static int  getLastDayOfMonthToStr(String  date)
     {
    	 int maxDate = -1;
    	 Calendar cal = getCalendar(date);
         maxDate = cal.getActualMaximum(cal.DAY_OF_MONTH);
         return maxDate;
     }

     public static String  getLastDay(String  date)
     {
    	 int maxDate = -1;
    	 Calendar cal = getCalendar(date);
         maxDate = cal.getActualMaximum(cal.DAY_OF_MONTH);
         //System.out.println(maxDate);
         cal.set(cal.DAY_OF_MONTH, maxDate);
         String  res = getYMD(cal);
         return res;
     }
     
     /**
      * 取得日期
      * @param date
      * @return
      */
     @SuppressWarnings("deprecation")
	public static int  getDay(String  date)
    {
    	 Calendar cal = Calendar.getInstance();
    	 cal.setTime(getDateFromStr(date));
    	 int  res = cal.get(cal.DAY_OF_MONTH);
         return res;
    }
     
     
     /**
      * 取到当天的日期加上天数后的日期
      * @param dayNum
      * @return
      */
     public static Calendar getAddDayNum(int dayNum)
     {
    	 Calendar cal = Calendar.getInstance();	
 		 cal.setTime(new java.util.Date());
 		 if(dayNum==0)
 		 {
 			 return cal;
 		 }
 		 else
 		 {
	 		 cal.add(Calendar.DATE, dayNum);
	    	 return cal;
 		 }
     }
     
     /**
      * 取得距离某天多少日的日期
      * @param date
      * @param dayNum
      * @return
      */
     public  static  String  getDateFromNum(String  date,int dayNum)
     {
    	 Calendar cal = getCalendar(date);
    	 cal.add(cal.DAY_OF_MONTH, dayNum);
    	 String  res = formatter1.format(cal.getTime());
    	 return res;
     }
     
     public static int getDayNumBetween2Date(Calendar startCal0, Calendar toCal0)
     {

          if (startCal0 == null || toCal0 == null)
               return -1;
          Calendar startCal = Calendar.getInstance();
          Calendar toCal = Calendar.getInstance();
          startCal.setTimeInMillis(startCal0.getTimeInMillis());
          toCal.setTimeInMillis(toCal0.getTimeInMillis());

          startCal.set(Calendar.HOUR, 00);
          startCal.set(Calendar.MINUTE, 00);
          startCal.set(Calendar.SECOND, 000);
          toCal.set(Calendar.HOUR, 00);
          toCal.set(Calendar.MINUTE, 00);
          toCal.set(Calendar.SECOND, 000);
          long dateRange = toCal.getTimeInMillis() - startCal.getTimeInMillis();
          long oneDay = 1000 * 3600 * 24;
          int diffdays = (int) (dateRange / oneDay);

          return diffdays;
     }
     
     

     /**
      * 取得开始日期和结束日期的天数
      * @param startDate
      * @param endDate
      * @return
      */
     public static int getNumBetween2Date(String  startDate,String endDate)
     {

          if (startDate == null || startDate == null)
               return -1;
          Calendar startCal0=getCalendar(startDate);
          Calendar endCal0=getCalendar(endDate);
          Calendar startCal = Calendar.getInstance();
          Calendar toCal = Calendar.getInstance();
          startCal.setTimeInMillis(startCal0.getTimeInMillis());
          toCal.setTimeInMillis(endCal0.getTimeInMillis());
          startCal.set(Calendar.HOUR, 00);
          startCal.set(Calendar.MINUTE, 00);
          startCal.set(Calendar.SECOND, 000);
          toCal.set(Calendar.HOUR, 00);
          toCal.set(Calendar.MINUTE, 00);
          toCal.set(Calendar.SECOND, 000);
          long dateRange = toCal.getTimeInMillis() - startCal.getTimeInMillis();
          long oneDay = 1000 * 3600 * 24;
          int diffdays = (int) (dateRange / oneDay);
          return diffdays;
     }
     
     /**
      * 通过日期与时间相加返回日历型(Calendar)
      * @param date Date 日期
      * @param time Time 时间
      * @return Calendar 日历
      */
     public static Calendar getCalendar(java.sql.Date date, java.sql.Time time)
     {
          Calendar _cal1 = new java.util.GregorianCalendar();
          Calendar _cal2 = new java.util.GregorianCalendar();
          _cal1.setTimeInMillis(date.getTime());
          _cal2.setTimeInMillis(time.getTime());

          _cal1.set(_cal1.HOUR, _cal2.get(_cal2.HOUR));
          _cal1.set(_cal1.MINUTE, _cal2.get(_cal2.MINUTE));
          _cal1.set(_cal1.SECOND, _cal2.get(_cal2.SECOND));
          return _cal1;
     }

     
     
     public static Calendar getCalendar(Calendar cal, java.sql.Time time)
     {
          if (cal == null || time == null)
               return null;
          Calendar _calTime = new GregorianCalendar();
          Calendar _cal = new GregorianCalendar();
          _cal.setTimeInMillis(cal.getTimeInMillis());
          _calTime.setTimeInMillis(time.getTime());
          _cal.set(Calendar.HOUR_OF_DAY, _calTime.get(Calendar.HOUR_OF_DAY));
          _cal.set(Calendar.MINUTE, _calTime.get(Calendar.MINUTE));
          _cal.set(Calendar.SECOND, _calTime.get(Calendar.SECOND));
          return _cal;
     }

   
     public static String getStringInteger(char chr, String style)
     {
          String[] strValue = new String[]
                  {"零", "壹", "贰", "叁", "肆", "伍", "陆", "柒", "捌", "玖"};
          if (style.equalsIgnoreCase("lower"))
               strValue = new String[]
                       {"零", "一", "二", "三", "四", "五", "六", "七", "八", "九"};
          switch (chr)
          {
               case '0':
                    return strValue[0];
               case '1':
                    return strValue[1];
               case '2':
                    return strValue[2];
               case '3':
                    return strValue[3];
               case '4':
                    return strValue[4];
               case '5':
                    return strValue[5];
               case '6':
                    return strValue[6];
               case '7':
                    return strValue[7];
               case '8':
                    return strValue[8];
               case '9':
                    return strValue[9];
          }
          return "";
     }

     private static String getStringChinase(String string)
     {
          char[] chars = string.toCharArray();
          String strRtn = "";
          for (int i = 0; i < chars.length; i++)
          {
               strRtn += getStringInteger(chars[i], "lower");
          }
          return strRtn;
     }
     
     public static String getIntegerChinase(long lngValue)
     {
          if (lngValue == 0)
               return "零";
          String[] bit = new String[]
                  {"", "十", "百", "千", "万", "十万", "百万", "千万", "亿", "十亿", "百亿", "千亿", "万亿", "十万亿"};
          String strRtn = "";
          String value = String.valueOf(lngValue);
          char[] chars = value.toCharArray();
          for (int i = 0; i < chars.length; i++)
          {
               if (chars[i] == '0')
               {
                    if (i != chars.length - 1)
                    {
                         if (chars[i - 1] != '0')
                              strRtn += getStringInteger(chars[i], "lower");
                    }
                    else
                    {
                         if (chars[i] != '0')
                              strRtn += getStringInteger(chars[i], "lower");
                    }
               }
               else
               {
                    strRtn += getStringInteger(chars[i], "lower");
                    strRtn += bit[chars.length - 1 - i];
               }
          } while (strRtn.indexOf("亿") != -1)
          {
               String _string = strRtn;
               _string = _string.replaceFirst("亿", "");
               if (_string.indexOf("亿") == -1)
                    break;
               strRtn = _string;
          } while (strRtn.indexOf("万") != -1)
          {
               String _string = strRtn;
               _string = _string.replaceFirst("万", "");
               if (_string.indexOf("万") == -1)
                    break;
               strRtn = _string;
          }
          if ( (strRtn.length() - 1) == strRtn.lastIndexOf("零"))
               return strRtn.substring(0, strRtn.lastIndexOf("零"));
          return strRtn;
     }

     public static String getCalendarToChinase(Calendar calendar, String format)
     {
          int year = calendar.get(Calendar.YEAR);
          int month = calendar.get(Calendar.MONTH) + 1;
          int day = calendar.get(Calendar.DAY_OF_MONTH);
          int hour = calendar.get(Calendar.HOUR_OF_DAY);
          int minute = calendar.get(Calendar.MINUTE);
          int second = calendar.get(Calendar.SECOND);

          String yyyy = getStringChinase(String.valueOf(year));
          String y2 = String.valueOf(year % 100);
          y2 = (y2.length() < 2) ? "0" + y2 : y2;
          String yy = getStringChinase(y2);

          String M = getIntegerChinase(month);
          if (month >= 10 && month < 20)
               M = M.substring(1);
          String MM = M;
          if (month < 10)
               MM = "零" + MM;

          String d = getIntegerChinase(day);
          if (day >= 10 && day < 20)
               d = d.substring(1);
          String dd = d;
          if (day < 10)
               dd = "零" + dd;

          String H = getIntegerChinase(hour);
          if (hour >= 10 && hour < 20)
               H = H.substring(1);
          String HH = H;
          if (hour < 10)
               HH = "零" + HH;

          String m = getIntegerChinase(minute);
          if (minute >= 10 && minute < 20)
               m = m.substring(1);
          String mm = m;
          if (minute < 10)
               mm = "零" + mm;

          String S = getIntegerChinase(second);
          if (second >= 10 && second < 20)
               S = S.substring(1);
          String SS = S;
          if (second < 10)
               SS = "零" + SS;

          format = format.replaceAll("yyyy", yyyy);
          format = format.replaceAll("yy", yy);
          format = format.replaceAll("MM", MM);
          format = format.replaceAll("M", M);
          format = format.replaceAll("dd", dd);
          format = format.replaceAll("d", d);
          format = format.replaceAll("HH", HH);
          format = format.replaceAll("H", H);
          format = format.replaceAll("mm", mm);
          format = format.replaceAll("m", m);
          format = format.replaceAll("SS", SS);
          format = format.replaceAll("S", S);

          return format;
     }

     public static float getDayNumBetween2DateTiem(Calendar startCal0, Calendar toCal0)
     {
          if (startCal0 == null || toCal0 == null)
               return -1;

          long dateRange = toCal0.getTimeInMillis() - startCal0.getTimeInMillis();
          long oneDay = 24 * 60 * 60 * 1000;
          @SuppressWarnings("unused") int diffdays = (int) (dateRange / oneDay);

          return div(dateRange, oneDay, 2);
     }

     public static float getDayNumBetween2DateTiem(Calendar ssCal, Calendar stCal, Calendar dsCal, Calendar dtCal)
     {
          if (ssCal == null || stCal == null)
               return -1;
          Calendar _sCal = ssCal, _tCal = stCal;

          if (dsCal != null && dsCal.getTimeInMillis() >= ssCal.getTimeInMillis() && dsCal.getTimeInMillis() <= stCal.getTimeInMillis())
          {
               _sCal = dsCal;
          }
          if (dtCal != null && dtCal.getTimeInMillis() >= ssCal.getTimeInMillis() && dtCal.getTimeInMillis() <= stCal.getTimeInMillis())
          {
               _tCal = dtCal;
          }
          if (dsCal != null && dsCal.getTimeInMillis() > stCal.getTimeInMillis()
              || dtCal != null && dtCal.getTimeInMillis() < ssCal.getTimeInMillis())
          {
               return -1;
          }

          long dateRange = _tCal.getTimeInMillis() - _sCal.getTimeInMillis();
          long oneDay = 24 * 60 * 60 * 1000;
          @SuppressWarnings("unused") int diffdays = (int) (dateRange / oneDay);

          return div(dateRange, oneDay, 2);
     }

     private static float div(double v1, double v2, int scale)
     {
          if (v1 == v2 && v1 == 0)
               return 0;
          if (scale < 0)
          {
               throw new IllegalArgumentException("The scale must be a positive integer or zero");
          }
          if (v2 == 0)
               throw new IllegalArgumentException("v2 can not be zero");
          if (v1 == 0)
               return 0;
          BigDecimal b1 = new BigDecimal(Double.toString(v1));
          BigDecimal b2 = new BigDecimal(Double.toString(v2));
          return b1.divide(b2, scale, BigDecimal.ROUND_HALF_UP).floatValue();
     }
     
//     public  static void setDate(java.util.Date  date)
//     {
//       long nowLong = date.getTime();
//       java.sql.Date now = new java.sql.Date(nowLong);
//       ContextUtil.setHttpRequestVal("endtime", now.toString());
//       now.setTime(nowLong - (long)(1000 * 60 * 60 * 24  * SysContants.W_SEARCH_DAYS*2));
//       ContextUtil.setHttpRequestVal("starttime", now.toString());
//     }

     public static void main(String[] args)
     {
          Calendar start = getCalendar("2005-09-01 00:00:00");
          Calendar end = getCalendar("2005-09-30 23:59:59");
          Calendar from = getCalendar("2005-09-29 00:00:01");
          Calendar back = getCalendar("2005-09-30 23:59:59");
          int  res = getLastDayOfMonthToStr("2011-08-01");
          int res1 = getDay("2011-09-08");
          System.out.println(res1);
     }
    
     /**
      * 取得时间,到毫秒 
      * @param time
      * @return
      */
     public static String getHHMMssSS(java.util.Date date){
          if (date == null)
               return null;
          return formatter7.format(date);

     }
	
}
