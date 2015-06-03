package com.go.common.util;

import java.io.InputStream;
import java.util.Properties;

public class Address {
	private static Properties p;
	static{
		try{
			InputStream stream = Address.class.getClassLoader().getResourceAsStream("url.properties");
			p = new Properties();
		    p.load(stream);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public  static String getParame(String parame){
		String str=p.getProperty(parame);
		 return str;
	}
}
