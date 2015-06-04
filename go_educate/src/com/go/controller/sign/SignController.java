package com.go.controller.sign;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.go.controller.base.BaseController;
import com.go.po.common.PageBean;
import com.go.service.platform.BuserService;
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
	 
	  @RequestMapping("findList.do")
	  public  String  findList(HttpServletRequest request, HttpServletResponse response,Model  model){
		  Map<String,Object> parameter = sqlUtil.queryParameter(request);
		  PageBean<Map<String,Object>> pb = this.signService.findList(parameter);
		  model.addAttribute("pageBean", pb);
		  model.addAttribute("parameter", parameter);
		  return  "platform/buser/list";
	  }
}
