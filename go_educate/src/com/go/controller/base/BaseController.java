package com.go.controller.base;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.alibaba.fastjson.JSONObject;
import com.go.common.component.SqlComponent;
import com.go.common.util.ContextUtil;
import com.go.common.util.LogUtil;


/**
 * 功能：
 * 控制器基类
 * @author Administrator
 *
 */
@Controller
public class BaseController extends MultiActionController {
	@Resource
	protected  SqlComponent  sqlUtil;
	/**
	 * 返回AJAX
	 * @param response
	 * @param status  返回标志1:成功,2:业务信息,3:其他返回信息,4:错误
	 * @param message
	 * @throws IOException
	 */
	public void  ajaxMessage(HttpServletResponse response,String status,Object message){
		JSONObject  jsonobj = new JSONObject();
		jsonobj.put(status, message);
		PrintWriter out = null;
		try{
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
	        out = response.getWriter();
		    out.print(jsonobj.toJSONString());
		}catch(IOException e){
			e.printStackTrace();
			LogUtil.error(this.getClass(), e.getMessage());
		}finally{
		   if(out!=null){
			  out.flush();
			  out.close();
		   }
		}
	}
	
	/**
	 * 返回AJAX
	 * @param response
	 * @param status  返回标志1:成功,2:业务信息,3:其他返回信息,4:错误
	 * @param message
	 * @throws IOException
	 */
	public void  ajaxData(HttpServletResponse response,String jsonstr){
		PrintWriter out = null;
		try{
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
	        out = response.getWriter();
		    out.print(jsonstr);
		}catch(IOException e){
			e.printStackTrace();
			LogUtil.error(this.getClass(),e, e.fillInStackTrace());
		}finally{
		   if(out!=null){
			  out.flush();
			  out.close();
		   }
		}
	}
	
	/**
	 * 返回图像
	 * @param response
	 * @param image
	 * @param imgtype
	 */
	public  void responseImage(HttpServletResponse response,byte[] image,String imgtype){
		response.reset();
		// 设置页面不缓 ?
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("image/x-"+imgtype);
		response.setCharacterEncoding("UTF-8");
		ServletOutputStream outputStream = null;
		try {
			outputStream = response.getOutputStream();
			outputStream.write(image);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			LogUtil.error(ContextUtil.class, "Response生成图像错误:"+e.getMessage());
			e.printStackTrace();
		}finally{
			try {
				if(outputStream!=null){
					outputStream.flush();
					outputStream.close();
				}
			} catch (IOException e) {
				LogUtil.error(ContextUtil.class, "关闭输出流错误:"+e.getMessage());
				e.printStackTrace();
			}
		}
	}
}
