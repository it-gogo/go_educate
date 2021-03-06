package com.go.controller.attendance;

import java.text.SimpleDateFormat;
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
import com.go.common.util.SqlUtil;
import com.go.common.util.SysUtil;
import com.go.controller.base.BaseController;
import com.go.po.common.PageBean;
import com.go.po.common.Syscontants;
import com.go.service.attendance.ClassService;
import com.go.service.attendance.SemesterService;
import com.go.service.platform.BuserService;
import com.go.service.platform.CurriculumService;

@Controller
@RequestMapping("/myStudent")
public class MyStudentControl extends BaseController {
	  @Resource
	  private  BuserService  buserService;
	  @Resource
	  private  SemesterService  semesterService;
	  @Resource
	  private  ClassService  classService;
	  @Resource
	  private  CurriculumService  curriculumService;
	  /**
	   * 调课
	   * @param request
	   * @param response
	   * @return
	   */
	  @RequestMapping("transfer.do")
	  public  String transfer(HttpServletRequest request, HttpServletResponse response,Model  model){
		  Map<String,Object>  parameter = sqlUtil.setParameterInfo(request);
		  parameter.put("ID", parameter.get("CLASSID"));
		  Map<String,Object>  res = this.classService.load(parameter);
		  model.addAttribute("vo", res);
		  
		  List<Map<String,Object>> list=curriculumService.findAll(parameter);
		  model.addAttribute("curriculumList", list);
		  return  "attendance/myStudent/edit";
	  }
	  /**
	   * 保存后台的菜单
	   * @param request
	   * @param response
	 * @throws Exception 
	   */
	  @RequestMapping("save.do")
	  public  void save(HttpServletRequest request, HttpServletResponse response,String TIME) throws Exception{
		  //获取请求参数
		  Map<String,Object> parameter = sqlUtil.setParameterInfo(request);
		  String[] arr=TIME.split("-");
		  SimpleDateFormat sdf=new SimpleDateFormat("HH:mm");
		  String str0=arr[0];
		  String str1=arr[1];
		  long l0=sdf.parse(str0).getTime();
		  long l1=sdf.parse(str1).getTime();
		  if(l0>=l1){
			  this.ajaxMessage(response, Syscontants.ERROE,"添加失败,请选择合适时间段。");
			  return;
		  }
		  long much=(l1-l0)/(30*60*1000);
		  parameter.put("MUCHLESSON", much);
		  parameter.put("STARTTIME", str0);
		  parameter.put("ENDTIME", str1);
		  parameter.put("STATUS", 5);
		  parameter.put("CREATEDATE", ExtendDate.getYMD(new Date()));
		  List<Map<String,Object>> lessonList=classService.findTransferLesson(parameter);//调课时间的课时
		  List<Map<String,Object>> transferList=classService.findTransfer(parameter);//可以调课老师时间
		  if(transferList==null || transferList.size()==0){
			  this.ajaxMessage(response, Syscontants.ERROE,"添加失败,所选时间没有合适老师可以上课。");
			  return ;
		  }
		  Map<String,Object> res=new HashMap<String, Object>();
		  for(Map<String,Object> map:transferList){
			  map.put("list", lessonList);
			  map.put("CLASSID", parameter.get("ID"));
			  long l=classService.findIsTransfer(map);
			  if(l==0){
				  res=map;
				  break;
			  }
		  }
		  if(res==null || res.size()==0){
			  this.ajaxMessage(response, Syscontants.ERROE,"添加失败,所选时间没有合适老师可以上课。");
			  return;
		  }
		  String electiveid=classService.findTransferElective(parameter);
		  List<String> l_parameter = new ArrayList<String>();
		  l_parameter.add(parameter.get("ID").toString());
		  classService.deleteTransfer(l_parameter);
		  Map<String,Object> n_parameter=new HashMap<String, Object>();
		  for(Map<String,Object> m:lessonList){
			  String elid=SqlUtil.uuid();
			  m.put("ELECTIVEID", electiveid);
			  m.put("ELECTIVELESSONID", elid);
			  m.put("LESSONID", m.get("ID"));
			  m.put("TIMEID", res.get("ID"));
			  
			  m.put("CLASSELID", SqlUtil.uuid());
			  m.put("CLASSID", parameter.get("ID"));
			  m.put("ELID",elid);
		  }
		  classService.addTransfer(lessonList);
		  parameter.put("LSUSERID", res.get("USERID"));
		  boolean  isIDNull = sqlUtil.isIDNull(parameter,"ID");
		  if(isIDNull){
			  //设置ID
//			  Map<String,Object> n_parameter = sqlUtil.setTableID(parameter);
			  //添加菜单
//			  this.classService.add(n_parameter);
			  this.ajaxMessage(response, Syscontants.ERROE,"添加失败");
		  }else{
			  this.classService.update(parameter);
			  this.ajaxMessage(response, Syscontants.MESSAGE,"修改成功");
		  }
	  }
	  
	  
	  
	  /**
	   * 查询列表
	   * @param request
	   * @param response
	   */
	  @RequestMapping("findList.do")
	  public  String  findList(HttpServletRequest request, HttpServletResponse response,Model  model){
		  Map<String,Object> parameter = sqlUtil.queryParameter(request);
		  Map<String,Object> user=SysUtil.getSessionUsr(request, "user");//当前用户
		  Object userid=user.get("ID");
		  if("1".equals(user.get("TYPE"))){//老师
			  parameter.put("LSUSERID", userid);
		  }else if("2".equals(user.get("TYPE"))){//学生
			  parameter.put("XSUSERID", userid);
		  }else if("3".equals(user.get("TYPE"))){//管理员
		  }
		  PageBean<Map<String,Object>> pb = this.semesterService.myStudent(parameter);
		  model.addAttribute("pageBean", pb);
		  model.addAttribute("parameter", parameter);
		  return  "attendance/myStudent/list";
	  }
	  /**
	   * 课程详情
	   * @param request
	   * @param response
	   */
	  @RequestMapping("lookClass.do")
	  public  String  lookClass(HttpServletRequest request, HttpServletResponse response,Model  model){
		  Map<String,Object> parameter = sqlUtil.queryParameter(request);
		  PageBean<Map<String,Object>> pb = this.classService.findList(parameter);
		  model.addAttribute("pageBean", pb);
		  model.addAttribute("parameter", parameter);
		  model.addAttribute("pageUrl", "lookClass.do");
		  return  "attendance/myStudent/lookClass";
	  }
	  
	  @RequestMapping("lookXSInfo.do")
	  public  String  lookXSInfo(HttpServletRequest request, HttpServletResponse response,Model  model){
		  Map<String,Object>  parameter = sqlUtil.setParameterInfo(request);
		  Map<String,Object>  res = this.buserService.load(parameter);
		  model.addAttribute("vo", res);
		  return  "attendance/myStudent/lookXSInfo";
	  }
	  @RequestMapping("saveXSInfo.do")
	  public  void saveXSInfo(HttpServletRequest request, HttpServletResponse response,String TIME) throws Exception{
		  Map<String,Object>  parameter = sqlUtil.setParameterInfo(request);
		  Map<String,Object>  res = this.buserService.load(parameter);
		  res.putAll(parameter);
		  this.buserService.update(res);
		  this.ajaxMessage(response, Syscontants.MESSAGE,"修改成功");
	  }
	  
	  /**
	   * 删除数据
	   * @param request
	   * @param response
	   */
	  @RequestMapping("delete.do")
	  public  void  delete(HttpServletRequest request, HttpServletResponse response){
		  List<String> parameter = sqlUtil.getIdsParameter(request);
		 this.classService.delete(parameter);
		  this.ajaxMessage(response, Syscontants.MESSAGE, "删除成功");
	  }
}
