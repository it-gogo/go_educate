package com.go.service.attendance;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.springframework.stereotype.Service;

import com.go.common.util.ExtendDate;
import com.go.common.util.SqlUtil;
import com.go.po.common.PageBean;
import com.go.service.base.BaseService;
/**
 * 选课Service
 * @author Administrator
 *
 */
@Service
public class ElectiveService extends BaseService {

	public String  generateTimetable(Map<String,Object> parameter){
		List<Map<String,Object>> list=this.getBaseDao().findList("elective.findelective", parameter);//更新选课状态
		if(list==null || list.size()==0){
			return "生成失败，请先选课。";
		}
		this.getBaseDao().update("elective.updateStatus", parameter);//更新选课状态
		Object several=this.getBaseDao().findOne("semester.findmaxindex",parameter);//查询该学生学期最大系列号
		if(several==null){
			parameter.put("SEVERAL", 1);
		}else{
			parameter.put("SEVERAL", Integer.valueOf(several.toString())+1);
		}
		this.getBaseDao().insert("semester.add", parameter);//添加学期
		List<Map<String,Object>> arrayList=new ArrayList<Map<String,Object>>();
		for(Map<String,Object> map:list){
			Map<String,Object> m=new HashMap<String,Object>();
			m.put("id", SqlUtil.uuid());
			m.put("SEMESTERID", parameter.get("id"));
			m.put("ELECTIVEID", map.get("ID"));
			arrayList.add(m);
		}
		this.getBaseDao().insert("semesterelective.add", arrayList);//添加学期更选课关联表
		return "生成成功";
	}
	
	private void getLXLesson(Map<String,Object> m,List<Map<String,Object>> list,List<Map<String,Object>> res){
		res.add(m);
		Object lsuserid=m.get("USERID");
		Object xsuserid=m.get("XSUSERID");
		Object date=m.get("DATE");
		Object endtime=m.get("ENDTIME");
		Object starttime=m.get("STARTTIME");
		Object curriculumid=m.get("CURRICULUMID");
		List<Map<String,Object>> remove=new ArrayList<Map<String,Object>>();
		for(Map<String,Object> map:list){
			Object lsuser1=map.get("USERID");
			Object xsuserid1=map.get("XSUSERID");
			Object date1=map.get("DATE");
			Object starttime1=map.get("STARTTIME");
			Object endtime1=map.get("ENDTIME");
			Object curriculumid1=map.get("CURRICULUMID");
			if(curriculumid.equals(curriculumid1)){//同一个课程
				if(lsuserid.equals(lsuser1)){//同一个老师
					if(xsuserid.equals(xsuserid1)){//同一学生
						if(date1.equals(date)){//同一天
							if(starttime.equals(endtime1) || endtime.equals(starttime1)){//结束等于开始
								if(res.contains(map)){
								}else{
									getLXLesson(map, list,res);
								}
							}
						}
					}
				}
			}
		}
		return ;
	}
	/**
	 * 生成节课
	 * @param parameter
	 * @return
	 * @throws Exception 
	 */
	public List<Map<String,Object>> generateClass(Map<String,Object> parameter) throws Exception{
		List<Map<String,Object>> list=this.getBaseDao().findList("elective.findClassElective", parameter);
		if(list==null || list.size()==0){
			return null;
		}
		List<List<Map<String,Object>>> res=new ArrayList<List<Map<String,Object>>>();
		getClass(list,res);
		
		Map<String,Object> n_parameter=new HashMap<String,Object>();
		List<Map<String,Object>> classList=new ArrayList<Map<String,Object>>();
		List<Map<String,Object>> classelList=new ArrayList<Map<String,Object>>();
		for(List<Map<String,Object>> l:res){
			if(l!=null && l.size()>0){
				Map<String,Object> classm=new HashMap<String,Object>();
				Map<String,Object> map=l.get(0);
				classm.put("LSUSERID", map.get("USERID"));//老师ID
				classm.put("XSUSERID", map.get("XSUSERID"));//学生ID
				classm.put("DATE", map.get("DATE"));//老师ID
				classm.put("CURRICULUMID", map.get("CURRICULUMID"));//课程ID
				classm.put("MUCHLESSON", l.size()/2.0);//多少节课
				classm.put("CREATEDATE", ExtendDate.getYMD_h_m_s(new Date()));//创建时间
//				classm.put("STATUS", 0);//未上课
				String id=SqlUtil.uuid();
				classm.put("id", id);//id
				String starttime="24:00";
				String endtime="00:00";
				for(Map<String,Object> m:l){
					starttime=compareTime(starttime, m.get("STARTTIME").toString(), "0");//返回小值
					endtime=compareTime(endtime, m.get("ENDTIME").toString(), "1");//返回大值
					Map<String,Object> classel=new HashMap<String,Object>();
					classel.put("id", SqlUtil.uuid());//id
					classel.put("CLASSID", id);//CLASSID
					classel.put("ELID", m.get("ID"));//ELID
					classelList.add(classel);
				}
				classm.put("STARTTIME", starttime);//上课时间
				classm.put("ENDTIME", endtime);//下课时间
				classList.add(classm);
			}
		}
		if(classList!=null && classList.size()>0){
			n_parameter.put("classList", classList);
			this.getBaseDao().insert("class.add", n_parameter);
		}
		if(classelList!=null && classelList.size()>0){
			n_parameter.put("classelList", classelList);
			this.getBaseDao().insert("classel.add", n_parameter);
		}
		return null;
	}
	public static void main(String[] args) throws Exception {
//		System.out.println(compareTime("08:00","07:30","0"));
		System.out.println(7/2.0);
	}
	private static String compareTime(String time1,String time2,String type) throws Exception{
		SimpleDateFormat sdf=new SimpleDateFormat("HH:ss");
		Long l1=sdf.parse(time1).getTime();
		Long l2=sdf.parse(time2).getTime();
		if("1".equals(type)){//返回大值
			return l1>l2?time1:time2;
		}else{//返回小值
			return l1<l2?time1:time2;
		}
	}
	private void getClass(List<Map<String,Object>> list,List<List<Map<String,Object>>> res){
		List<Map<String,Object>> arr=new ArrayList<Map<String,Object>>();
		if(list.size()>0){
			getLXLesson(list.get(0), list,arr);
			list.removeAll(arr);
			res.add(arr);
			getClass(list,res);
		}
	}
	/**
	 * 查询选课超时的选课列表
	 * @author zhangjf
	 * @create_date 2015-6-9 下午8:57:15
	 * @param params
	 * @return
	 */
	public List<Map<String,Object>> findDelateOptionLesson(Map<String,Object> params){
		List<Map<String,Object>> DelateList=this.getBaseDao().findList("elective.findDeLateList",params);
		return DelateList;
	}
	
	
	/**
	 * 查询可选课时。
	 * @param parameter
	 * @return
	 */
	public List<Map<String,Object>> findOptionalLesson(Map<String,Object> parameter){
		Object curruculumid=parameter.get("ID");
		Object electiveid=parameter.get("ELECTIVEID");
		List<Map<String,Object>> list=this.getBaseDao().findList("elective.optionaldate", parameter);
		List<Map<String,Object>> arrayList=new ArrayList<Map<String,Object>>();
		for(Map<String,Object> map:list){
			Map<Object,List<Map<String,Object>>> res=new HashMap<Object,List<Map<String,Object>>>();
			map.put("CURRICULUMID", curruculumid);
			map.put("ELECTIVEID", electiveid);
			List<Map<String,Object>> lessonList=this.getBaseDao().findList("lesson.findoptional",map);
			if(lessonList==null || lessonList.size()==0){
				arrayList.add(map);
				continue;
			}
			for(Map<String,Object> lesson:lessonList){
				Object username=lesson.get("USERNAME");
				if(res.containsKey(username)){//存在
					List<Map<String,Object>> l=res.get(username);
					l.add(lesson);
				}else{
					List<Map<String,Object>> l=new ArrayList<Map<String,Object>>();
					l.add(lesson);
					res.put(username, l);
				}
			}
			map.put("lessonList", res);
		}
		list.removeAll(arrayList);
		return list;
	}
	
	public Map<Object,List<Map<String,Object>>> findOptionalLesson1(Map<String,Object> parameter){
		Object curruculumid=parameter.get("ID");
		Object electiveid=parameter.get("ELECTIVEID");
		List<Map<String,Object>> list=this.getBaseDao().findList("elective.optionaldate1", parameter);
//		Map<Object,List<Map<String,Object>>> resMap=new HashMap<Object,List<Map<String,Object>>>();
		Map<Object,List<Map<String,Object>>> resMap=new TreeMap<Object,List<Map<String,Object>>>(new Comparator<Object>(){ 
			@Override
			public int compare(Object o1, Object o2) {
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
				long l1=0;
				long l2=0;
				try {
					l1=sdf.parse(o1.toString()).getTime();
					l2 = sdf.parse(o2.toString()).getTime();
				} catch (Exception e) {
					e.printStackTrace();
				}
				if(l1>l2){
					return 1;
				}if(l1==l2){
					return 0;
				}else{
					return -1;
				}
			} 
				  }); 
		for(Map<String,Object> map:list){
			Map<Object,List<Map<String,Object>>> res=new HashMap<Object,List<Map<String,Object>>>();
			Map<String,Object> n_parameter=new HashMap<String, Object>();
			n_parameter.put("CURRICULUMID", curruculumid);
			n_parameter.put("ELECTIVEID", electiveid);
			n_parameter.put("TIMEID", map.get("ID"));
			n_parameter.put("USERID", map.get("USERID"));
			List<Map<String,Object>> lessonList=this.getBaseDao().findList("lesson.findoptional2",n_parameter);
			if(lessonList==null || lessonList.size()==0){
				continue;
			}
			map.put("lessonIdList", lessonList);
			Object date=map.get("DATE");
			if(resMap.containsKey(date)){//存在日期
				List<Map<String,Object>> l=resMap.get(date);
				l.add(map);
			}else{
				List<Map<String,Object>> l=new ArrayList<Map<String,Object>>();
				l.add(map);
				resMap.put(date, l);
			}
		}
		return resMap;
	}
	public Map<Object,List<Map<String,Object>>> findOptionalLesson11(Map<String,Object> parameter){
		Object curruculumid=parameter.get("ID");
		Object electiveid=parameter.get("ELECTIVEID");
		List<Map<String,Object>> list=this.getBaseDao().findList("elective.optionaldate11", parameter);
		Map<Object,List<Map<String,Object>>> resMap=new TreeMap<Object,List<Map<String,Object>>>(new Comparator<Object>(){ 
			@Override
			public int compare(Object o1, Object o2) {
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
				long l1=0;
				long l2=0;
				try {
					l1=sdf.parse(o1.toString()).getTime();
					l2 = sdf.parse(o2.toString()).getTime();
				} catch (Exception e) {
					e.printStackTrace();
				}
				if(l1>l2){
					return 1;
				}if(l1==l2){
					return 0;
				}else{
					return -1;
				}
			} 
		}); 
		Map<String,List<Map<String,Object>>> res=new HashMap<String,List<Map<String,Object>>>();
		for(Map<String,Object> map:list){
			Object date=map.get("DATE");
			Object userid=map.get("USERID");
			Object username=map.get("USERNAME");
			Object timeid=map.get("TIMEID");
			String du=date+"_"+userid+"_"+username+"_"+timeid;
			if(res.containsKey(du)){//存在同日期同老师
				List<Map<String,Object>> l=res.get(du);
				l.add(map);
			}else{
				List<Map<String,Object>> l=new ArrayList<Map<String,Object>>();
				l.add(map);
				res.put(du, l);
			}
		}
		Iterator<String> it=res.keySet().iterator();
		while(it.hasNext()){
			String du=it.next();
			List<Map<String,Object>> ll=(List<Map<String,Object>>) res.get(du);
			String[] arr=du.split("_");
			String date=arr[0];
			String userid=arr[1];
			String username=arr[2];
			String timeid=arr[3];
			Map<String,Object> m=new HashMap<String, Object>();
			m.put("USERNAME", username);
			m.put("USERID", userid);
			m.put("DATE", date);
			m.put("lessonIdList", ll);
			m.put("ID", timeid);
			if(resMap.containsKey(date)){//存在同日期同老师
				List<Map<String,Object>> l=resMap.get(date);
				l.add(m);
			}else{
				List<Map<String,Object>> l=new ArrayList<Map<String,Object>>();
				l.add(m);
				resMap.put(date, l);
			}
		}
		return resMap;
	}
	
	/**
	 * 分页查找数据
	 * @param parameter
	 * @return
	 */
	public  PageBean<Map<String,Object>>  findList(Map<String,Object> parameter){
		return this.getBaseDao().findPageBean("elective.findcount", "elective.findlist", parameter);
	}
	/**
	 * 根据条件查询所有数据
	 * @param parameter
	 * @return
	 */
	public List<Map<String,Object>> findAll(Map<String,Object> parameter){
		return this.getBaseDao().findList("elective.findall", parameter);
	}
	/**
	 * 查询选课课时表
	 * @param parameter
	 * @return
	 */
	public List<Map<String,Object>> findElectiveLesson(Map<String,Object> parameter){
		return this.getBaseDao().findList("electivelesson.findall", parameter);
	}
	
	
	/**
	 * 加载信息
	 * @param parameter
	 * @return
	 */
	public  Map<String,Object>  load(Map<String,Object> parameter){
		return this.getBaseDao().loadEntity("elective.load", parameter);
	}
	/**
	 * 添加菜单
	 * @param parameter
	 * @return
	 */
	public  void  add(Map<String,Object> parameter){
	    this.getBaseDao().insert("elective.add", parameter);
	}
	/**
	 * 添加选课课时表
	 * @param parameter
	 */
	public  void  addElectiveLesson(List<Map<String,Object>> parameter){
	    this.getBaseDao().insert("electivelesson.add", parameter);
	}
	
	public List<Map<String,Object>> checkElectiveLesson(List<Map<String,Object>> parameter){
		return this.getBaseDao().findList("electivelesson.check", parameter);
	}
	
	/**
	 * 更新菜单
	 * @param parameter
	 */
	public  void  update(Map<String,Object> parameter){
		this.getBaseDao().update("elective.update", parameter);
	}
	
	/**
	 * 删除数据
	 * @param parameter
	 */
	public  void  delete(List<String> parameter){
		this.getBaseDao().delete("elective.delete", parameter);
	}
	/**
	 * 删除选课课时表
	 * @param parameter
	 */
	public  void  deleteElectiveLesson(Object parameter){
		this.getBaseDao().delete("electivelesson.delete", parameter);
	}
}

