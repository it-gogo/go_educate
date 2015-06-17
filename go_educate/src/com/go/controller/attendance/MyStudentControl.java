package com.go.controller.attendance;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.go.common.util.SysUtil;
import com.go.controller.base.BaseController;
import com.go.po.common.PageBean;
import com.go.service.attendance.SemesterService;
import com.go.service.platform.BuserService;

@Controller
@RequestMapping("/myStudent")
public class MyStudentControl extends BaseController {
	  @Resource
	  private  BuserService  buserService;
	  @Resource
	  private  SemesterService  semesterService;
	  /**
	   * 导出数据
	   * @param request
	   * @param response
	   * @return
	   */
	  @RequestMapping("look.do")
	  public  String load(HttpServletRequest request, HttpServletResponse response,Model  model){
		  Map<String,Object>  parameter = sqlUtil.setParameterInfo(request);
		  Map<String,Object>  res = this.buserService.load(parameter);
		  model.addAttribute("vo", res);
		  return  "attendance/myStudent/look";
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
}
