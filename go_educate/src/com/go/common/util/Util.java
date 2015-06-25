package com.go.common.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import com.thoughtworks.xstream.core.util.Base64Encoder;

public class Util {
	//验证字符串是否为正确路径名的正则表达式 
	private static String matches = "[A-Za-z]:\\\\[^:?\"><*]*"; //通过 sPath.matches(matches) 方法的返回值判断是否正确 
	
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
	
	/**
	 * 根据路径删除指定的目录或文件，无论存在与否 
	 * @author zhangjf
	 * @create_date 2015-6-25 下午9:48:36
	 * @param path
	 * @return
	 */
	public static boolean deleteFolder(String path){
		boolean flag=false;
		File file=new File(path);
		//判断目录或文件是否存在
		if(!file.exists()){//不存在则返回flag
			return flag;
		}else{
			//判断是否文件
			if(file.isFile()){//是文件时调用删除文件方法
				return deleteFile(path);
			}else{//为目录时调用删除目录方法
				return deleteDirectory(path);
			}
		}//end exists
	}

	/**
	 * 单个文件删除方法
	 * @author zhangjf
	 * @create_date 2015-6-25 下午9:52:01
	 */
	public static boolean deleteFile(String path) {
		File file=new File(path);
		//路径为文件且不为空则进行删除
		if(file.isFile()&&file.exists()){
			file.delete();
			return true;
		}
		return false;
	}
	
	/**
	 * 删除目录（文件夹）以及目录下的文件 
	 * @author zhangjf
	 * @create_date 2015-6-25 下午9:52:22
	 */
	public static  boolean deleteDirectory(String path) {
		boolean flag=true;
		 //如果path不以文件分隔符结尾，自动添加文件分隔符 
		if(!path.endsWith(File.separator)){
			path+=File.separator;
		}
		File dirFile=new File(path);
		 //如果dir对应的文件不存在，或者不是一个目录，则退出  
		if(!dirFile.exists()||!dirFile.isDirectory()){
			return false;
		}
		//删除文件夹下的所有文件(包括子目录) 
		File[] files=dirFile.listFiles();
		for (int i = 0,len=files.length; i < len; i++) {
			File file=files[i];
			if(file.isFile()){//若是文件则进行文件删除
				flag = deleteFile(file.getAbsolutePath()); 
				if (!flag){
					break;  
				}
			}else{
				 flag = deleteDirectory(file.getAbsolutePath());
				 if (!flag){
					 break;  
				 }
			}
		}//end for
		if (!flag) {
			return false; 
		}
		//删除当前目录  
		if (dirFile.delete()) { 
			 return true;  
		}else{
			return false;  
		}
	}
}
