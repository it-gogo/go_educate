package com.go.controller.common;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.go.common.util.SysUtil;
import com.go.common.util.Util;
import com.go.controller.base.BaseController;
import com.go.service.common.LoginService;

@Controller
@RequestMapping("/common")
public class LoginController extends BaseController {

	@Resource
	private  LoginService  loginService;
	
	/**
	 * 登陆
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @param attr
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("login.do")
	public String login(HttpServletRequest request,
			                  HttpServletResponse response,
			                  HttpSession session,
			                  Model model,
			                  RedirectAttributes attr) throws  Exception{
		Map<String,Object>  parameter = sqlUtil.setParameterInfo(request);
		Object TEXT = parameter.get("TEXT");
		if(TEXT==null||TEXT.toString().trim().equals("")){
			attr.addFlashAttribute("msg","请输入用户名称");
			return "redirect:../common/loginPage.do";
		}
		Map<String,Object>  resMap = this.loginService.findUser(parameter);
		if(resMap==null||resMap.size()<1){
			attr.addFlashAttribute("msg","用户不存在");
			return "redirect:../common/loginPage.do";
		}else{
			Object PASSWORD = resMap.get("PASSWORD");
			Object ISACTIVES = resMap.get("ISACTIVES");
			String pw=(String)parameter.get("PASSWORD");
			if(pw==null || !PASSWORD.equals(Util.Encryption(pw))){
				attr.addFlashAttribute("msg","密码错误");
				return "redirect:../common/loginPage.do";
			}
			if(!"1".equals(ISACTIVES)){
				attr.addFlashAttribute("msg","用户被禁用");
				return "redirect:../common/loginPage.do";
			}
			session.setAttribute("user", resMap);
		}
		return "redirect:../common/loginSuccess.do";
	}
	/**
	 * 登陆成功
	 * @param request
	 * @param response
	 * @param session
	 * @param model
	 * @param attr
	 * @return
	 */
	@RequestMapping("loginSuccess.do")
	public  String  findSalmAndDept(HttpServletRequest request,
								    HttpServletResponse response,
								    HttpSession session,
								    Model model,
								    RedirectAttributes attr){
		Map<String,Object> user=SysUtil.getSessionUsr(request, "user");
		List<Map<String,Object>> list=loginService.findMenu(user);
		user.put("menuList", list);
		return "main";
	}
	
	/**
	 * 登陆页面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("loginPage.do")
    public ModelAndView loginPage(HttpServletRequest request,
    		                       HttpServletResponse response){
		ModelAndView  mv = new ModelAndView("login");
		return  mv;
	}
	
	/**
	 * 退出系统
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("loginOUT.do")
	public String loginOUT(HttpServletRequest request,
                           HttpServletResponse response){
		SysUtil.getSession(request).invalidate();
		return  "redirect:../common/loginPage.do";
	}
	
	
	
	
}
