package com.go.common.interceptor;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.go.common.util.LogUtil;
import com.go.common.util.SysUtil;
import com.go.po.common.Syscontants;
import com.go.service.platform.BmenuService;

public class SessionInterceptor implements HandlerInterceptor{
	@Resource
	  private  BmenuService  bmenuService;
	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2, ModelAndView arg3) throws Exception {
		if(arg3==null){
			return;
		}
		String  uri = request.getRequestURI();
		String str=request.getContextPath();
		String url=uri.replace(str, "");
		Map<String,Object> parameter=new HashMap<String,Object>();
		parameter.put("URLS", url);
		Map<String,Object> res=bmenuService.findOne(parameter);
		if(res==null){
			url=url.substring(0, url.lastIndexOf("/"));
			parameter.put("URLS", url);
			res=bmenuService.findOne(parameter);
		}
		if(res!=null){
			Map<String,Object> user=SysUtil.getSessionUsr(request, "user");
			List<Map<String,Object>> menuList=(List<Map<String, Object>>) user.get("menuList");
			for(Map<String,Object> map:menuList){
				if(map.get("ID").equals(res.get("PID"))){
					map.put("selectID", res.get("ID"));
					arg3.addObject("selectMenu", map);
					break;
				}
			}
		}
	}

	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response,
			Object arg2) throws Exception {
		// TODO Auto-generated method stub
		String  uri = request.getRequestURI();
		//判断是否登陆
//		if(uri.indexOf("login")>-1){
//			return true;
//		}
		String requestType = request.getHeader("X-Requested-With"); 
		Map<String,Object> user = SysUtil.getSessionUsr(request, Syscontants.USER_SESSION_KEY);
		if(requestType!=null&&requestType.indexOf("XMLHttpRequest")>-1){
			if(user==null){
			    ajaxMessage(response);
			    return false;
			}
		}else{
			
			if(user==null){
				redirect(response);
				return false;
			}
		}
		LogUtil.info(this.getClass(), requestType);
		return true;
	}
	
	/**
	 * 重新定向到SESSION页面
	 * @param response
	 */
	private  void  redirect(HttpServletResponse response){
		try{
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();  
         StringBuilder builder = new StringBuilder();  
         builder.append("<script type=\"text/javascript\" charset=\"UTF-8\">");  
         builder.append("alert(\"会话过期，请重新登录\");");  
         builder.append("window.top.location.href=\"");  
         builder.append("../common/loginPage.do\";</script>");  
         out.print(builder.toString());  
         out.close();  
		 }catch(Exception e){
        	 e.printStackTrace();
         }
	}
	
	/**
	 * 设置AJAX 过期提示
	 * @param response
	 */
	private  void  ajaxMessage(HttpServletResponse response){
		JSONObject  jsonobj = new JSONObject();
		jsonobj.put(Syscontants.SESSION_TIME_OUT, "会话过期，请重新登录");
		PrintWriter out = null;
		try{
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
	        out = response.getWriter();
		    out.print(jsonobj.toJSONString());
		}catch(IOException e){
			e.printStackTrace();
			LogUtil.error(this.getClass(), e.getMessage());
		}finally{
		   if(out!=null){
			  out.flush();
			  out.close();
		   }
		}
	}
   
}
