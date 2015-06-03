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

import com.go.common.util.JSONUtil;
import com.go.common.util.SqlUtil;
import com.go.controller.base.BaseController;
import com.go.po.common.PageBean;
import com.go.po.common.Syscontants;
import com.go.service.platform.BmenuService;
import com.go.service.platform.BuserService;
import com.go.service.platform.RoleService;
/**
 * 角色管理
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/role")
public class RoleControl extends BaseController {
	  @Resource
	  private  RoleService  roleService;
	  @Resource
	  private  BmenuService  bmenuService;
	  @Resource
	  private  BuserService  buserService;
	  /**
	   * 添加数据页面
	   * @return
	   */
	  @RequestMapping("add.do")
	  public  String add(HttpServletRequest request,HttpServletResponse response,Model  model){
		  List<Map<String,Object>> list=bmenuService.findTree(null);
		  model.addAttribute("menuList", list);
		  return  "platform/role/edit";
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
		  Map<String,Object>  res = this.roleService.load(parameter);
		  model.addAttribute("vo", res);
		  List<Map<String,Object>> list=this.roleService.findroleautority(parameter);
		  model.addAttribute("roleautority", JSONUtil.listToArray(list));
		  return "forward:add.do";
	  }
	  
	  /**
	   * 保存后台的菜单
	   * @param request
	   * @param response
	 * @throws Exception 
	   */
	  @RequestMapping("save.do")
	  public  void save(HttpServletRequest request, HttpServletResponse response,String[] MENUID) throws Exception{
		  //获取请求参数
		  Map<String,Object> parameter = sqlUtil.setParameterInfo(request);
		  parameter.put("MENUID", MENUID);
		  boolean  isIDNull = sqlUtil.isIDNull(parameter,"ID");
		  if(isIDNull){
			  //设置ID
			  Map<String,Object> n_parameter = sqlUtil.setTableID(parameter);
			  parameter.put("ID", n_parameter.get("id"));
			  //添加菜单
			  this.roleService.add(n_parameter);
			  this.ajaxMessage(response, Syscontants.MESSAGE,"添加菜单成功");
		  }else{
			  this.roleService.update(parameter);
			  this.ajaxMessage(response, Syscontants.MESSAGE,"修改菜单成功");
		  }
		  List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
		  for(String str:MENUID){
			  Map<String,Object> map=new HashMap<String,Object>();
			  map=sqlUtil.setTableID(map);
			  map.put("ROLEID", parameter.get("ID"));
			  map.put("MENUID", str);
			  list.add(map);
		  }
		  if(list.size()>0){
			  this.roleService.addroleautority(list);
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
		  PageBean<Map<String,Object>> pb = this.roleService.findList(parameter);
		  model.addAttribute("pageBean", pb);
		  model.addAttribute("parameter", parameter);
		  return  "platform/role/list";
	  }
	  /**
	   * 删除数据
	   * @param request
	   * @param response
	   */
	  @RequestMapping("delete.do")
	  public  void  delete(HttpServletRequest request, HttpServletResponse response){
		  List<String> parameter = sqlUtil.getIdsParameter(request);
		  Map<String,Object> map=new HashMap<String,Object>();
		  map.put("roleidlist", parameter);
		  List list=this.buserService.findAll(map);
		  if(list!=null && list.size()>0){
			  this.ajaxMessage(response, Syscontants.MESSAGE, "删除失败,"+list.size()+"个用户在使用。");
			  return;
		  }
		  this.roleService.delete(parameter);
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
			this.roleService.updatestat(parameter);
		}
}
