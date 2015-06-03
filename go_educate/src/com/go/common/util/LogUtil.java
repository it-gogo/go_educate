package com.go.common.util;

import org.apache.log4j.Logger;

/**
 * 陈永楠
 * 日期：2014-03-06
 * 取得日志类
 * @author Administrator
 *
 */
public class LogUtil {

	private static Logger logger = null;
	/**
	 * 输出DEBUG信息
	 * @param c
	 * @return
	 */
	public static void debug(Class<?> c,Object  message){
	    logger = Logger.getLogger(c);
		logger.debug(message);
	}
	
	public static void debug(Class<?> c,Object  message,Throwable t){
	    logger = Logger.getLogger(c);
		logger.debug(message,t);
	}
	
	/**
	 * 输出INFO信息
	 * @param c
	 * @param message
	 */
	public static void info(Class<?> c,Object message){
	    logger = Logger.getLogger(c);
		logger.info(c.getName()+":"+message);
	}
	
	public static void info(Class<?> c,Object message,Throwable t){
	    logger = Logger.getLogger(c);
		logger.info(message,t);
	}
	
	/**
	 * 记录警告
	 * @param c
	 * @param message
	 */
	public static void warn(Class<?> c,Object message){
	    logger = Logger.getLogger(c);
		logger.warn(message);
	}
	
	public static void warn(Class<?> c,Object message,Throwable  t){
		Logger logger = Logger.getLogger(c);
		logger.warn(message,t);
	}
	
	/**
	 * 输出错误
	 * @param c
	 * @param message
	 */
	public static void error(Class<?> c,Object message){
		Logger logger = Logger.getLogger(c);
		logger.error(message);
	}
	
	public static void error(Class<?> c,Object message,Throwable  t){
		Logger logger = Logger.getLogger(c);
		logger.error(message,t);
	}
	
}
