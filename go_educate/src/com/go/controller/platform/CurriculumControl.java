package com.go.controller.platform;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.go.common.util.Util;
import com.go.controller.base.BaseController;
import com.go.po.common.PageBean;
import com.go.po.common.Syscontants;
import com.go.service.platform.CurriculumService;
/**
 * 课程管理
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/curriculum")
public class CurriculumControl extends BaseController {
	  @Resource
	  private  CurriculumService  curriculumService;
	  /**
	   * 添加数据页面
	   * @return
	   */
	  @RequestMapping("add.do")
	  public  String add(HttpServletRequest request,HttpServletResponse response,Model  model){
		  return  "platform/curriculum/edit";
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
		  Map<String,Object>  res = this.curriculumService.load(parameter);
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
	  public  void save(HttpServletRequest request, HttpServletResponse response) throws Exception{
		  //获取请求参数
		  Map<String,Object> parameter = sqlUtil.setParameterInfo(request);
		  boolean  isIDNull = sqlUtil.isIDNull(parameter,"ID");
		  if(isIDNull){
			  //设置ID
			  Map<String,Object> n_parameter = sqlUtil.setTableID(parameter);
			  //添加菜单
			  this.curriculumService.add(n_parameter);
			  this.ajaxMessage(response, Syscontants.MESSAGE,"添加菜单成功");
		  }else{
			  this.curriculumService.update(parameter);
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
		  PageBean<Map<String,Object>> pb = this.curriculumService.findList(parameter);
		  model.addAttribute("pageBean", pb);
		  model.addAttribute("parameter", parameter);
		  return  "platform/curriculum/list";
	  }
	  /**
	   * 删除数据
	   * @param request
	   * @param response
	   */
	  @RequestMapping("delete.do")
	  public  void  delete(HttpServletRequest request, HttpServletResponse response){
		  List<String> parameter = sqlUtil.getIdsParameter(request);
		  this.curriculumService.delete(parameter);
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
			this.curriculumService.updatestat(parameter);
		}
}
