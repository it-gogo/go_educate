package com.go.quart;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import org.apache.commons.lang3.StringUtils;
import com.go.common.util.Util;

/**
 * 定时删除上传的作业文件
 * @author zhangjf
 * @create_date 2015-6-25 下午10:02:26
 */
public class DeleteFileQuart implements Runnable {
	
	/**
	 * 启动线程进行文件删除
	 * @author zhangjf
	 * @create_date 2015-6-25 下午10:33:05
	 */
	public void excute(){
		Thread thread=new Thread(this);
		thread.start();
	}
	
	/**
	 * @author zhangjf
	 * @create_date 2015-6-25 下午10:03:15
	 */
	@Override
	public void run() {
		System.out.println("删除文件定时器开始执行...");
		String currentTime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		String lastTime=getDateStamp(currentTime, "MM", -1, "yyyy-MM-dd");//获取一个月之前的日期
		String path=this.getClass().getClassLoader().getResource("/").getPath();
		path=path.substring(0, path.indexOf("/WEB-INF/"));
		System.out.println(path);
		path+="/task_file/"+lastTime;
		Util.deleteFolder(path);
		System.out.println("删除文件定时器执行结束...");
	}
	
	/**
	 * 获取当前日期指定天数的日期
	 * @author zhangjf
	 * @create_date 2015-6-25 下午10:10:37
	 * @param date
	 * @param part
	 * @param num
	 * @param ret_format
	 * @return
	 */
	public static String getDateStamp(String date,String part,int num,String ret_format){
		Calendar cld = Calendar.getInstance();
		try {
			cld.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date));
			if(StringUtils.isNotBlank(part)){
				if(part.equals("date") || part.equals("dd"))
					cld.add(Calendar.DATE, num);
				else if(part.equals("year") || part.equals("yyyy"))
					cld.add(Calendar.YEAR, num);
				else if(part.equals("month") || part.equals("MM"))
					cld.add(Calendar.MONTH, num);
				else if(part.equals("second") || part.equals("ss"))
					cld.add(Calendar.SECOND, num);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		if(StringUtils.isNotBlank(ret_format)){
			return new SimpleDateFormat(ret_format).format(cld.getTime());
		}else{
			return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(cld.getTime());
		}
	}

}
