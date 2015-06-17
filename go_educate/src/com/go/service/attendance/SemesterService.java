package com.go.service.attendance;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.go.common.util.SqlUtil;
import com.go.common.util.SysUtil;
import com.go.po.common.PageBean;
import com.go.service.base.BaseService;
/**
 * 选课Service
 * @author Administrator
 *
 */
@Service
public class SemesterService extends BaseService {

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
			List<Map<String,Object>> lessonList=this.getBaseDao().findList("lesson.findoptional1",map);
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
	
	public void addSemesterElective(List<Map<String,Object>> parameter){
		this.getBaseDao().insert("semesterelective.add", parameter);
	}
	/**
	 * 查询已选择的课时
	 * @param parameter
	 * @return
	 */
	public  Map<String,Object> findSelectedLesson(Map<String,Object> parameter){
		List<Map<String,Object>> lessonList=this.getBaseDao().findList("elective.findSelectedLesson", parameter);//已选课时
		List<Map<String,Object>> dateList=this.getBaseDao().findList("elective.findSelectedDate", parameter);//已选日期
		List<Map<String,Object>> list=this.getBaseDao().findList("elective.findSelected", parameter);//已选数据
		Map<String,Object> res= this.getBaseDao().loadEntity("elective.findOneSemester", parameter);
		if(dateList==null || dateList.size()==0){
			return null;
		}
		int size=5;//每size天为一页
		int index=dateList.size()/size;
		List<List<Map<String,Object>>> resList=new ArrayList<List<Map<String,Object>>>();
		for(int i=0;i<dateList.size();i++){//遍历日期
			Map<String,Object> date=dateList.get(i);
			Object d=date.get("DATE");
			if(d==null){
				continue;
			}
			int j=i/size;
			if(resList.size()==j){
				List<Map<String,Object>> l=new ArrayList<Map<String,Object>>();
				l.add(date);
				resList.add(l);
			}else{
				resList.get(j).add(date);
			}
			for(Map<String,Object> vo:list){//遍历数据
				if(d.equals(vo.get("DATE"))){
					for(Map<String,Object> lesson:lessonList){//遍历课时
						Object lessonid=lesson.get("ID");
						Object lessonid1=vo.get("LESSONID");
						if(lessonid.equals(lessonid1)){
							List<Map<String,Object>> children=(List<Map<String, Object>>) date.get(lessonid);
							if(children==null){
								children=new ArrayList<Map<String, Object>>();
								date.put(lessonid.toString(), children);
							}
							children.add(vo);
						}
					}
				}
			}
		}
		System.out.println(resList);
		res.put("lessonList",lessonList);
		res.put("dateList",resList);
//		res.put("dateList",dateList);
		res.put("list",list);
		
		return res;
	}
	/**
	 * 分页查找数据
	 * @param parameter
	 * @return
	 */
	public  PageBean<Map<String,Object>>  findList(Map<String,Object> parameter){
		return this.getBaseDao().findPageBean("semester.findcount", "semester.findlist", parameter);
	}
	
	/**
	 * 分页查找数据
	 * @param parameter
	 * @return
	 */
	public  PageBean<Map<String,Object>>  myStudent(Map<String,Object> parameter){
		return this.getBaseDao().findPageBean("semester.mystudentcount", "semester.mystudent", parameter);
	}
	
	/**
	 * 加载信息
	 * @param parameter
	 * @return
	 */
	public  Map<String,Object>  load(Map<String,Object> parameter){
		return this.getBaseDao().loadEntity("semester.load", parameter);
	}
	/**
	 * 添加菜单
	 * @param parameter
	 * @return
	 */
	public  void  add(Map<String,Object> parameter){
	    this.getBaseDao().insert("semester.add", parameter);
	}
	
	/**
	 * 删除数据
	 * @param parameter
	 */
	public  void  delete(List<String> parameter){
		this.getBaseDao().delete("semester.delete", parameter);
	}
	/**
	 * 删除数据
	 * @param parameter
	 */
	public  void  deleteToday(Map<String,Object> parameter){
		this.getBaseDao().delete("electivelesson.deleteToday", parameter);
	}
}
