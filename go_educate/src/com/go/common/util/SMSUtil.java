package com.go.common.util;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.junit.Test;

/**
 * 发送短信工具类
 * @author linyb
 * @date 2015-6-27下午1:54:24
 */
public class SMSUtil {
	
	public static String sendSms(String context,String mobile) throws Exception{
		HttpClient client = new HttpClient();
		PostMethod post = new PostMethod("http://gbk.sms.webchinese.cn");
		post.addRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=gbk");//在头文件中设置转码
		NameValuePair[] data ={ 
				new NameValuePair("Uid", "bojunisme"),
				new NameValuePair("Key", "d74c75610b8a7b0a63b1"),
				new NameValuePair("smsMob",mobile),
				new NameValuePair("smsText",context)};
		post.setRequestBody(data);

		client.executeMethod(post);
		//Header[] headers = post.getResponseHeaders();
		/*int statusCode = */post.getStatusCode();
		/*System.out.println("statusCode:"+statusCode);
		for(Header h : headers){
			System.out.println(h.toString());
		}*/
		String result = new String(post.getResponseBodyAsString().getBytes("gbk"));
		post.releaseConnection();
		System.out.println(result);
		return result; //1代码发送成功
	}
	/**
	 * 短信发送测试类
	 * @author linyb
	 * @date  2015-6-27下午3:11:28
	 * @throws Exception
	 */
	@Test
	public void sendSms() throws Exception{
		HttpClient client = new HttpClient();
		PostMethod post = new PostMethod("http://gbk.sms.webchinese.cn");
		post.addRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=gbk");//在头文件中设置转码
		NameValuePair[] data ={ 
				new NameValuePair("Uid", "bojunisme"),
				new NameValuePair("Key", "d74c75610b8a7b0a63b1"),
				new NameValuePair("smsMob","15901808610"),
				new NameValuePair("smsText","测试发送")};
		post.setRequestBody(data);

		client.executeMethod(post);
		Header[] headers = post.getResponseHeaders();
		int statusCode = post.getStatusCode();
		System.out.println("statusCode:"+statusCode);
		for(Header h : headers){
			System.out.println(h.toString());
		}
		String result = new String(post.getResponseBodyAsString().getBytes("gbk"));
		System.out.println(result);
		post.releaseConnection();
		 //1代码发送成功
	}
}
