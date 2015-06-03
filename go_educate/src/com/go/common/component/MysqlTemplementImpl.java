package com.go.common.component;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.go.po.common.Syscontants;

public class MysqlTemplementImpl implements SqlTemplementInf{

	/**
	 * 创建查询SQL
	 */
	@Override
	public Map<String, Object> createQuerySql(Map<String, Object> parameter) {
		Map<String,Object>  resmap = new HashMap<String,Object>(parameter);
		StringBuffer querystr = new StringBuffer(""); 
		Iterator<String> it = parameter.keySet().iterator();
		
		while(it.hasNext()){
			String key = it.next();
			Object  val = parameter.get(key);
			if(key.equals(Syscontants.PAGE_PARAMETER)){//第几页
				
			}else if(key.equals(Syscontants.ROWS_PARAMETER)){//每页条数
				
			}else if(key.equals(Syscontants.SORT_PARAMETER)){ //排序字段
				
			}else if(key.equals(Syscontants.ORDER_PARAMETER)){//排序方法
				
			}else{
				//获取条件
				String[] conditions = getConditions(key);
				
				if(val!=null&&!"".equals(val.toString())){
					    String t_key = conditions[0].replace("-", ".");
						if(conditions[1].equals("like")){
							querystr.append(" and "+t_key+" like  '%#{"+t_key+"}%'");
						}else if(conditions[1].equals("likel")){
							querystr.append(" and "+t_key+" like '%'#{"+t_key+"}");
						}else if(conditions[1].equals("liker")){
							querystr.append(" and "+t_key+" like  '#{"+t_key+"}%'");
						}else {
							querystr.append(" and "+t_key+ conditions[1]+" #{"+t_key+"}");
						}
						resmap.put(t_key, val);
				}
			}
		}
		resmap.put("querystr", querystr.toString());
 		return  resmap;
	}
	
	/**
	 * 创建查询SQL
	 */
	@Override
	public Map<String, Object> createQuerySql1(Map<String, Object> parameter) {
		Map<String,Object>  resmap = new HashMap<String,Object>(parameter);
		StringBuffer querystr = new StringBuffer(""); 
		Iterator<String> it = parameter.keySet().iterator();
		
		while(it.hasNext()){
			String key = it.next();
			Object  val = parameter.get(key);
			if(key.equals(Syscontants.PAGE_PARAMETER)){//第几页
				
			}else if(key.equals(Syscontants.ROWS_PARAMETER)){//每页条数
				
			}else if(key.equals(Syscontants.SORT_PARAMETER)){ //排序字段
				
			}else if(key.equals(Syscontants.ORDER_PARAMETER)){//排序方法
				
			}else{
				//获取条件
				String[] conditions = getConditions(key);
				
				if(val!=null&&!"".equals(val.toString())){
					    String t_key = conditions[0].replace("-", ".");
						if(conditions[1].equals("like")){
							querystr.append(" and "+t_key+" like  '%'+#{"+t_key+"}+'%'");
						}else if(conditions[1].equals("likel")){
							querystr.append(" and "+t_key+" like '%'+ #{"+t_key+"}");
						}else if(conditions[1].equals("liker")){
							querystr.append(" and "+t_key+" like  #{"+t_key+"}+'%'");
						}else {
							querystr.append(" and "+t_key+ conditions[1]+" #{"+t_key+"}");
						}
						resmap.put(t_key, val);
				}
			}
		}
		resmap.put("querystr", querystr.toString());
 		return  resmap;
	}
	
	
	
	
	/**
	 * 创建分页信息
	 */
	@Override
	public String  createPageSql(Map<String,Object> parameter){
		
		return "";
	}
	
	/**
	 * 获取查询条件
	 * @param key
	 * @return
	 */
	public String[] getConditions(String key) {
		String[]  res = new String[2];
		int i = key.lastIndexOf("_");
		if(i<0){
			res[0] = key;
			res[1] = "like";
		}else{
			res[0] = key.substring(0,i);
			res[1] = key.substring(i+1, key.length());
		}
		return res;
	}

}
