package com.go.thread;

import java.io.File;
import java.util.Map;

import com.go.common.util.JavaMail;
import com.go.common.util.SendMailUtil;

/**
 * 邮件发送线程
 * @author zhangjf
 * @create_date 2015-6-28 下午8:32:36
 */
public class SendMailThread  extends Thread{
	private Map<String, Object> user;//需要发送邮件的用户
	private String subject;//邮件主题
	private File file;//发送附件文件
	public SendMailThread(Map<String, Object> user,String subject,File file){
		this.user=user;
		this.subject=subject;
		this.file=file;
	}
	/**
	 * 发送邮件线程
	 */
	@Override
	public void run() {
		String url=file.getPath();
		String name=url.substring(url.lastIndexOf("\\")+1, url.length());
		JavaMail.setAffix(url, name);
		JavaMail.sendMail(user.get("EMAIL").toString(),subject, "有新的作业文件上传,请及时登录下载");
//		SendMailUtil sender=new SendMailUtil(false);
//		sender.sendMail(subject, "有新的作业文件上传,请及时登录下载", user.get("EMAIL").toString(), file);
	}
	
	public static void main(String[] args) {
		File f=new File("D:/2013-02.jpg");
		String url=f.getPath();
		System.out.println(f.getPath());
		System.out.println(url.substring(url.lastIndexOf("\\")+1, url.length()));
	}
}
