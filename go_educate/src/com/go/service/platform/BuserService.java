package com.go.service.platform;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.go.po.common.PageBean;
import com.go.service.base.BaseService;
/**
 * 用户Service
 * @author Administrator
 *
 */
@Service
public class BuserService extends BaseService {

	/**
	 * 我的学员个数
	 * @param parameter
	 * @return
	 */
	public int myStudentCount(Map<String,Object> parameter){
		return Integer.parseInt(this.getBaseDao().findOne("buser.findcount", parameter).toString());
	}
	/**
	 * 分页查找数据
	 * @param parameter
	 * @return
	 */
	public  PageBean<Map<String,Object>>  findList(Map<String,Object> parameter){
		return this.getBaseDao().findPageBean("buser.findcount", "buser.findlist", parameter);
	}
	/**
	 * 我的老师
	 * @param parameter
	 * @return
	 */
	public  PageBean<Map<String,Object>>  myTeacher(Map<String,Object> parameter){
		PageBean<Map<String,Object>> pb=this.getBaseDao().findPageBean("buser.myteachercount", "buser.myteacher", parameter);
		List<Map<String,Object>> list=pb.getList();
		if(list!=null && list.size()>0){
			for(Map<String,Object> map:list){
				parameter=new HashMap<String,Object>();
				parameter.put("LSUSERID", map.get("ID"));
				List<Map<String,Object>> curriculumList=this.getBaseDao().findList("curriculum.findall", parameter);
				map.put("curriculumList", curriculumList);
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
		return this.getBaseDao().findList("buser.findall", parameter);
	}
	/**
	 * 查询课程
	 * @param parameter
	 * @return
	 */
	public List<Map<String,Object>> findusercurriculum(Map<String,Object> parameter){
		return this.getBaseDao().findList("buser.findusercurriculum", parameter);
	}
	
	/**
	 * 加载信息
	 * @param parameter
	 * @return
	 */
	public  Map<String,Object>  load(Map<String,Object> parameter){
		return this.getBaseDao().loadEntity("buser.load", parameter);
	}
	/**
	 * 添加菜单
	 * @param parameter
	 * @return
	 */
	public  void  add(Map<String,Object> parameter){
	    this.getBaseDao().insert("buser.add", parameter);
	}
	
	/**
	 * 更新菜单
	 * @param parameter
	 */
	public  void  update(Map<String,Object> parameter){
		this.getBaseDao().update("buser.update", parameter);
	}
	
	/**
	 * 更新数据状态
	 * @param parameter
	 */
	public void updatestat(Map<String,Object> parameter){
		this.getBaseDao().update("buser.changestat", parameter);
	}
	public void updatepassword(Map<String,Object> parameter){
		this.getBaseDao().update("buser.changepassword", parameter);
	}
	
	/**
	 * 删除数据
	 * @param parameter
	 */
	public  void  delete(List<String> parameter){
		this.getBaseDao().delete("buser.delete", parameter);
	}
	
	/**
	 * 删除TUSERCURRICULUM
	 * @param parameter
	 */
	public  void  deleteUC(List<String> parameter){
		this.getBaseDao().delete("usercurriculum.delete", parameter);
	}
	/**
	 * 添加TUSERCURRICULUM
	 * @param parameter
	 */
	public  void  addUC(List<Map<String,Object>> parameter){
	    this.getBaseDao().insert("usercurriculum.add", parameter);
	}
}
