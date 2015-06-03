package com.go.common.interceptor;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.go.common.util.LogUtil;
import com.go.common.util.SysUtil;
import com.go.po.common.Syscontants;

public class QSessionInterceptor implements HandlerInterceptor{

	
	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response,
			Object arg2) throws Exception {
		// TODO Auto-generated method stub
		//判断是否登陆
		Map<String,Object> quser = SysUtil.getSessionUsr(request, "quser");
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
         builder.append("../../common/loginPage.do\";</script>");  
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
