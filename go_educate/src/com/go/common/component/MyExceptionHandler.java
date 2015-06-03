package com.go.common.component;

import java.net.ConnectException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import com.go.common.util.SysUtil;

/**
 * 自定义异常类
 * @author Administrator
 *
 */
public class MyExceptionHandler implements HandlerExceptionResolver {

	@Override
	public ModelAndView resolveException(HttpServletRequest request,
			 HttpServletResponse response, 
			 Object arg2, Exception ex) {
		// TODO Auto-generated method stub
		boolean  isAjax = SysUtil.isAjaxRequest(request);
		if(ex instanceof  DataAccessException){
			if(isAjax){
				SysUtil.ajaxMessage(response, "执行SQL语句错误");
			}else{
				
			}
		}else if(ex instanceof SQLException){
			if(isAjax){
				SysUtil.ajaxMessage(response, "执行SQL语句错误");
			}else{
				
			}
		}else if(ex instanceof NullPointerException){
			if(isAjax){
				SysUtil.ajaxMessage(response, "空指针错误");
			}else{
				
			}
		}else if(ex instanceof ConnectException){
			if(isAjax){
				SysUtil.ajaxMessage(response, "数据库连接错误");
			}else{
				
			}
		}
		return null;
	}

}
