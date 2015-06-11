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
	public static void main(String[] args) {
		System.out.println(1/2);
		List<List<Map<String,Object>>> resList=new ArrayList<List<Map<String,Object>>>();
		System.out.println(resList.size());
	}
	/**
	 * 查询已选择的课时
	 * @param parameter
	 * @return
	 */
	public  Map<String,Object> findSelectedLesson(Map<String,Object> parameter){
//		Map<String,Object> res=new HashMap<String,Object>();
		List<Map<String,Object>> lessonList=this.getBaseDao().findList("elective.findSelectedLesson", parameter);//已选课时
		List<Map<String,Object>> dateList=this.getBaseDao().findList("elective.findSelectedDate", parameter);//已选日期
		List<Map<String,Object>> list=this.getBaseDao().findList("elective.findSelected", parameter);//已选数据
		Map<String,Object> res= this.getBaseDao().loadEntity("findOneSemester", parameter);
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
