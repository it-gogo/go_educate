package com.go.controller.attendance;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.go.common.util.SysUtil;
import com.go.controller.base.BaseController;
import com.go.po.common.PageBean;
import com.go.po.common.Syscontants;
import com.go.service.attendance.ClassService;
import com.go.service.attendance.FeedBackService;
/**
 * 反馈
 * @author linyb
 * @date 2015-6-26下午10:14:58
 */
@Controller
@RequestMapping("/feedback")
public class FeedBackControl extends BaseController {
	  @Resource
	  private  FeedBackService  feedBackService;
	  @Resource
	  private  ClassService classService;
	  
	 /**
	   * 查询列表
	   * @param request
	   * @param response
	   */
	  @RequestMapping("list.do")
	  public  String  findList(HttpServletRequest request, HttpServletResponse response,Model  model){
		  Map<String,Object> parameter = sqlUtil.queryParameter(request);
		  
		  Map<String,Object>  resMap = (Map<String, Object>) request.getSession().getAttribute("user");
		  if(resMap==null||resMap.size()<1){
			  return "redirect:../common/loginPage.do";
		  }
		  if("1".equals(resMap.get("TYPE").toString())){ //老师
			  parameter.put("LSUSERID", resMap.get("ID").toString());
		  }
		  PageBean<Map<String,Object>> pb = this.feedBackService.findList(parameter);
		  model.addAttribute("pageBean", pb);
		  model.addAttribute("parameter", parameter);
		  model.addAttribute("roleType", resMap.get("TYPE").toString());
		  return  "attendance/feedback/list";
	  }
	  
	 /**
	   * 添加数据页面
	   * @return
	   */
	  @RequestMapping("add.do")
	  public  String add(HttpServletRequest request,HttpServletResponse response,Model model){
		  //获取请求参数
		  Map<String,Object> parameter = sqlUtil.setParameterInfo(request);
		  if(parameter.get("fbid")==null ){
			  //增加
		  }else{
			  //修改
			  Map<String,Object>  res = this.feedBackService.load(parameter);
			  model.addAttribute("vo", res);
			  
		  }
		  model.addAttribute("classId", parameter.get("classId"));
		  return  "attendance/feedback/edit";
	  }  
	  /**
	   * 保存
	   * @author linyb
	   * @date  2015-6-26下午11:11:48
	   * @param request
	   * @param response
	   * @throws Exception
	   */
	  @RequestMapping("save.do")
	  public  String save(HttpServletRequest request, HttpServletResponse response) throws Exception{
		  //获取请求参数
		  Map<String,Object> parameter = sqlUtil.setParameterInfo(request);
		  boolean  isIDNull = sqlUtil.isIDNull(parameter,"ID");
		  if(isIDNull){
			  //设置ID
			  Map<String,Object> n_parameter = sqlUtil.setTableID(parameter);
			  parameter.put("ID", n_parameter.get("id"));
			  //添加
			  this.feedBackService.add(n_parameter);
			  //class里面 feedbackid加上
			  Map<String,Object> params = new HashMap<String, Object>();
			  params.put("FEEDBACKID", parameter.get("ID"));
			  params.put("ID", parameter.get("CLASSID"));
			  classService.setFeedBackId(params);
		  }else{
			  this.feedBackService.update(parameter);
		  }
		 return "redirect:../feedback/list.do";
		  
	  }
	 
	   /* 导出数据
	   * @param request
	   * @param response
	   * @return
	   */
	  @RequestMapping("load.do")
	  public  String load(HttpServletRequest request, HttpServletResponse response,Model  model){
		  Map<String,Object>  parameter = sqlUtil.setParameterInfo(request);
		  Map<String,Object>  res = this.feedBackService.load(parameter);
		  model.addAttribute("vo", res);
		  return  "attendance/feedback/detail";
	  }
	    /* **//**
	  *//**
	   * 保存后台的菜单
	   * @param request
	   * @param response
	 * @throws Exception 
	   *//*
	 
	  *
	  *//**
	   * 删除数据
	   * @param request
	   * @param response
	   *//*
	  @RequestMapping("delete.do")
	  public  void  delete(HttpServletRequest request, HttpServletResponse response){
		  List<String> parameter = sqlUtil.getIdsParameter(request);
		  this.classService.delete(parameter);
		  this.ajaxMessage(response, Syscontants.MESSAGE, "删除成功");
	  }*/
}
