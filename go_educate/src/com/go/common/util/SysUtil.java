package com.go.common.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSONObject;
import com.go.po.common.Syscontants;

public class SysUtil {

	public static HttpSession getSession(HttpServletRequest request){
		HttpSession session = request.getSession();
		return session;
	}
	
	/**
	 * 获取所在部门
	 * @param request
	 * @return
	 */
	public static String getDEPT(HttpServletRequest request){
		String DEPT = "";
		HttpSession session = getSession(request);
		Map<String,Object>  user = (Map<String,Object>)session.getAttribute("user");
		DEPT = user.get("DEP").toString();
		return DEPT;
	}
	
	/**
	 * 获取帐套
	 * @param request
	 * @return
	 */
	public static String getCOMP(HttpServletRequest request){
		String DEPT = "";
		HttpSession session = getSession(request);
		Object  user = session.getAttribute("user");
		Map<String,Object>  result = null;
		if(user!=null){
			result = (Map<String,Object>)user;
		}
		DEPT = result.get("COMPNO").toString();
		return DEPT;
	}
	
	/**
	 * 获取所在部门
	 * @param request
	 * @return
	 */
	public static String getCUSLEVEL(HttpServletRequest request){
		String DEPT = "";
		HttpSession session = getSession(request);
		Map<String,Object>  user = (Map<String,Object>)session.getAttribute("user");
		DEPT = user.get("CUS_LEVEL").toString();
		return DEPT;
	}
	
	/**
	 * 获取所在部门
	 * @param request
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static String getUSR(HttpServletRequest request){
		String SAL_NO = "";
		HttpSession session = getSession(request);
		Map<String,Object>  user = (Map<String,Object>)session.getAttribute("user");
		SAL_NO = user.get("SAL_NO").toString();
		return SAL_NO;
	}
	
	/**
	 * 获取客户
	 * @param request
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static String getCUSUSR(HttpServletRequest request){
		String SAL_NO = "";
		HttpSession session = getSession(request);
		Map<String,Object>  user = (Map<String,Object>)session.getAttribute("user");
		SAL_NO = user.get("CUS_NO").toString();
		return SAL_NO;
	}
	
	
	
	/**
	 * 获取所在部门
	 * @param request
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static String getISCUST(HttpServletRequest request){
		String SAL_NO = "";
		HttpSession session = getSession(request);
		Map<String,Object>  user = (Map<String,Object>)session.getAttribute("user");
		SAL_NO = user.get("ISCUST").toString();
		return SAL_NO;
	}
	
	/**
	 * 获取
	 * @return
	 */
	public static String getParameStr(Map<String,Object> parameter,String key){
		String result = "";
		Object VAL_OBJ = parameter.get(key);
		if(VAL_OBJ!=null){
			result = VAL_OBJ.toString();
		}
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public static Map<String,Object>  getSessionUsr(HttpServletRequest request,String key){
		Object obj = getSession(request).getAttribute(key);
		if(obj!=null){
			return  (Map<String,Object>)obj;
		}
		return  null;
	}
	
	/**
	 * 生成详细地址
	 * @param parameter
	 * @return
	 */
	public static String  createDetailsAdr(Map<String,Object>  parameter,String key){
		Object ADR2_OBJ = parameter.get(key);
		String PROV_NAME = parameter.get("PROV_NAME").toString();
		String CITY_NAME = parameter.get("CITY_NAME").toString();
		String COUN_NAME = parameter.get("COUN_NAME").toString();
		String ADR2 = "";
		if(ADR2_OBJ!=null&&!"".equals(ADR2_OBJ.toString())){
			ADR2 = PROV_NAME+CITY_NAME+COUN_NAME+ADR2_OBJ.toString();
		}
		return  ADR2;
	}
	
	/**
	 * 把地址上的省份\城市\区县去掉
	 * @param result
	 * @return
	 */
	public static Map<String,Object>  replaceProvCityCoun(Map<String,Object>  map,String key){
		Object  ADR_OBJ = map.get(key);
		String ADR= "";
		String PROV_NAME = "";
		String CITY_NAME = "";
		String COUN_NAME = "";
		Map<String,Object> result = new HashMap<String,Object>(map);
		if(ADR_OBJ!=null&&!"".equals(ADR_OBJ.toString())){
			 Object PROV_NAME_OBJ = result.get("PROV_NAME");
			 Object CITY_NAME_OBJ = result.get("CITY_NAME");
			 Object COUN_NAME_OBJ = result.get("COUN_NAME");
			 if(PROV_NAME_OBJ!=null){
				 PROV_NAME = PROV_NAME_OBJ.toString();
			 }
			 if(CITY_NAME_OBJ!=null){
				 CITY_NAME = CITY_NAME_OBJ.toString();
			 }
			 if(COUN_NAME_OBJ!=null){
				 COUN_NAME = COUN_NAME_OBJ.toString();
			 }
			ADR =  ADR_OBJ.toString().replaceFirst(PROV_NAME, "")
					                  .replace(CITY_NAME, "")
					                  .replace(COUN_NAME, "");
			result.put("ADR2", ADR);
		}
		return  result;
	}
	
	/**
	 * 判断是否是AJAX请求
	 * @param request
	 * @return
	 */
	public static boolean isAjaxRequest(HttpServletRequest request){
		boolean result = false;
		String requestType = request.getHeader("X-Requested-With");
		if(requestType!=null&&requestType.indexOf("XMLHttpRequest")>-1){
			result = true;
		}
		return result;
	}
	
	public static void  ajaxMessage(HttpServletResponse response,String message){
		JSONObject  jsonobj = new JSONObject();
		jsonobj.put(Syscontants.SESSION_TIME_OUT, message);
		PrintWriter out = null;
		try{
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
	        out = response.getWriter();
		    out.print(jsonobj.toJSONString());
		}catch(IOException e){
			e.printStackTrace();
		}finally{
		   if(out!=null){
			  out.flush();
			  out.close();
		   }
		}
	}
	
	
	
	
	
}
