package com.go.common.component;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface SqlComponent {

	/**
	 * 设置提交的参数信息
	 * @param request
	 * @return
	 */
	public  Map<String,Object>  setParameterInfo(HttpServletRequest request);
	
	/**
	 * 判断参数是否为空
	 * @param parameter
	 * @return
	 */
	public  boolean  isIDNull(Map<String,Object> parameter,String key);
	
	/**
	 * 设置ID
	 * @param parameter
	 * @return
	 */
	public   Map<String,Object>  setTableID(Map<String,Object> parameter);
	
	
	/**
	 * 转换查询请求参数
	 * @param request
	 * @return
	 */
	public  Map<String,Object>  queryParameter(HttpServletRequest request);
	
	/**
	 * 创建查询的SQL
	 * @param request
	 * @return
	 */
//	public   Map<String,Object>  createQuerySql(HttpServletRequest request);
	
	/**
	 * 获取查询条件
	 * @param key
	 * @return
	 */
//	public   String[] getConditions(String key);
	
	/**
	 * 获取请求参数
	 * @param request
	 * @return
	 */
	public    List<String>   getIdsParameter(HttpServletRequest request);
	
	/**
	 * 设置修改参数
	 * @param request
	 * @return
	 */
	public Map<String, Object> setModifyParameter(HttpServletRequest request);
	
	
}
