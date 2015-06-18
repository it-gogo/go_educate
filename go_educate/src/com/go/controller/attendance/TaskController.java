package com.go.controller.attendance;

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
import com.go.service.attendance.ClassService;
import com.go.service.attendance.TaskService;

/**
 * 作业系统控制器
 * @author zhangjf
 * @create_date 2015-6-12 下午8:59:13
 */
@Controller
@RequestMapping("/task")
public class TaskController extends BaseController {

	@Resource
	private TaskService taskService;
	
	 @Resource
	 private  ClassService  classService;
	
	/**
	 * 异步请求作业列表
	 * @author zhangjf
	 * @create_date 2015-6-12 下午9:11:37
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping("ajax_list.do")
	public String ajax_list(HttpServletRequest request, HttpServletResponse response,Model model){
		 Map<String,Object> parameter = sqlUtil.queryParameter(request);
		  Map<String,Object> user=SysUtil.getSessionUsr(request, "user");//当前用户
		  Object userid=user.get("ID");
		  if("1".equals(user.get("TYPE"))){//老师
			  parameter.put("LSUSERID", userid);
		  }else if("2".equals(user.get("TYPE"))){//学生
			  parameter.put("XSUSERID", userid);
		  }else if("3".equals(user.get("TYPE"))){//管理员
		  }
		  PageBean<Map<String,Object>> pb = this.classService.findList(parameter);
		  model.addAttribute("pageBean", pb);
		  model.addAttribute("parameter", parameter);
		return "attendance/task/list";
	}
	
	/**
	 * 根据课程时间获取作业列表
	 * @author zhangjf
	 * @create_date 2015-6-18 下午10:40:55
	 * @param request
	 * @param response
	 * @param model
	 * @param classID
	 * @return
	 */
	@RequestMapping("findList.do")
	public String findList(HttpServletRequest request, HttpServletResponse response,Model model,String classID){
		if(StringUtils.isNotBlank(classID)){
			Map<String,Object> parameter = sqlUtil.queryParameter(request);
			parameter.put("CLASS_ID", classID);
			PageBean<Map<String,Object>> pb =this.taskService.findList(parameter);
			model.addAttribute("pageBean", pb);
			model.addAttribute("parameter", parameter);
		}
		return "attendance/task/task_list";
	}

	
}
