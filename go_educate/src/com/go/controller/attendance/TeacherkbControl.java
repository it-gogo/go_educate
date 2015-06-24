package com.go.controller.attendance;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.go.common.util.ExtendDate;
import com.go.common.util.JSONUtil;
import com.go.common.util.SqlUtil;
import com.go.common.util.SysUtil;
import com.go.controller.base.BaseController;
import com.go.po.common.PageBean;
import com.go.po.common.Syscontants;
import com.go.service.attendance.ElectiveService;
import com.go.service.attendance.SemesterService;
import com.go.service.attendance.TeacherkbService;
/**
 * 老师课表控制类
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/teacherkb")
public class TeacherkbControl extends BaseController {
	  @Resource
	  private  SemesterService  semesterService;
	  @Resource
	  private  ElectiveService  electiveService;
	  @Resource
	  private  TeacherkbService  teacherkbService;
	  /**
	   * 导出数据
	   * @param request
	   * @param response
	   * @return
	   */
	  @RequestMapping("load.do")
	  public  String load(HttpServletRequest request, HttpServletResponse response,Model  model){
		  Map<String,Object>  parameter = sqlUtil.setParameterInfo(request);
		  Map<String,Object>  res=new HashMap<String,Object>();
		  res.put("ELECTIVEID", parameter.get("ELECTIVEID"));
		  model.addAttribute("vo", this.electiveService.load(parameter));//选课
		  
		  List<Map<String,Object>> list=this.electiveService.findElectiveLesson(res);//选课关联表
		  model.addAttribute("electiveLesson", JSONUtil.listToArray(list));
		  
		  res=new HashMap<String,Object>();
		  res.put("today", ExtendDate.getYMD(new Date()));
		  res.put("ID", parameter.get("CURRICULUMID"));//课程ID
		  res.put("ELECTIVEID", parameter.get("ELECTIVEID"));//选课ID
		   list=electiveService.findOptionalLesson(res);
		  model.addAttribute("timeList", list);
		  
		  model.addAttribute("parameter", parameter);
		  return  "attendance/teacherkb/edit";
	  }
	  /**
	   * 查询课程列表
	   * @param request
	   * @param response
	   */
	  @RequestMapping("findList.do")
	  public  String  findList(HttpServletRequest request, HttpServletResponse response,Model  model){
		  Map<String,Object> parameter = sqlUtil.queryParameter(request);
		  if(!parameter.containsKey("STARTDATE")){
			  Calendar   cal_1=Calendar.getInstance();//获取当前日期 
			  cal_1.add(Calendar.MONTH, 0);
			  cal_1.set(Calendar.DAY_OF_MONTH,1);//设置为1号,当前日期既为本月第一天 
			  parameter.put("STARTDATE", ExtendDate.getYMD(cal_1));
		  }
		  if(!parameter.containsKey("ENDDATE")){
			Calendar   cal_1= Calendar.getInstance();    
			cal_1.set(Calendar.DAY_OF_MONTH, cal_1.getActualMaximum(Calendar.DAY_OF_MONTH));  
			parameter.put("ENDDATE", ExtendDate.getYMD(cal_1));
		  }
		  parameter.put("TYPESTR", "1");
		  Map<String,Object> user=SysUtil.getSessionUsr(request, "user");//当前用户
		  Object userid=user.get("ID");
		  if("1".equals(user.get("TYPE"))){//老师
			  parameter.put("USERID", userid);
			  Map<String,Object> map=teacherkbService.findKB(parameter);
			  model.addAttribute("map", map);
			  model.addAttribute("parameter", parameter);
			  return  "attendance/teacherkb/look";
		  }else if("2".equals(user.get("TYPE"))){//学生
//			  parameter.put("USERID", userid);
			  return  "attendance/teacherkb/list";
		  }else if("3".equals(user.get("TYPE"))){//管理员
		  }
		  PageBean<Map<String,Object>> pb = teacherkbService.findList(parameter);
		  model.addAttribute("pageBean", pb);
		  model.addAttribute("parameter", parameter);
		  return  "attendance/teacherkb/list";
	  }
	  
	  @RequestMapping("lookTimetable.do")
	  public String lookTimetable(HttpServletRequest request, HttpServletResponse response,Model  model){
		  Map<String,Object> parameter = sqlUtil.queryParameter(request);
		  if(!parameter.containsKey("STARTDATE")){
			  Calendar   cal_1=Calendar.getInstance();//获取当前日期 
			  cal_1.add(Calendar.MONTH, 0);
			  cal_1.set(Calendar.DAY_OF_MONTH,1);//设置为1号,当前日期既为本月第一天 
			  parameter.put("STARTDATE", ExtendDate.getYMD(cal_1));
		  }
		  if(!parameter.containsKey("ENDDATE")){
			Calendar   cal_1= Calendar.getInstance();    
			cal_1.set(Calendar.DAY_OF_MONTH, cal_1.getActualMaximum(Calendar.DAY_OF_MONTH));  
			parameter.put("ENDDATE", ExtendDate.getYMD(cal_1));
		  }
		  Map<String,Object> map=teacherkbService.findKB(parameter);
		  model.addAttribute("map", map);
		  model.addAttribute("pageBean", map.get("pb"));
		  model.addAttribute("parameter", parameter);
		  return  "attendance/teacherkb/look";
	  }
}
