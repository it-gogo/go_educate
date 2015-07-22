package com.go.controller.attendance;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.go.common.util.JSONUtil;
import com.go.common.util.SysUtil;
import com.go.controller.base.BaseController;
import com.go.po.common.PageBean;
import com.go.service.attendance.ClassService;
import com.go.service.attendance.SemesterService;
import com.go.service.platform.BuserService;
import com.go.service.platform.CurriculumService;
/**
 * 我的老师控制类
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/myTeacher")
public class MyTeacherControl extends BaseController {
	  @Resource
	  private  BuserService  buserService;
	  @Resource
	  private  SemesterService  semesterService;
	  @Resource
	  private  ClassService  classService;
	  @Resource
	  private  CurriculumService  curriculumService;
	  
	  /**
	   * 导出数据
	   * @param request
	   * @param response
	   * @return
	   */
	  @RequestMapping("load.do")
	  public  String load(HttpServletRequest request, HttpServletResponse response,Model  model){
		  Map<String,Object>  parameter = sqlUtil.setParameterInfo(request);
		  Map<String,Object>  res = this.buserService.load(parameter);
		  model.addAttribute("vo", res);
		  return  "attendance/myTeacher/edit";
	  }
	  
	  /**
	   * 查询列表
	   * @param request
	   * @param response
	   */
	  @RequestMapping("findList.do")
	  public  String  findList(HttpServletRequest request, HttpServletResponse response,Model  model){
		  long l=System.currentTimeMillis();
		  Map<String,Object> parameter = sqlUtil.queryParameter(request);
		  Map<String,Object> user=SysUtil.getSessionUsr(request, "user");//当前用户
		  Object userid=user.get("ID");
		  if("1".equals(user.get("TYPE"))){//老师
//			  parameter.put("LSUSERID", userid);
			  return  "attendance/myTeacher/list";//是老师就不查询
		  }else if("2".equals(user.get("TYPE"))){//学生
			  parameter.put("XSUSERID", userid);
		  }else if("3".equals(user.get("TYPE"))){//管理员
		  }
		  PageBean<Map<String,Object>> pb = this.buserService.myTeacher(parameter);
		  model.addAttribute("pageBean", pb);
		  model.addAttribute("parameter", parameter);
		  return  "attendance/myTeacher/list";
	  }
}
