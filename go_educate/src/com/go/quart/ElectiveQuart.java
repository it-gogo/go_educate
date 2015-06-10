package com.go.quart;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import com.go.service.attendance.ElectiveService;
/**
 * 定时删除超时未生成课表的数据
 * @author zhangjf
 * @create_date 2015-6-9 下午7:43:16
 */
public class ElectiveQuart implements Runnable {

	public static int DEFAULT_NUM=5;
	public static String DEFAULT_TYPE="minute";
	@Resource
	private ElectiveService electiveService;
	
	/**
	 * 启动删除线程进行数据处理
	 * @author zhangjf
	 * @create_date 2015-6-9 下午8:08:07
	 */
	public void excute(){
		Thread thread=new Thread(this);
		thread.start();
	}
	
	/**
	 * @author zhangjf
	 * @create_date 2015-6-9 下午7:43:05
	 */
	@Override
	public void run() {
		/**
		 * 1.获取设置的超时标准
		 */
		//TODO
		System.out.println("定时器调用:"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		int num=DEFAULT_NUM;
		String type=DEFAULT_TYPE;
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("num", num);
		params.put("type", type);
		List<Map<String,Object>>delateList=electiveService.findDelateOptionLesson(params);
		if(delateList!=null&&delateList.size()>0){
			List<String> idList=new ArrayList<String>();
			/**
			 * 2.获取所有超时的选课数据ID
			 */
			for (Map<String, Object> delate : delateList) {
				idList.add(delate.get("ID").toString());
			}
			/**
			 * 3.进行超时数据删除
			 */
			if(idList!=null&&idList.size()>0){
				electiveService.delete(idList);
			}
		}
		System.out.println("定时器结束:"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
	}

}
