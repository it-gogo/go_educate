package com.go.common.util;

import java.beans.BeanInfo;
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

public class MapBeanUtil {
	/**
	 * 
	 * <br> 
	 * <b>功能：</b>Map和Bean之间互相转换<br>
	 * <b>日期：</b> 2014-12-02 <br>
	 * @param map
	 * @param bean
	 * @return
	 * @throws InstantiationException
	 * @throws IllegalAccessException
	 * @throws IntrospectionException
	 */
	public static <T>  T mapToBean(Map<?,?> map,Class<T> bean) throws InstantiationException, IllegalAccessException, IntrospectionException{
		BeanInfo beanInfo = Introspector.getBeanInfo(bean);
		T obj = bean.newInstance();
		PropertyDescriptor[] propertyDescriptors = beanInfo.getPropertyDescriptors();
		for (int i = 0; i < propertyDescriptors.length; i++) {
			PropertyDescriptor descriptor = propertyDescriptors[i];
			Method method=descriptor.getWriteMethod();
			String name=descriptor.getName();
			if(map.containsKey(name)){
				Class<?>[] types=method.getParameterTypes();
				for(int x=0;x<types.length;x++){ //类型转换
					Object value = map.get(name);
					try {
						method.invoke(obj, new Object[]{value});
					} catch (Exception e) {
						LogUtil.error(MapBeanUtil.class,"type:"+types[x].getSimpleName()+"|name:"+name+"|value:"+value);
						e.printStackTrace();
					}
				}
			}
		}
		return obj;
	}

	/**
	 * 
	 * <br>
	 * <b>功能：</b>方法功能描述<br>
	 * <b>日期：</b> 2014-12-02 <br>
	 * @param bean
	 * @return
	 * @throws IntrospectionException
	 * @throws IllegalAccessException
	 * @throws InvocationTargetException
	 */
	public static <T> Map<?,?> beanToMap(T bean) throws IntrospectionException, IllegalAccessException, InvocationTargetException {
		Class<?> type = bean.getClass();
		Map<String,Object> returnMap = new HashMap<String, Object>();
		BeanInfo beanInfo = Introspector.getBeanInfo(type);
		PropertyDescriptor[] propertyDescriptors = beanInfo.getPropertyDescriptors();
		for (int i = 0; i < propertyDescriptors.length; i++) {
			PropertyDescriptor descriptor = propertyDescriptors[i];
			String propertyName = descriptor.getName();
			if (!propertyName.equals("class")) {
				Method readMethod = descriptor.getReadMethod();
				Object result = readMethod.invoke(bean, new Object[]{});
				if (result != null) {
					returnMap.put(propertyName, result);
				} else {
					returnMap.put(propertyName, "");
				}
			}
		}
		return returnMap;
	}

	public static void main(String[] args) {
		//TbsUserBean bean=new TbsUserBean();
		/*bean.setId("111111111");
		bean.setCount(100);
		bean.setIp("127.0.0.1");
		bean.setFailCount(0);
		bean.setPassword("123456");
		bean.setUsername("admin");*/
		/*Map<String,Object> map=new HashMap<String, Object>();
		map.put("count", 100);
		map.put("ip", "127.0.0.1");
		map.put("failCount", 100);
		map.put("password", "123456");
		map.put("username", "admin");
		try {
			TbsUserBean tbsUserBean=MapBeanUtil.mapToBean(map,TbsUserBean.class);
			try {
				System.out.println(MapBeanUtil.beanToMap(tbsUserBean));
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			}
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IntrospectionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
	
	}
}
