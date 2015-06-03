package com.go.controller.attendance;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.go.controller.base.BaseController;
import com.go.po.common.PageBean;
import com.go.po.common.Syscontants;
import com.go.service.attendance.LessonService;
/**
 * 课时管理
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/lesson")
public class LessonControl extends BaseController {
	  @Resource
	  private  LessonService  lessonService;
	  /**
	   * 添加数据页面
	   * @return
	   */
	  @RequestMapping("add.do")
	  public  String add(HttpServletRequest request,HttpServletResponse response,Model  model){
		  return  "attendance/lesson/edit";
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
		  Map<String,Object>  res = this.lessonService.load(parameter);
		  model.addAttribute("vo", res);
		  return "forward:add.do";
	  }
	  
	  /**
	   * 保存后台的菜单
	   * @param request
	   * @param response
	 * @throws Exception 
	   */
	  @RequestMapping("save.do")
	  public  void save(HttpServletRequest request, HttpServletResponse response,String newpw,String[] CURRICULUMID) throws Exception{
		  //获取请求参数
		  Map<String,Object> parameter = sqlUtil.setParameterInfo(request);
		  boolean  isIDNull = sqlUtil.isIDNull(parameter,"ID");
		  if(isIDNull){
			  //设置ID
			  Map<String,Object> n_parameter = sqlUtil.setTableID(parameter);
			  parameter.put("ID", n_parameter.get("id"));
			  //添加菜单
			  this.lessonService.add(n_parameter);
			  this.ajaxMessage(response, Syscontants.MESSAGE,"添加菜单成功");
		  }else{
			  this.lessonService.update(parameter);
			  this.ajaxMessage(response, Syscontants.MESSAGE,"修改菜单成功");
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
		  PageBean<Map<String,Object>> pb = this.lessonService.findList(parameter);
		  model.addAttribute("pageBean", pb);
		  model.addAttribute("parameter", parameter);
		  return  "attendance/lesson/list";
	  }
	  /**
	   * 删除数据
	   * @param request
	   * @param response
	   */
	  @RequestMapping("delete.do")
	  public  void  delete(HttpServletRequest request, HttpServletResponse response){
		  List<String> parameter = sqlUtil.getIdsParameter(request);
		  this.lessonService.delete(parameter);
		  this.ajaxMessage(response, Syscontants.MESSAGE, "删除成功");
	  }
  /**
	 *更新数据状态
	 * @param request
	 * @param response
	 */
	@RequestMapping("changeIsactives")
	public void changeIsactives(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> parameter = sqlUtil.setParameterInfo(request);
		Object obj=parameter.get("ISACTIVES");
		if("1".equals(obj)){
			 this.ajaxMessage(response, Syscontants.MESSAGE,"启用成功");
		}else{
			this.ajaxMessage(response, Syscontants.MESSAGE,"禁用成功");
		}
		this.lessonService.updatestat(parameter);
	}
}
