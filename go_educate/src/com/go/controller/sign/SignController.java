package com.go.controller.sign;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.go.controller.base.BaseController;
import com.go.po.common.PageBean;
import com.go.service.sign.SignService;

/**
 * 签到控制器
 * @author linyb
 * @date 2015-6-4下午9:48:07
 */
@Controller
@RequestMapping(value="/sign/*")
public class SignController extends BaseController{
	
	 @Resource
	 private  SignService signService;
	  /**
	   * 查询列表
	   * @param request
	   * @param response
	   */
	  @SuppressWarnings("unchecked")
	  @RequestMapping("findList.do")
	  public  String  findList(HttpServletRequest request, HttpServletResponse response,Model  model,RedirectAttributes attr){
		  Map<String,Object> parameter = sqlUtil.queryParameter(request);
		  
		  Map<String,Object>  resMap = (Map<String, Object>) request.getSession().getAttribute("user");
		  if(resMap==null||resMap.size()<1){
			  return "redirect:../common/loginPage.do";
		  }
		  if("1".equals(resMap.get("TYPE").toString())){ //老师
			  parameter.put("LSUSERID", resMap.get("ID").toString());
		  }
		  if("2".equals(resMap.get("TYPE").toString())){//学生
			  parameter.put("XSUSERID", resMap.get("ID").toString());
		  }
		  PageBean<Map<String,Object>> pb = this.signService.findList(parameter);
		  model.addAttribute("pageBean", pb);
		  model.addAttribute("parameter", parameter);
		  model.addAttribute("today", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		  model.addAttribute("time", new SimpleDateFormat("HH:mm").format(new Date()));
		  return  "attendance/sign/list";
	  }
	  /**
	   * 签到
	   * @author linyb
	   * @date  2015-6-17下午9:34:18
	   * @param request
	   * @param response
	   * @param id
	   * @return
	 * @throws ParseException 
	   */
	  @RequestMapping(value="doSign.do")
	  public String doSign(HttpServletRequest request,HttpServletResponse response) throws ParseException{
		  Map<String,Object> parameter = sqlUtil.queryParameter(request);
		  Map<String,Object> result = signService.load(parameter);
		  if(result==null){
			  this.ajaxMessage(response, "msg", "找不到对应的签到记录！");
		  }else{
			  String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			  
			  String date = result.get("DATE").toString();
			  if(StringUtils.isNotBlank(date) && today.equals(date)){
				  SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				  Date classTime = format.parse(today+" "+result.get("STARTTIME")+":00");
				  
				  long diff = classTime.getTime() - new Date().getTime(); //上课时间跟当前时间的毫秒差
				  if(diff<0){
					 long min =  Math.abs(diff) /(1000 * 60);
					 if(min>15){ //忘记签到了 状态4
						 parameter.put("sign", "4");
						 signService.updateSign(parameter);
					 }else{//迟到 状态2
						 parameter.put("sign", "2");
						 signService.updateSign(parameter);
					 }
				  }else{
					  long min = diff / (1000 *60);
					  if(min<=25 && min >2){ //准时签到  状态1
						  parameter.put("sign", "1");
						 signService.updateSign(parameter);
					  }else if(min <=2 && min >=0){//警告 状态3
						  parameter.put("sign", "3");
						 signService.updateSign(parameter);
					
					  }else{ //还没到签到时间
						  this.ajaxMessage(response, "msg", "当前课程没到签到时间！");
					  }
				  }
				 this.ajaxMessage(response, "msg", "200");
			  }else{
				  this.ajaxMessage(response, "msg", "只能对当天要上的课进行签到！");
			  }
		  }
		  return null;
	  }
}
