package com.go.controller.attendance;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.go.common.util.JSONUtil;
import com.go.common.util.SqlUtil;
import com.go.common.util.SysUtil;
import com.go.controller.base.BaseController;
import com.go.po.common.PageBean;
import com.go.po.common.Syscontants;
import com.go.service.attendance.LessonService;
import com.go.service.attendance.TeachertimeService;
/**
 * 课时管理
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/time")
public class TeachertimeControl extends BaseController {
	  @Resource
	  private  TeachertimeService  teachertimeService;
	  @Resource
	  private  LessonService  lessonService;
	  /**
	   * 添加数据页面
	   * @return
	   */
	  @RequestMapping("add.do")
	  public  String add(HttpServletRequest request,HttpServletResponse response,Model  model){
		  Map<String,Object> parameter=new HashMap<String,Object>();
		  List<Map<String,Object>> list=lessonService.findAll(parameter);
		  model.addAttribute("lessonList", list);
		  return  "attendance/time/edit";
	  }  
	  /**
	   * 导出数据
	   * @param request
	   * @param response
	   * @return
	   */
	  @RequestMapping("load.do")
	  public  String load(HttpServletRequest request, HttpServletResponse response,Model  model){
		  Map<String,Object>  parameter = sqlUtil.setParameterInfo(request);
		  Map<String,Object>  res = this.teachertimeService.load(parameter);
		  model.addAttribute("vo", res);
		  
		  List<Map<String,Object>> list=this.teachertimeService.findTL(parameter);
		  model.addAttribute("timelesson", JSONUtil.listToArray(list));
		  return "forward:add.do";
	  }
	  /**
	   * 保存后台的菜单
	   * @param request
	   * @param response
	 * @throws Exception 
	   */
	  @RequestMapping("save1.do")
	  public  void save1(HttpServletRequest request, HttpServletResponse response,String[] TIME) throws Exception{
		  Map<String,Object> user=SysUtil.getSessionUsr(request, "user");//当前用户
		  if(!"1".equals(user.get("TYPE"))){
			  this.ajaxMessage(response, Syscontants.MESSAGE,"操作失败，这能老师自己操作。");
			  return;
		  }
		  //获取请求参数
		  Map<String,Object> parameter = sqlUtil.setParameterInfo(request);
		  boolean  isIDNull = sqlUtil.isIDNull(parameter,"ID");
		  String id="";
		  if(isIDNull){
			  id=SqlUtil.uuid();
		  }else{
			  id=parameter.get("ID").toString();
		  }
		  List<Map<String,Object>> timeList=new ArrayList<Map<String, Object>>();
		  SimpleDateFormat sdf=new SimpleDateFormat("HH:mm");
		  for(String str:TIME){
			  Map<String, Object> time=new HashMap<String,Object>();
			  String[] arr=str.split("-");
			  long stime=sdf.parse(arr[0]).getTime();
			  long etime=sdf.parse(arr[1]).getTime();
			  for(Map<String,Object> t:timeList){
				  Long starttime=Long.parseLong(t.get("starttime").toString());
				  Long endtime=Long.parseLong(t.get("endtime").toString());
				  if((stime<starttime && etime>starttime) ||  (stime>starttime && stime<endtime)){
					  this.ajaxMessage(response, Syscontants.ERROE,"操作失败，时间段冲突。");
					  return;
				  }
			  }
			  time.put("STARTTIME", arr[0]);
			  time.put("ENDTIME", arr[1]);
			  time.put("starttime", stime);
			  time.put("endtime", etime);
			  time.put("TIMEID",id);
			  time = sqlUtil.setTableID(time);
			  timeList.add(time);
		  }
		  Object userid=user.get("ID");
		  parameter.put("USERID", userid);
		  Map<String,Object> m=new HashMap<String, Object>();
		  m.put("USERID", userid);
		  Object date=parameter.get("DATE");
		  m.put("DATE", date);
		 
		 
		  if(isIDNull){
			  //设置ID
			  List<Map<String,Object>> l=teachertimeService.findAll(m);
			  if(l!=null && l.size()>0){
				  this.ajaxMessage(response, Syscontants.MESSAGE,"操作失败，"+date+"已经安排了。");
				  return;
			  }
			  Map<String,Object> n_parameter = sqlUtil.setTableID(parameter);
			  parameter.put("ID", n_parameter.get("id"));
			  //添加菜单
			  this.teachertimeService.add(n_parameter);
			  this.ajaxMessage(response, Syscontants.MESSAGE,"添加成功");
		  }else{
			  m.put("BID", parameter.get("ID"));
			  List<Map<String,Object>> l=teachertimeService.findAll(m);
			  if(l!=null && l.size()>0){
				  this.ajaxMessage(response, Syscontants.MESSAGE,"操作失败，"+date+"已经安排了。");
				  return;
			  }
			  this.teachertimeService.update(parameter);
			  this.ajaxMessage(response, Syscontants.MESSAGE,"修改成功");
		  }
		  
		  List<String> ll=new ArrayList<String>();
		  ll.add(parameter.get("ID").toString());
		  teachertimeService.deleteTL(ll);//删除之前连接表数据
		  List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
//		  for(String str:LESSONID){
//			  Map<String,Object> map=new HashMap<String,Object>();
//			  map = sqlUtil.setTableID(map);
//			  map.put("TIMEID", parameter.get("ID"));
//			  map.put("LESSONID", str);
//			  list.add(map);
//		  }
		  teachertimeService.addTL(list);//添加新连接表数据
	  }
	  @RequestMapping("save.do")
	  public  void save(HttpServletRequest request, HttpServletResponse response,String[] LESSONID) throws Exception{
		  Map<String,Object> user=SysUtil.getSessionUsr(request, "user");//当前用户
		  if(!"1".equals(user.get("TYPE"))){
			  this.ajaxMessage(response, Syscontants.MESSAGE,"操作失败，这能老师自己操作。");
			  return;
		  }
		  //获取请求参数
		  Map<String,Object> parameter = sqlUtil.setParameterInfo(request);
		  Object userid=user.get("ID");
		  parameter.put("USERID", userid);
		  Map<String,Object> m=new HashMap<String, Object>();
		  m.put("USERID", userid);
		  Object date=parameter.get("DATE");
		  m.put("DATE", date);
		 
		  boolean  isIDNull = sqlUtil.isIDNull(parameter,"ID");
		  if(isIDNull){
			  //设置ID
			  List<Map<String,Object>> l=teachertimeService.findAll(m);
			  if(l!=null && l.size()>0){
				  this.ajaxMessage(response, Syscontants.MESSAGE,"操作失败，"+date+"已经安排了。");
				  return;
			  }
			  Map<String,Object> n_parameter = sqlUtil.setTableID(parameter);
			  parameter.put("ID", n_parameter.get("id"));
			  //添加菜单
			  this.teachertimeService.add(n_parameter);
			  this.ajaxMessage(response, Syscontants.MESSAGE,"添加成功");
		  }else{
			  m.put("BID", parameter.get("ID"));
			  List<Map<String,Object>> l=teachertimeService.findAll(m);
			  if(l!=null && l.size()>0){
				  this.ajaxMessage(response, Syscontants.MESSAGE,"操作失败，"+date+"已经安排了。");
				  return;
			  }
			  this.teachertimeService.update(parameter);
			  this.ajaxMessage(response, Syscontants.MESSAGE,"修改成功");
		  }
		  
		  List<String> ll=new ArrayList<String>();
		  ll.add(parameter.get("ID").toString());
		  teachertimeService.deleteTL(ll);//删除之前连接表数据
		  List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
		  for(String str:LESSONID){
			  Map<String,Object> map=new HashMap<String,Object>();
			  map = sqlUtil.setTableID(map);
			  map.put("TIMEID", parameter.get("ID"));
			  map.put("LESSONID", str);
			  list.add(map);
		  }
		  teachertimeService.addTL(list);//添加新连接表数据
	  }
	  /**
	   * 查询列表
	   * @param request
	   * @param response
	   */
	  @RequestMapping("findList.do")
	  public  String  findList(HttpServletRequest request, HttpServletResponse response,Model  model){
		  Map<String,Object> parameter = sqlUtil.queryParameter(request);
		  Map<String,Object> user=SysUtil.getSessionUsr(request, "user");
		  if("1".equals(user.get("TYPE"))){
			  parameter.put("USERID", user.get("ID"));
		  }
		  PageBean<Map<String,Object>> pb = this.teachertimeService.findList(parameter);
		  model.addAttribute("pageBean", pb);
		  model.addAttribute("parameter", parameter);
		  return  "attendance/time/list";
	  }
	  /**
	   * 删除数据
	   * @param request
	   * @param response
	   */
	  @RequestMapping("delete.do")
	  public  void  delete(HttpServletRequest request, HttpServletResponse response){
		  List<String> parameter = sqlUtil.getIdsParameter(request);
		  this.teachertimeService.delete(parameter);
		  this.ajaxMessage(response, Syscontants.MESSAGE, "删除成功");
	  }
}
