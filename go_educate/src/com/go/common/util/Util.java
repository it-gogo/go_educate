package com.go.common.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import com.thoughtworks.xstream.core.util.Base64Encoder;

public class Util {
	public static String Encryption(String str) throws NoSuchAlgorithmException {
		MessageDigest md = MessageDigest.getInstance("md5");
		byte[] buf = md.digest(str.getBytes());
		return new Base64Encoder().encode(buf);
	}
	
	/**
	  * 保存文件
	  */
	public static void saveFileFromInputStream(InputStream stream,String path,String filename) throws IOException {      
		/***
		 * 如果文件夹不存在则创建文件夹
		 */
		File fls = new File(path);
		if(!fls.exists()){
			fls.mkdirs();
		}
       FileOutputStream fs=new FileOutputStream( path + "/"+ filename);
       byte[] buffer =new byte[1024*1024];
       while (stream.read(buffer)!=-1)
       {
       	fs.write(buffer);
       	fs.flush();
       } 
       fs.close();
       stream.close();      
   }  
}
