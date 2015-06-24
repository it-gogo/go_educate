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
import com.go.common.util.SysUtil;
import com.go.common.util.Util;
import com.go.controller.base.BaseController;
import com.go.po.common.PageBean;
import com.go.po.common.Syscontants;
import com.go.service.platform.BuserService;
import com.go.service.platform.CurriculumService;
import com.go.service.platform.RoleService;
/**
 * 用户管理
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/buser")
public class BuserControl extends BaseController {
	  @Resource
	  private  BuserService  buserService;
	  @Resource
	  private  RoleService  roleService;
	  @Resource
	  private  CurriculumService  curriculumService;
	  /**
	   * 添加数据页面
	   * @return
	   */
	  @RequestMapping("add.do")
	  public  String add(HttpServletRequest request,HttpServletResponse response,Model  model){
		  Map<String,Object> parameter=new HashMap<String,Object>();
		  Map<String,Object> user=SysUtil.getSessionUsr(request, "user");//当前用户
		  parameter.put("SUPERADMIN", user.get("SUPERADMIN"));
		  parameter.put("ISACTIVES", 1);
		  List<Map<String,Object>> list=roleService.findAll(parameter);
		  model.addAttribute("roleList", list);
		  
		  list=curriculumService.findAll(parameter);
		  model.addAttribute("curriculumList", list);
		  return  "platform/buser/edit";
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
		  Map<String,Object>  res = this.buserService.load(parameter);
		  model.addAttribute("vo", res);
		  
		  List<Map<String,Object>> list=this.buserService.findusercurriculum(parameter);
		  model.addAttribute("usercurriculum", JSONUtil.listToArray(list));
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
		  if(newpw!=null && !"".equals(newpw)){//有输入密码
			  System.out.println(newpw);
			  newpw=Util.Encryption(newpw);
		  }else{
			  Object obj=parameter.get("PASSWORD");
			  if(obj==null || "".equals(obj)){//有输入密码
				  newpw=Util.Encryption("123456");
			  }else{
				  newpw=obj.toString();
			  }
		  }
		  parameter.put("PASSWORD", newpw);
		  boolean  isIDNull = sqlUtil.isIDNull(parameter,"ID");
		  if(isIDNull){
			  //设置ID
			  Map<String,Object> n_parameter = sqlUtil.setTableID(parameter);
			  parameter.put("ID", n_parameter.get("id"));
			  //添加菜单
			  this.buserService.add(n_parameter);
			  this.ajaxMessage(response, Syscontants.MESSAGE,"添加成功");
		  }else{
			  this.buserService.update(parameter);
			  this.ajaxMessage(response, Syscontants.MESSAGE,"修改成功");
		  }
		  
		  List<String> ll=new ArrayList<String>();
		  ll.add(parameter.get("ID").toString());
		  buserService.deleteUC(ll);
		  Object type=parameter.get("TYPE");
		  if("1".equals(type)){//老师
			  List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
			  for(String str:CURRICULUMID){
				  Map<String,Object> map=new HashMap<String,Object>();
				  map = sqlUtil.setTableID(map);
				  map.put("USERID", parameter.get("ID"));
				  map.put("CURRICULUMID", str);
				  list.add(map);
			  }
			  buserService.addUC(list);
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
		  parameter.put("SUPERADMIN", user.get("SUPERADMIN"));
		  PageBean<Map<String,Object>> pb = this.buserService.findList(parameter);
		  model.addAttribute("pageBean", pb);
		  model.addAttribute("parameter", parameter);
		  return  "platform/buser/list";
	  }
	  /**
	   * 删除数据
	   * @param request
	   * @param response
	   */
	  @RequestMapping("delete.do")
	  public  void  delete(HttpServletRequest request, HttpServletResponse response){
		  List<String> parameter = sqlUtil.getIdsParameter(request);
		  this.buserService.delete(parameter);
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
		this.buserService.updatestat(parameter);
	}
	
	@RequestMapping("checkText.do")
	public void checkText(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> parameter = sqlUtil.setParameterInfo(request);
		Object id=parameter.get("ID");
		Map<String,Object> n_parameter=new HashMap<String,Object>();
		n_parameter.put("TEXT", parameter.get("TEXT"));
		 Map<String,Object>  res = this.buserService.load(n_parameter);
		 if(res==null || res.size()==0){//不存在
			 this.ajaxMessage(response, Syscontants.MESSAGE,"账号不存在");
		 }else{
			 if(id==null || "".equals(id)){
				 this.ajaxMessage(response, Syscontants.ERROE,"账号存在");
			 }else{
				 if(id.equals(res.get("ID"))){
					 this.ajaxMessage(response, Syscontants.MESSAGE,"账号不存在");
				 }else{
					 this.ajaxMessage(response, Syscontants.ERROE,"账号存在");
				 }
			 }
		 }
	}
		
	 /**
	   * 修改密码页面
	   * @return
	   */
	  @RequestMapping("modifypw.do")
	  public  String modifypw(HttpServletRequest request,HttpServletResponse response,Model  model){
		  return  "platform/buser/modifypw";
	  }
	  /**
	   * 修改密码
	   * @param request
	   * @param response
	 * @throws Exception 
	   */
	  @RequestMapping("modify.do")
	  public  void  modify(HttpServletRequest request, HttpServletResponse response) throws Exception{
		  Map<String,Object> user=SysUtil.getSessionUsr(request, "user");
		  Map<String,Object> parameter = sqlUtil.setParameterInfo(request);
		  Object opw=parameter.get("opw");//旧密码
		  Object npw=parameter.get("npw");//新密码
		  Object cpw=parameter.get("cpw");//确认密码
		  if(opw==null){
			  this.ajaxMessage(response, Syscontants.MESSAGE, "修改失败，旧密码为空。");
			  return;
		  }
		  if(user.get("PASSWORD").equals(Util.Encryption(opw.toString()))){
			  if(npw!=null && npw.equals(cpw)){
				  String PASSWORD=Util.Encryption(npw.toString());
				  parameter.put("PASSWORD", PASSWORD);
				  buserService.updatepassword(parameter);
				  this.ajaxMessage(response, Syscontants.MESSAGE, "修改成功");
				  user.put("PASSWORD", PASSWORD);
				  return;
			  }else{
				  this.ajaxMessage(response, Syscontants.MESSAGE, "修改失败，两次密码不一致。");
				  return;
			  }
		  }else{
			  this.ajaxMessage(response, Syscontants.MESSAGE, "修改失败，旧密码错误。");
			  return;
		  }
	  }
	  
	  /**
	   * 我的信息
	   * @return
	   */
	  @RequestMapping("findInfo.do")
	  public  String findInfo(HttpServletRequest request,HttpServletResponse response,Model  model){
		  return  "platform/buser/info";
	  }
	  /**
	   * 修改
	   * @param request
	   * @param response
	 * @throws Exception 
	   */
	  @RequestMapping("modifyInfo.do")
	  public  void modifyInfo(HttpServletRequest request, HttpServletResponse response,String newpw) throws Exception{
		  //获取请求参数
		  Map<String,Object> parameter = sqlUtil.setParameterInfo(request);
		  Map<String,Object> user=SysUtil.getSessionUsr(request, "user");
		  user.putAll(parameter);
		  this.buserService.update(user);
		  this.ajaxMessage(response, Syscontants.MESSAGE,"修改成功");
	  }
}
