package com.go.service.common;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.go.common.util.TreeUtil;
import com.go.service.base.BaseService;

@Service
public class LoginService extends BaseService{

	/**
	 * 查询
	 * @param parameter
	 * @return
	 */
	public  List<Map<String,Object>>  findMenu(Map<String,Object> parameter){
		List<Map<String,Object>> list= this.getBaseDao().findList("login.findmenu",parameter);
		return TreeUtil.createMenuTree(list);
	}
	
	/**
	 * 查找用户
	 * @param parameter
	 * @return
	 */
	public  Map<String,Object>  findUser(Map<String,Object> parameter){
		return this.getBaseDao().loadEntity("login.findUser", parameter);
	}
}
