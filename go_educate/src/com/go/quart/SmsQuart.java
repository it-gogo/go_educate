package com.go.quart;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.go.common.util.SMSUtil;
import com.go.service.attendance.ClassService;
import com.go.service.platform.BuserService;

/**
 * 上课发送短信定时任务
 * @author linyb
 * @date 2015-6-27下午2:29:32
 */
public class SmsQuart implements Runnable{
	private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	private SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
	
	@Resource
	private ClassService classService;	
	@Resource
	private BuserService buserService;
	/**
	 * 
	 * @author linyb
	 * @date  2015-6-27下午4:26:57
	 */
	public void excute(){
		Thread thread=new Thread(this);
		thread.start();
	}
	/**
	 * 上课前30分钟发送短信
	 * 30分钟执行一次，查出离上课还有20-40分钟的发送短信
	 * 上课时间(STARTTIME)减去当前时间(NOW)    在20到40分钟之间
	 */
	public void run() {
		System.out.println("短信定时器启动！");
		Map<String,Object> params = new HashMap<String, Object>();
		StringBuffer sb = new StringBuffer();
		String time = timeFormat.format(new Date()); //当前的
		sb.append(" where 1=1 ");
		sb.append(" and DATE like '%"+dateFormat.format(new Date())+"%' ");
		sb.append(" and STARTTIME >'" +time+"'");
		params.put("where", sb.toString());
		List<Map<String,Object>> msg = classService.findListByParams(params);
		if(msg.size()>0){
			for (int i = 0; i < msg.size(); i++) {
				Map<String,Object> map = msg.get(i);
				try {
					Date startTime = timeFormat.parse(map.get("STARTTIME").toString());
					Date now = timeFormat.parse(time);
					long diff = (startTime.getTime()-now.getTime())/(1000*60);
					if(diff>=20 && diff<=40){
						String lsId = map.get("LSUSERID").toString();
						String xsId = map.get("XSUSERID").toString();
						Map<String, Object> parameter = new HashMap<String, Object>();
						parameter.put("ID", lsId);
						Map<String, Object> ls = buserService.load(parameter );
						parameter.put("ID", xsId);
						Map<String, Object> xs = buserService.load(parameter );
						
						//发送短信
						if(ls.get("TELEPHONE")!=null){
							try {
								SMSUtil.sendSms(
										"上课提醒：亲爱的"+ls.get("NAME")+"老师 ，" 
									    +"您好！你在今天"+map.get("STARTTIME")+"有一节"+map.get("CURRICULUMNAME")+"课程，" 
										+"请做好授课准备，课前和学生做好沟通，课后别忘了布置作业和课程反馈，保持良好心情，准备上课哦！"
										, ls.get("TELEPHONE").toString()
									);
							} catch (Exception e) {
								e.printStackTrace();
							}							
						}
						if(xs.get("TELEPHONE")!=null){
							try {
								SMSUtil.sendSms(
										"上课提醒：亲爱的"+xs.get("NAME")+"同学，您在今天"+map.get("STARTTIME")+"有一节"+map.get("CURRICULUMNAME")+"课程，请做好上课准备，保持美好心情，准备上课咯！"
										, xs.get("TELEPHONE").toString());
							} catch (Exception e) {
								e.printStackTrace();
							}							
						}
					}
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
		}
		System.out.println("定时短信任务结束！");
	}

}
