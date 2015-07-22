package com.go.controller.attendance;

import java.util.ArrayList;
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
import com.go.service.attendance.LessonService;
import com.go.service.platform.CurriculumService;
/**
 * 选课控制类
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/elective")
public class ElectiveControl extends BaseController {
	  @Resource
	  private  ElectiveService  electiveService;
	  @Resource
	  private  LessonService  lessonService;
	  /**
	   * 添加数据页面
	   * @return
	   */
	  @RequestMapping("add1.do")
	  public  String add1(HttpServletRequest request,HttpServletResponse response,Model  model){
		  Map<String,Object>  parameter = sqlUtil.setParameterInfo(request);
		  parameter.put("today", ExtendDate.getYMD(new Date()));
		  List<Map<String,Object>> list=electiveService.findOptionalLesson(parameter);
		  model.addAttribute("timeList", list);
		  model.addAttribute("parameter", parameter);
		  return  "attendance/elective/edit";
	  }  
	  @RequestMapping("add.do")
	  public  String add(HttpServletRequest request,HttpServletResponse response,Model  model){
		  long l=System.currentTimeMillis();
		  Map<String,Object>  parameter = sqlUtil.setParameterInfo(request);
		  parameter.put("today", ExtendDate.getYMD(new Date()));
		  Map<Object,List<Map<String,Object>>> list=electiveService.findOptionalLesson11(parameter);
		  model.addAttribute("timeList", list);
		  model.addAttribute("parameter", parameter);
		  System.out.println(System.currentTimeMillis()-l);
		  return  "attendance/elective/edit1";
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
		  Map<String,Object>  res = this.electiveService.load(parameter);
		  model.addAttribute("vo", res);
		  
		  List<Map<String,Object>> list=this.electiveService.findElectiveLesson(parameter);
		  model.addAttribute("electiveLesson", JSONUtil.listToArray(list));
		  return "forward:add.do";
	  }
	  /**
	   * 保存后台的菜单
	   * @param request
	   * @param response
	 * @throws Exception 
	   */
	  @RequestMapping("save.do")
	  public  void save(HttpServletRequest request, HttpServletResponse response,String[] LESSONID) throws Exception{
		  Map<String,Object> user=SysUtil.getSessionUsr(request, "user");//当前用户
		  if(!"2".equals(user.get("TYPE"))){//为不学生
			  this.ajaxMessage(response, Syscontants.ERROE,"添加失败，只能学生操作。");
			  return;
		  }
		  //获取请求参数
		  Map<String,Object> parameter = sqlUtil.setParameterInfo(request);
		  boolean  isIDNull = sqlUtil.isIDNull(parameter,"ID");
		  String electiveid="";
		  Map<String,Object> elective=new HashMap<String,Object>();
		  elective.put("USERID", user.get("ID"));//学生ID
		  elective.put("CURRICULUMID", parameter.get("CURRICULUMID"));
		  elective.put("CREATEDATE", ExtendDate.getYMD_h_m_s(new Date()));
		  elective.put("STATUS","0");
		  if(isIDNull){
			  electiveid=SqlUtil.uuid();
			  elective.put("id", electiveid);
		  }else{
			  electiveid=parameter.get("ID").toString();
			  elective.put("ID", electiveid);
		  }
		  electiveService.deleteElectiveLesson(electiveid);//删除旧选课课时表
		  List<Map<String,Object>> electiveLessonList=new ArrayList<Map<String,Object>>();
		  for(String str:LESSONID){
			  String[] arr=str.split("-");
			  Map<String,Object> electiveLesson=new HashMap<String,Object>();//选课课时表
			  electiveLesson.put("ELECTIVEID", electiveid);
			  electiveLesson.put("LESSONID", arr[1]);
			  electiveLesson.put("TIMEID", arr[0]);
			  electiveLesson.put("id", SqlUtil.uuid());
			  electiveLessonList.add(electiveLesson);
		  }
		  List<Map<String,Object>> list=electiveService.checkElectiveLesson(electiveLessonList);
		  if(list!=null && list.size()>0){
			  String res="已被选择的日期：</br>";
			  for(Map<String,Object> vo:list){
				  res+=vo.get("DATE").toString()+" "+vo.get("LSUSERNAME")+" "+vo.get("STARTTIME")+"~"+vo.get("ENDTIME")+"</br>";
			  }
			  this.ajaxMessage(response, Syscontants.ERROE,res);
			  return;
		  }
		  electiveService.addElectiveLesson(electiveLessonList);
		  if(isIDNull){
			  electiveService.add(elective);//添加选课
			  this.ajaxMessage(response, Syscontants.MESSAGE,"添加成功");
		  }else{
			  electiveService.update(elective);//添加选课
			  this.ajaxMessage(response, Syscontants.MESSAGE,"修改成功");
		  }
		  
	  }
	  /**
	   * 查询课程列表
	   * @param request
	   * @param response
	   */
	  @RequestMapping("findList.do")
	  public  String  findList(HttpServletRequest request, HttpServletResponse response,Model  model){
		  Map<String,Object> parameter = sqlUtil.queryParameter(request);
		  Map<String,Object> user=SysUtil.getSessionUsr(request, "user");//当前用户
		  parameter.put("USERID", user.get("ID"));
		  parameter.put("STATUS", 0);
		  PageBean<Map<String,Object>> pb = electiveService.findList(parameter);
		  model.addAttribute("pageBean", pb);
		  model.addAttribute("parameter", parameter);
		  return  "attendance/elective/list";
	  }
	  /**
	   * 删除数据
	   * @param request
	   * @param response
	   */
	  @RequestMapping("delete.do")
	  public  void  delete(HttpServletRequest request, HttpServletResponse response){
		  List<String> parameter = sqlUtil.getIdsParameter(request);
		  this.electiveService.delete(parameter);
		  this.ajaxMessage(response, Syscontants.MESSAGE, "删除成功");
	  }
	  /**
	   * 生成课表
	   * @param request
	   * @param response
	 * @throws Exception 
	   */
	  @RequestMapping("generateTimetable.do")
	  public  void  generateTimetable(HttpServletRequest request, HttpServletResponse response) throws Exception{
		  Map<String,Object> user=SysUtil.getSessionUsr(request, "user");//当前用户
		  if(!"2".equals(user.get("TYPE"))){//为不学生
			  this.ajaxMessage(response, Syscontants.ERROE,"添加失败，只能学生操作。");
			  return;
		  }
		  Map<String,Object> parameter = sqlUtil.queryParameter(request);
//		  parameter=sqlUtil.setTableID(parameter);
		  Object id=SqlUtil.uuid();
		  parameter.put("id", id);
		  parameter.put("USERID", user.get("ID"));
		  parameter.put("CREATEDATE",ExtendDate.getYMD_h_m_s(new Date()));
		  this.ajaxMessage(response, Syscontants.MESSAGE, electiveService.generateTimetable(parameter));
		  
		  Map<String,Object> n_parameter=new HashMap<String,Object>();
		  n_parameter.put("SEMESTERID", id);
		  electiveService.generateClass(n_parameter);
	  }
}
