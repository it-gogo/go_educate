package com.go.common.component;

import java.util.Map;

/**
 * 生成查询参数类的模板
 * @author Administrator
 *
 */
public interface SqlTemplementInf {

	/**
	 * 生成查询SQL模板
	 * @return
	 */
	public Map<String,Object>  createQuerySql(Map<String,Object> parameter);
	
	public String  createPageSql(Map<String,Object> parameter);
	
	public Map<String, Object> createQuerySql1(Map<String, Object> parameter);
		
}
