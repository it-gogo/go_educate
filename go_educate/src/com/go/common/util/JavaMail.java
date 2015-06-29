package com.go.common.util;

import java.io.IOException;
import java.io.InputStream;
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
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;
/**
 * 测试发送带附件邮件
 * @author zhangjf
 * @version 2.0
 * @create_date 2015-1-5 上午11:33:38
 */
public class JavaMail {
	 private static String host = "";  //smtp服务器
	 private static String affix = ""; //附件地址
	 private static String affixName = ""; //附件名称
	 private static String user = "";  //用户名
	 private static String pwd = "";   //密码
	 private static Properties p;
	 static{
		 InputStream in=JavaMail.class.getClassLoader().getResourceAsStream("mail.properties");
			p=new Properties();
			try {
				p.load(in);
			} catch (IOException e) {
				e.printStackTrace();
			}
	 }
	 
	 /**
	  * 设置附件信息
	  * @author zhangjf
	  * @version 2.0
	  * @create_date 2015-1-5 上午11:36:10
	  * @param affix 附件地址
	  * @param affixName 附件名称
	  */
	 public static void setAffix(String affix1,String affixName1){
		 affix=affix1;
		 affixName=affixName1;
	 }
	 /**
	  * 
	  * @param to 收件地址
	  * @param subject标题
	  * @param text 内容
	  */
	 public static void sendMail(String to,String subject,String text){
		 host=p.getProperty("mail.host");
		 user=p.getProperty("mail.userName");
		 pwd=p.getProperty("mail.password");
		 Properties props = new Properties();
		  Transport transport =null;
		//设置发送邮件的邮件服务器的属性（这里使用网易的smtp服务器）
		 props.put("mail.smtp.host", host);
		//需要经过授权，也就是有户名和密码的校验，这样才能通过验证（一定要有这一条）
		 props.put("mail.smtp.auth", "true");
		//用刚刚设置好的props对象构建一个session
		 Session session = Session.getDefaultInstance(props);
		//有了这句便可以在发送邮件的过程中在console处显示过程信息，供调试使
		//用（你可以在控制台（console)上看到发送邮件的过程）
		 session.setDebug(true);
		//用session为参数定义消息对象
		 MimeMessage message=new MimeMessage(session);
		 try {
			 //加载发件人地址
	         message.setFrom(new InternetAddress(user));
	         //加载收件人地址
	         message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
	         //加载标题
	         message.setSubject(subject);
	       // 向multipart对象中添加邮件的各个部分内容，包括文本内容和附件
	       Multipart multipart = new MimeMultipart(); 
           //   设置邮件的文本内容
           BodyPart contentPart = new MimeBodyPart();
           contentPart.setText(text);
           multipart.addBodyPart(contentPart); 
           //添加附件
           BodyPart messageBodyPart= new MimeBodyPart();
           DataSource source = new FileDataSource(affix); 
           //添加附件的内容
           messageBodyPart.setDataHandler(new DataHandler(source)); 
         //添加附件的标题
         //设置附件名字为中文时的编码，解决乱码问题
          messageBodyPart.setFileName(MimeUtility.encodeText(affixName));
           multipart.addBodyPart(messageBodyPart); 
           //将multipart对象放到message中
           message.setContent(multipart);
         //保存邮件
           message.saveChanges();
           //   发送邮件
           transport = session.getTransport("smtp");
           //连接服务器的邮箱
           transport.connect(host, user, pwd);
           //把邮件发送出去
           transport.sendMessage(message, message.getAllRecipients());
		} catch (Exception e) {
			// TODO: handle exception
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
	 
	 public static void main(String[] args) {
		JavaMail mail=new JavaMail();
		InputStream in=JavaMail.class.getClassLoader().getResourceAsStream("mail.properties");
		Properties p=new Properties();
		try {
			p.load(in);
			//设置要发送附件的位置和标题
			mail.setAffix("D:/2013-02.jpg", "二维码.png");
			mail.sendMail("641484739@qq.com", "携带附件邮件","123123");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
