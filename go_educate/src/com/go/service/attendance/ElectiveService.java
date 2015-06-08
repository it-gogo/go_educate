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
	 * 查询可选课时。
	 * @param parameter
	 * @return
	 */
	public List<Map<String,Object>> findOptionalLesson(Map<String,Object> parameter){
		Object curruculumid=parameter.get("ID");
		List<Map<String,Object>> list=this.getBaseDao().findList("elective.optionaldate", parameter);
		for(Map<String,Object> map:list){
			Map<Object,List<Map<String,Object>>> res=new HashMap<Object,List<Map<String,Object>>>();
			map.put("CURRICULUMID", curruculumid);
			List<Map<String,Object>> lessonList=this.getBaseDao().findList("lesson.findoptional",map);
			System.out.println("lessonList:"+lessonList.size());
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
}
