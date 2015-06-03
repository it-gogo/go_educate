package com.go.controller.platform;

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
import org.springframework.web.servlet.ModelAndView;

import com.go.common.util.JSONUtil;
import com.go.common.util.TreeUtil;
import com.go.controller.base.BaseController;
import com.go.po.common.PageBean;
import com.go.po.common.Syscontants;
import com.go.po.common.TreePo;
import com.go.service.platform.BmenuService;
/**
 * 菜单管理
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/bmenu")
public class BmenuControl extends BaseController {
	  @Resource
	  private  BmenuService  bmenuService;
	  /**
	   * 添加数据页面
	   * @return
	   */
	  @RequestMapping("add.do")
	  public  String add(HttpServletRequest request,HttpServletResponse response,Model  model){
		  Map<String,Object>  parameter = sqlUtil.setParameterInfo(request);
		  parameter.put("SERIES", "1");
		  List<Map<String,Object>> list=this.bmenuService.findAll(parameter);
		  model.addAttribute("list", list);
		  return  "platform/bmenu/edit";
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
		  Map<String,Object>  res = this.bmenuService.load(parameter);
		  model.addAttribute("vo", res);
		  return "forward:add.do";
	  }
	  
	  /**
	   * 保存后台的菜单
	   * @param request
	   * @param response
	   */
	  @RequestMapping("save.do")
	  public  void save(HttpServletRequest request, HttpServletResponse response){
		  //获取请求参数
		  Map<String,Object> parameter = sqlUtil.setParameterInfo(request);
		  boolean  isIDNull = sqlUtil.isIDNull(parameter,"ID");
		  if(isIDNull){
			  //设置ID
			  Map<String,Object> n_parameter = sqlUtil.setTableID(parameter);
			  Map<String,Object> menu=new HashMap<String,Object>();
			  menu.put("ID", n_parameter.get("PID"));
			  menu=this.bmenuService.load(menu);
			  if(menu!=null){
				  n_parameter.put("PMCODE", menu.get("MCODE"));
			  }
			  //添加菜单
			  this.bmenuService.add(n_parameter);
			  this.ajaxMessage(response, Syscontants.MESSAGE,"添加菜单成功");
		  }else{
			  this.bmenuService.update(parameter);
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
		  PageBean<Map<String,Object>> pb = this.bmenuService.findList(parameter);
		  model.addAttribute("pageBean", pb);
		  model.addAttribute("parameter", parameter);
		  return  "platform/bmenu/list";
	  }
	  /**
	   * 删除数据
	   * @param request
	   * @param response
	   */
	  @RequestMapping("delete.do")
	  public  void  delete(HttpServletRequest request, HttpServletResponse response){
		  List<String> parameter = sqlUtil.getIdsParameter(request);
		  this.bmenuService.delete(parameter);
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
			this.bmenuService.updatestat(parameter);
		}
}
