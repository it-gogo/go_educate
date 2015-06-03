package com.go.service.platform;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.go.po.common.PageBean;
import com.go.service.base.BaseService;
/**
 * 课程Service
 * @author Administrator
 *
 */
@Service
public class CurriculumService extends BaseService {

	/**
	 * 分页查找数据
	 * @param parameter
	 * @return
	 */
	public  PageBean<Map<String,Object>>  findList(Map<String,Object> parameter){
		return this.getBaseDao().findPageBean("curriculum.findcount", "curriculum.findlist", parameter);
	}
	/**
	 * 根据条件查询所有数据
	 * @param parameter
	 * @return
	 */
	public List<Map<String,Object>> findAll(Map<String,Object> parameter){
		return this.getBaseDao().findList("curriculum.findall", parameter);
	}
	
	/**
	 * 加载信息
	 * @param parameter
	 * @return
	 */
	public  Map<String,Object>  load(Map<String,Object> parameter){
		return this.getBaseDao().loadEntity("curriculum.load", parameter);
	}
	/**
	 * 添加菜单
	 * @param parameter
	 * @return
	 */
	public  void  add(Map<String,Object> parameter){
	    this.getBaseDao().insert("curriculum.add", parameter);
	}
	
	/**
	 * 更新菜单
	 * @param parameter
	 */
	public  void  update(Map<String,Object> parameter){
		this.getBaseDao().update("curriculum.update", parameter);
	}
	
	/**
	 * 更新数据状态
	 * @param parameter
	 */
	public void updatestat(Map<String,Object> parameter){
		this.getBaseDao().update("curriculum.changestat", parameter);
	}
	
	/**
	 * 删除数据
	 * @param parameter
	 */
	public  void  delete(List<String> parameter){
		this.getBaseDao().delete("curriculum.delete", parameter);
	}
}
