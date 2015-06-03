package com.go.common.util;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.WebRequest;

public class ContextUtil {
	
	private static ThreadLocal<HttpServletRequest>  threadLocalRequest = new ThreadLocal<HttpServletRequest>();

	private static ThreadLocal<HttpServletResponse>  threadLocalResponse = new ThreadLocal<HttpServletResponse>();
	
	
	
	/**
	 * 获取request
	 * @return
	 */
	public static HttpServletRequest getRequest(){
		HttpServletRequest  request = threadLocalRequest.get();
		return request;
	}
	
	
	public static void setRequest(HttpServletRequest request){
		threadLocalRequest.set(request);
	}
	
	public static void setResponse(HttpServletResponse response){
		threadLocalResponse.set(response);
	}
	
	 
	
	/**
	 * 获取response
	 * @return
	 */
	public static HttpServletResponse getResponse(){
		HttpServletResponse response = threadLocalResponse.get();
		return response;
	}
	
	public static HttpSession getSession(){
		HttpSession session = getRequest().getSession();
		return session;
	}
	
	
	public static ServletContext getServletContext(){
		HttpSession session = getRequest().getSession();
		ServletContext servletContext = session.getServletContext();
		return servletContext;
	}
	
	/**
	 * 设置SERVLET环境属性
	 * @param key
	 * @param obj
	 */
	public static void setServletContextAttr(String key,Object obj){
		ServletContext servletContext = getServletContext();
		servletContext.setAttribute(key, obj);
	}
	
	/**
	 * 获取SERVLET环境变量
	 * @param key
	 * @return
	 */
	public static Object getServletContextAttr(String key){
		Object obj = getServletContext().getAttribute(key);
		return obj;
	}
	
	/**
	 * 设置SESSION属性
	 * @param key
	 * @param obj
	 */
	public static void setSessionAttr(String key,Object obj){
		HttpSession session = getRequest().getSession();
		session.setAttribute(key, obj);
	}
	
	/**
	 * 获取SESSION属性
	 * @param key
	 * @return
	 */
	public static Object getSessionAttr(String key){
	   Object obj = getSession().getAttribute(key);
	   return obj;
	}
	
	public static void removeRequest(){
		threadLocalRequest.remove();
	}
	
	public static void removeResponse(){
		threadLocalResponse.remove();
	}
	
	
	
	
}
