package com.go.controller.common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
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
		Object type=user.get("TYPE");
		if("1".equals(type)){//老师
			parameter.put("LSUSERID", user.get("ID"));//老师ID
		}else if("2".equals(type)){//学生
			parameter.put("LSUSERID", user.get("ID"));//学生ID
		}else if("3".equals(type)){//管理员
			parameter.put("TYPESTR", "2");//查找学生
		}
		parameter.put("SUPERADMIN", user.get("SUPERADMIN"));//
		Calendar c=Calendar.getInstance();
		c.add(Calendar.DATE, -7);
		parameter.put("STARTDATE", ExtendDate.getYMD(c));
		c=Calendar.getInstance();
		c.add(Calendar.DATE, 7);
		parameter.put("ENDDATE", ExtendDate.getYMD(c));
		//parameter.put("STATUS", 0);//未上课
		list=classService.findNoClass(parameter);//前后七天数据
		/**
		 * zhangjf 2015-10-13处理显示星期几start
		 */
		for (Map<String, Object> classMap : list) {
			if(classMap.containsKey("DATE")&&classMap.get("DATE")!=null){
				classMap.put("weekDay", dayForWeek(classMap.get("DATE").toString()));
			}
		}
		/**
		 * zhangjf 2015-10-13处理显示星期几end
		 */
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
		
		model.addAttribute("attendcount", classService.findSgkCount(parameter));//上课数
		
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
	
	/**
	 * 根据日期获取星期几
	 * @author zhangjf
	 * @create_time 2015-10-13 下午12:06:50
	 * @param dateTime
	 * @return
	 */
	private String dayForWeek(String dateTime){
		 SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");  
	      
		    Date tmpDate=null;
			try {
				tmpDate = format.parse(dateTime);
				 Calendar cal = new GregorianCalendar();  
				 cal.set(tmpDate.getYear(), tmpDate.getMonth(), tmpDate.getDay());
				 Integer day=cal.get(Calendar.DAY_OF_WEEK)-1;
				 switch (day) {
				case 0:
					return "星期日";
				case 1:
					return "星期一";
				case 2:
					return "星期二";
				case 3:
					return "星期三";
				case 4:
					return "星期四";
				case 5:
					return "星期五";	
				default:
					return "星期六";
				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("获取星期失败");
			}  
		      
		   return "";
	}
	
	
}
