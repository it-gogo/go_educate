package com.go.common.component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.go.common.util.SqlUtil;
import com.go.po.common.Syscontants;

public class MySqlComponent implements SqlComponent{

	@Override
	public Map<String, Object> setParameterInfo(HttpServletRequest request) {
		// TODO Auto-generated method stub
		Map<String,Object>  res = new HashMap<String,Object>();  
		Map<String,String[]>  parameter = request.getParameterMap();
		Iterator<String> it = parameter.keySet().iterator();
		while(it.hasNext()){
			String key = it.next();
			String[]  valArr = parameter.get(key);
			if(valArr!=null&&valArr.length>0){
				if(valArr[0]!=null&&!"".equals(valArr[0].trim())){
			       res.put(key, valArr[0].trim());
				}
			}
		}
		return  res;
	}
	
	@Override
	public Map<String, Object> setModifyParameter(HttpServletRequest request) {
		// TODO Auto-generated method stub
		Map<String,Object>  res = new HashMap<String,Object>();  
		Map<String,String[]>  parameter = request.getParameterMap();
		Iterator<String> it = parameter.keySet().iterator();
		while(it.hasNext()){
			String key = it.next();
			String[]  valArr = parameter.get(key);
			if(valArr!=null&&valArr.length>0){
				if(valArr[0]!=null&&!"".equals(valArr[0].trim())){
			       res.put(key, valArr[0]);
				}else{
					res.put(key, "");
				}
			}
		}
		return  res;
	}

	@Override
	public boolean isIDNull(Map<String, Object> parameter,String key) {
		// TODO Auto-generated method stub
		Object  id = parameter.get(key);
		if(id==null||"".equals(id.toString().trim())){
		   return  true;
		}
		return false;
	}

	@Override
	public Map<String, Object> setTableID(Map<String, Object> parameter) {
		// TODO Auto-generated method stub
		Map<String,Object>  res = new HashMap<String,Object>(parameter);
		String  t_id = SqlUtil.uuid();
		res.put("id",t_id);
	    return  res;
	}

	@Override
	public Map<String, Object> queryParameter(HttpServletRequest request) {
		// TODO Auto-generated method stub
		Map<String,Object>  res = new HashMap<String,Object>();  
		Map<String,String[]>  parameter = request.getParameterMap();
		Iterator<String> it = parameter.keySet().iterator();
		while(it.hasNext()){
			String key = it.next();
			String[]  val = parameter.get(key);
            if(key.equals(Syscontants.SORT_PARAMETER)){//排序字段
				res.put(key, val);
			}else if(key.equals(Syscontants.ORDER_PARAMETER)){//排序方法
				res.put(key, val);
			}else{
				if(val!=null&&val.length>0){
				   if(val[0]!=null&&!"".equals(val[0])){
				      res.put(key, val[0].trim());
				   }
				}
			}
		}
		return res;
	}

//	@Override
//	public Map<String, Object> createQuerySql(HttpServletRequest request) {
//		Map<String,Object>  resmap = new HashMap<String,Object>();
//		StringBuffer querystr = new StringBuffer(""); 
//		Map<String,String[]>  parameter = request.getParameterMap();
//		Iterator<String> it = parameter.keySet().iterator();
//		while(it.hasNext()){
//			String key = it.next();
//			//获取条件
//			String[] conditions = getConditions(key);
//			String[]  valarr = parameter.get(key);
//			if(valarr!=null&&valarr.length==1){
//				if(valarr[0]!=null&&!"".equals(valarr[0])){
//					if(conditions[1].equals("like")){
//						querystr.append(" and "+conditions[0]+" like % #{"+conditions[0]+"}%");
//					}else if(conditions[1].equals("likel")){
//						querystr.append(" and "+conditions[0]+" like % #{"+conditions[0]+"}");
//					}else if(conditions[1].equals("liker")){
//						querystr.append(" and "+conditions[0]+" like  #{"+conditions[0]+"}%");
//					}else {
//						querystr.append(" and "+conditions[0]+ conditions[1]+" #{"+conditions[0]+"}");
//					}
//					resmap.put(conditions[0], valarr[0]);
//				}
//			}else if(valarr.length>1){
//				
//			}
//		}
//		resmap.put("querystr", querystr.toString());
// 		return  resmap;
//	}

//	@Override
//	public String[] getConditions(String key) {
//		String[]  res = new String[2];
//		int i = key.lastIndexOf("_");
//		if(i<0){
//			res[0] = key;
//			res[1] = "like";
//		}else{
//			res[0] = key.substring(0,i);
//			res[1] = key.substring(i+1, key.length());
//		}
//		return res;
//	}

	@Override
	public List<String> getIdsParameter(HttpServletRequest request) {
		Map<String,String[]>  parameter = request.getParameterMap();
		String[]  ids = parameter.get("id");
		List<String>  list = new ArrayList<String>();
		if(ids!=null&&ids.length>0){
			String[]  idarr = ids[0].split(",");
			for(int i=0;i<idarr.length;i++){
				list.add(idarr[i]);
			}
		}
		return list;
	}

}
