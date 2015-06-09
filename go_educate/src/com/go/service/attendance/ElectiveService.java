package com.go.service.attendance;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.go.po.common.PageBean;
import com.go.service.base.BaseService;
/**
 * 选课Service
 * @author Administrator
 *
 */
@Service
public class ElectiveService extends BaseService {

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
