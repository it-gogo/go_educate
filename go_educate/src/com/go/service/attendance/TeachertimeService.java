package com.go.service.attendance;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.go.po.common.PageBean;
import com.go.service.base.BaseService;
/**
 * 课时Service
 * @author Administrator
 *
 */
@Service
public class TeachertimeService extends BaseService {

	/**
	 * 分页查找数据
	 * @param parameter
	 * @return
	 */
	public  PageBean  findList(Map<String,Object> parameter){
		PageBean<Map<String,Object>> pb= this.getBaseDao().findPageBean("teachertime.findcount", "teachertime.findlist", parameter);
		List<Map<String,Object>> list=pb.getList();
		for(Map<String,Object> map:list){
			Map<String,Object> n_parameter=new HashMap<String,Object>();
			n_parameter.put("TIMEID", map.get("ID"));
			List<Map<String,Object>> ll=this.getBaseDao().findList("lesson.findall", n_parameter);
			if(ll!=null && list.size()>0){
				map.put("children", ll);
			}
		}
		return pb;
	}
	/**
	 * 根据条件查询所有数据
	 * @param parameter
	 * @return
	 */
	public List<Map<String,Object>> findAll(Map<String,Object> parameter){
		return this.getBaseDao().findList("teachertime.findall", parameter);
	}
	
	/**
	 * 加载信息
	 * @param parameter
	 * @return
	 */
	public  Map<String,Object>  load(Map<String,Object> parameter){
		return this.getBaseDao().loadEntity("teachertime.load", parameter);
	}
	/**
	 * 添加菜单
	 * @param parameter
	 * @return
	 */
	public  void  add(Map<String,Object> parameter){
	    this.getBaseDao().insert("teachertime.add", parameter);
	}
	
	/**
	 * 更新菜单
	 * @param parameter
	 */
	public  void  update(Map<String,Object> parameter){
		this.getBaseDao().update("teachertime.update", parameter);
	}
	
	
	/**
	 * 删除数据
	 * @param parameter
	 */
	public  void  delete(List<String> parameter){
		this.getBaseDao().delete("teachertime.delete", parameter);
	}
	/**
	 * 删除TTIMELESSON
	 * @param parameter
	 */
	public  void  deleteTL(List<String> parameter){
		this.getBaseDao().delete("timelesson.delete", parameter);
	}
	/**
	 * 添加TTIMELESSON
	 * @param parameter
	 */
	public  void  addTL(List<Map<String,Object>> parameter){
	    this.getBaseDao().insert("timelesson.add", parameter);
	}
	/**
	 * 查询TTIMELESSON
	 * @param parameter
	 * @return
	 */
	public List<Map<String,Object>> findTL(Map<String,Object> parameter){
		return this.getBaseDao().findList("timelesson.findall", parameter);
	}
}
