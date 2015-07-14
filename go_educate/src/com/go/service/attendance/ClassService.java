package com.go.service.attendance;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.go.po.common.PageBean;
import com.go.service.base.BaseService;
/**
 * 节课Service
 * @author Administrator
 *
 */
@Service
public class ClassService extends BaseService {

	/**
	 * 记录数
	 * @param parameter
	 * @return
	 */
	public int findCount(Map<String,Object> parameter){
		return Integer.parseInt(this.getBaseDao().findOne("class.findattencount", parameter).toString());
	}
	public int findSgkCount(Map<String,Object> parameter){
		return Integer.parseInt(this.getBaseDao().findOne("class.findsgkcount", parameter).toString());
	}
	/**
	 * 分页查找数据
	 * @param parameter
	 * @return
	 */
	public  PageBean<Map<String,Object>>  findList(Map<String,Object> parameter){
		return this.getBaseDao().findPageBean("class.findcount", "class.findlist", parameter);
	}
	/**
	 * 根据条件查询所有数据
	 * @param parameter
	 * @return
	 */
	public List<Map<String,Object>> findAll(Map<String,Object> parameter){
		return this.getBaseDao().findList("class.findall", parameter);
	}
	/**
	 *未上课
	 * @param parameter
	 * @return
	 */
	public List<Map<String,Object>> findNoClass(Map<String,Object> parameter){
		return this.getBaseDao().findList("class.findNoClass", parameter);
	}
	
	/**
	 * 加载信息
	 * @param parameter
	 * @return
	 */
	public  Map<String,Object>  load(Map<String,Object> parameter){
		return this.getBaseDao().loadEntity("class.load", parameter);
	}
	/**
	 * 添加菜单
	 * @param parameter
	 * @return
	 */
	public  void  add(Map<String,Object> parameter){
	    this.getBaseDao().insert("class.add", parameter);
	}
	
	/**
	 * 更新菜单
	 * @param parameter
	 */
	public  void  update(Map<String,Object> parameter){
		this.getBaseDao().update("class.update", parameter);
	}
	
	
	/**
	 * 删除数据
	 * @param parameter
	 */
	public  void  delete(List<String> parameter){
		this.getBaseDao().delete("class.delete", parameter);
	}
	public void setFeedBackId(Map<String, Object> parameter) {
		this.getBaseDao().delete("class.setFeedBackId", parameter);
	}
	public List<Map<String,Object>> findListByParams(Map<String, Object> params) {
		return this.getBaseDao().findList("class.findListByParams", params);
		
	}
}
