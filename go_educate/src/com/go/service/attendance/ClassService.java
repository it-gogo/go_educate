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
	 * 查询可以调课老师时间
	 * @param parameter
	 * @return
	 */
	public List<Map<String,Object>> findTransfer(Map<String,Object> parameter){
		return this.getBaseDao().findList("teachertime.findtransfer", parameter);
	}
	/**
	 * 查询调课时间的课时
	 * @param parameter
	 * @return
	 */
	public List<Map<String,Object>> findTransferLesson(Map<String,Object> parameter){
		return this.getBaseDao().findList("lesson.findtransfer", parameter);
	}
	/**
	 * 查询是否可以调课
	 * @param parameter
	 * @return
	 */
	public long findIsTransfer(Map<String,Object> parameter){
		long count=(Long) this.getBaseDao().findOne("teachertime.findistransfer", parameter);
		return count;
	}
	public String findTransferElective(Map<String,Object> parameter){
		String electiveid=(String) this.getBaseDao().findOne("teachertime.findtransferelective", parameter);
		return electiveid;
	}
	/**
	 * 添加调课关联
	 * @param parameter
	 */
	public void addTransfer(List<Map<String,Object>> parameter){
		this.getBaseDao().insert("class.addtransfer", parameter);
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
	/**
	 * 删除调课
	 * @param parameter
	 */
	public  void  deleteTransfer(List<String> parameter){
		this.getBaseDao().delete("class.deletetransfer", parameter);
	}
	public void setFeedBackId(Map<String, Object> parameter) {
		this.getBaseDao().delete("class.setFeedBackId", parameter);
	}
	public List<Map<String,Object>> findListByParams(Map<String, Object> params) {
		return this.getBaseDao().findList("class.findListByParams", params);
		
	}
}
