package com.go.controller.sign;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		  return  "attendance/sign/list";
	  }
}
