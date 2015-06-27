package com.go.controller.common;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
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

import com.go.common.util.ExtendDate;
import com.go.common.util.SysUtil;
import com.go.common.util.Util;
import com.go.controller.base.BaseController;
import com.go.service.attendance.ClassService;
import com.go.service.common.LoginService;
import com.go.service.platform.BuserService;

@Controller
@RequestMapping("/common")
public class LoginController extends BaseController {

	@Resource
	private  LoginService  loginService;
	@Resource
	  private  ClassService  classService;
	@Resource
	  private  BuserService  buserService;
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
		if(user==null){
			return "redirect:../common/loginPage.do";
		}
		List<Map<String,Object>> list=loginService.findMenu(user);
		user.put("menuList", list);
		Map<String,Object> parameter=new HashMap<String,Object>();
		parameter.put("LSUSERID", user.get("ID"));//老师ID
		parameter.put("today", ExtendDate.getYMD(new Date()));
		//parameter.put("STATUS", 0);//未上课
		list=classService.findNoClass(parameter);
		model.addAttribute("classList", list);
		int studentcount=buserService.myStudentCount(parameter);
		model.addAttribute("studentcount", studentcount);
//		parameter=new HashMap<String,Object>();
		
		Map<String,Object> aready=new HashMap<String,Object>();
		String str="";
		 Calendar   cal_1=Calendar.getInstance();//获取当前日期 
		 cal_1.add(Calendar.MONTH, 0);
		 cal_1.set(Calendar.DAY_OF_MONTH,1);//设置为1号,当前日期既为本月第一天 
		 str=ExtendDate.getYMD(cal_1);
		parameter.put("STARTDATE", str);//本月第一天 
		aready.put("STARTDATE", str);
		
		cal_1= Calendar.getInstance();    
		cal_1.set(Calendar.DAY_OF_MONTH, cal_1.getActualMaximum(Calendar.DAY_OF_MONTH));  
		str=ExtendDate.getYMD(cal_1);
		parameter.put("ENDDATE", str);//本月最后一天
		aready.put("ENDDATE",str);
		model.addAttribute("aready", aready);
		
		parameter.put("STATUS", 1);//上课
		model.addAttribute("attendcount", classService.findCount(parameter));//上课数
		parameter.remove("STATUS");//已排课
		model.addAttribute("alreadycount", classService.findCount(parameter));//已排课
		
		Map<String,Object> next=new HashMap<String,Object>();
		cal_1= Calendar.getInstance();    
		cal_1.set(Calendar.DAY_OF_MONTH,1);//设置为1号,当前日期既为本月第一天 
		cal_1.add(Calendar.MONTH, 1);//下个月
		 str=ExtendDate.getYMD(cal_1);
		parameter.put("STARTDATE", str);//下个月月第一天 
		next.put("STARTDATE", str);
		
		cal_1= Calendar.getInstance();    
		cal_1.set(Calendar.MONTH, cal_1.get(Calendar.MONTH)+2);//下个月
		cal_1.set(Calendar.DAY_OF_MONTH, 0);
		str=ExtendDate.getYMD(cal_1);
		parameter.put("ENDDATE", str);//下个月最后一天
		next.put("ENDDATE", str);
		model.addAttribute("next", next);
		model.addAttribute("nextcount", classService.findCount(parameter));//下个月排课
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
