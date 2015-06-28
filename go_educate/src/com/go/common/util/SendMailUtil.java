package com.go.common.util;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

/**
 * 邮件发送工具类
 * @author zhangjf
 * @create_date 2015-6-28 下午3:13:43
 */
public class SendMailUtil {
	/**
	 * Message对象将存储我们实际发送的电子邮件信息，
	 * Message对象被作为一个MimeMessage对象来创建并且需要知道应当选择哪一个JavaMail session
	 */
	private MimeMessage message;
	/**
	 * Session类代表JavaMail中的一个邮件会话
	 * 每一个基于JavaMail的应用程序至少有一个Session（可以有任意多的Session）。
	 * JavaMail需要Properties来创建一个session对象。
	 * 寻找"mail.smtp.host"    属性值就是发送邮件的主机
	 * 寻找"mail.smtp.auth"    身份验证，目前免费邮件服务器都需要这一项
	 */
	private Session session;
	/***
     * 邮件是既可以被发送也可以被受到。JavaMail使用了两个不同的类来完成这两个功能：Transport 和 Store。 
     * Transport 是用来发送信息的，而Store用来收信。
     */
	private Transport transport;	

	private String mailHost="";
	private String sender_username="";
	private String sender_password="";
	private Properties properties = new Properties();
	
	public SendMailUtil(boolean debug){
		
		InputStream in=SendMailUtil.class.getClassLoader().getResourceAsStream("mail.properties");
		try {
			properties.load(in);
			this.mailHost=properties.getProperty("mail.host");
			this.sender_username=properties.getProperty("mail.userName");
			this.sender_password=properties.getProperty("mail.password");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		session=Session.getInstance(properties);
		session.setDebug(debug);//开启后有调试信息
		message=new MimeMessage(session);
	}
	
	/**
	 * 发送携带附件邮件
	 * @author zhangjf
	 * @create_date 2015-6-28 下午3:30:09
	 * @param subject
	 * @param content
	 * @param receiver
	 * @param file
	 */
	public void sendMail(String subject,String content,String receiver,File file){
		//下面这个是设置发送人的Nick name
		try {
			InternetAddress from = new InternetAddress(MimeUtility.encodeWord("itgogo.com")+" <"+sender_username+">");
			message.setFrom(from);//下面这个是设置发送人的Nick name
			// 收件人
            InternetAddress to = new InternetAddress(receiver);
            message.setRecipient(Message.RecipientType.TO, to);//还可以有CC、BCC
           // message.setSubject(subject);
            message.setSubject(MimeUtility.encodeText(subject, "UTF-8", "B"));//设置邮件标题防止乱码
            // 向multipart对象中添加邮件的各个部分内容，包括文本内容和附件
            Multipart multipart = new MimeMultipart();         
          
          
            //   设置邮件的文本内容
            BodyPart contentPart = new MimeBodyPart();
            contentPart.setText("邮件的具体内容在此");
            multipart.addBodyPart(contentPart);
            //添加附件
            BodyPart messageBodyPart= new MimeBodyPart();
            DataSource source = new FileDataSource(file);
            //添加附件的内容
            messageBodyPart.setDataHandler(new DataHandler(source));
            //添加附件的标题
            //这里很重要，通过下面的Base64编码的转换可以保证你的中文附件标题名在发送时不会变成乱码
            sun.misc.BASE64Encoder enc = new sun.misc.BASE64Encoder();
            messageBodyPart.setFileName("=?GBK?B?"+enc.encode(file.getName().getBytes())+"?=");
            multipart.addBodyPart(messageBodyPart);
            //将multipart对象放到message中
            message.setContent(multipart);
            //保存邮件
            message.saveChanges();
            //   发送邮件
            transport = session.getTransport("smtp");
            //连接服务器的邮箱
            transport.connect(mailHost, sender_username, sender_password);
            //把邮件发送出去
            transport.sendMessage(message, message.getAllRecipients());
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			 if(transport!=null){
	                try {
	                    transport.close();
	                } catch (MessagingException e) {
	                    e.printStackTrace();
	                }
	            }
		}
	}
}
