package com.go.controller.common;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.go.common.util.ContextUtil;
import com.go.common.util.SendMailUtil;
import com.go.common.util.SqlUtil;
import com.go.common.util.SysUtil;
import com.go.common.util.Util;
import com.go.common.util.ValidateCode;
import com.go.controller.base.BaseController;
import com.go.service.attendance.ClassService;
import com.go.service.attendance.TaskService;
import com.go.service.platform.BuserService;
import com.go.thread.SendMailThread;

/***
 * 常用工具控制器
 * @author zhangjf
 * @create_date 2015-6-17 下午8:36:52
 */
@Controller
@RequestMapping("/common")
public class CommonController extends BaseController{

	@Resource
	private TaskService taskService;
	@Resource
	private  BuserService userService;
	@Resource
	private ClassService classService;
	
	/**
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("vailcode.do")
	public ModelAndView  createVaildateCode(HttpServletRequest request) throws IOException{
		HttpServletResponse response = ContextUtil.getResponse();
		Map<String,BufferedImage> code = ValidateCode.CreateValidateCode();
		Iterator<String> it = code.keySet().iterator();
		String codeStr="";
		if(it.hasNext()){
			codeStr = it.next();
		}
		byte[] in = ValidateCode.getImageByte(code.get(codeStr));
    	this.responseImage(response, in, "png");
    	return null;
	}
	
	@RequestMapping("upload.do")
	public  void upload(HttpServletRequest request, HttpServletResponse response) throws Exception{
			String res="";
	        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;  
	           /**得到图片保存目录的真实路径**/      
	        String logoRealPathDir = request.getSession().getServletContext().getRealPath("upload");     
	        /**根据真实路径创建目录**/      
	        File logoSaveFile = new File(logoRealPathDir);       
	        if(!logoSaveFile.exists())       
	            logoSaveFile.mkdirs();       
	        Iterator<String> iter = multipartRequest.getFileNames();
            while (iter.hasNext()) {
		         /**页面控件的文件流**/      
		        MultipartFile multipartFile = multipartRequest.getFile(iter.next());   
		        /**获取文件的后缀**/      
		        String suffix = multipartFile.getOriginalFilename().substring    
		        (multipartFile.getOriginalFilename().lastIndexOf("."));   
		          
		         /**拼成完整的文件保存路径加文件**/      
		        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH_mm_ss_SSS");
				//文件名称
				String filename =  sdf.format(new Date());
		        String name = filename+suffix;  
		        res="../upload/"+name;
		        String fileName = logoRealPathDir + File.separator+name;      
		        File file = new File(fileName);   
		        multipartFile.transferTo(file);  
		        this.ajaxData(response, res);
            }
	}
	
	/**
	 * 作业上传控制器类
	 * @author zhangjf
	 * @create_date 2015-6-17 下午8:30:25
	 * @param request
	 * @param Filedata
	 * @return
	 */
	@RequestMapping("task_upload.do")
	public @ResponseBody String task_upload(HttpServletRequest request,@RequestPart MultipartFile Filedata,String classID){
		String result="";
		String currentUserType="";
		Map<String,Object> user=SysUtil.getSessionUsr(request, "user");//当前用户
		/**
		 * 创建作业日志对象
		 */
		String current_time=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		Map<String,Object> taskParams=new HashMap<String, Object>();
		taskParams.put("ID", SqlUtil.uuid());//设置ID
		taskParams.put("CLASS_ID", classID);//设置节课ID
		taskParams.put("USER_ID", user.get("ID"));//设置节课ID
		taskParams.put("CREATE_TIME",current_time );//设置节课ID
		if("1".equals(user.get("TYPE"))){//老师
			currentUserType="老师";
			taskParams.put("TYPE", user.get("TYPE"));
			taskParams.put("UPLOAD_TYPE", "0");
		  }else if("2".equals(user.get("TYPE"))){//学生
			  currentUserType="学生";
			  taskParams.put("TYPE", user.get("TYPE"));
			  taskParams.put("UPLOAD_TYPE", "1");
		  }else{
			  taskParams.put("TYPE", user.get("TYPE"));
			  taskParams.put("UPLOAD_TYPE", "2");
		  }
		String month = current_time.split(" ")[0];
		// 保存的位置
		String path = "/task_file/"+month+"/"+user.get("ID")+"/";
		String url=request.getSession().getServletContext().getRealPath("/");
		System.out.println("session:"+url);
		String suffix = StringUtils.isNotBlank(Filedata.getOriginalFilename())?Filedata.getOriginalFilename():"";
		String[] suff = suffix.split("\\.");
		String filename =  String.valueOf(System.currentTimeMillis());
		if(suff.length>1){
			filename +=  "."+suff[suff.length-1];
		}
		String down_path="/task_file/"+month+"/"+user.get("ID")+"/"+filename;
		taskParams.put("DOWN_LOAD_URL", down_path);
		try {
			InputStream sbs = Filedata.getInputStream(); 
			//文件上传保存
			Util.saveFileFromInputStream(sbs, /**request.getServletContext().getRealPath("/")**/url+path, filename);
			result ="200";
			taskParams.put("STATUS", "0");
		} catch (IOException e) {
			result =e.getMessage();
			e.printStackTrace();
			taskParams.put("STATUS", "1");
		}
		taskService.add(taskParams);
		/**
		 * zhangjf 2015-06-28 进行邮件发送start
		 */
		//1.先查询当前课表的信息
		Map<String,Object> params=new HashMap<String, Object>();
		params.put("ID", classID);
		Map<String,Object> classObj=classService.load(params);
		File file=new File(url+path+File.separator+filename);
		Map<String,Object>recevier=null;
		if(file.exists()){
			if("老师".equals(currentUserType)){
				params=new HashMap<String, Object>();
				params.put("ID", classObj.get("XSUSERID"));
				recevier=userService.load(params);
				if(StringUtils.isNotBlank(recevier.get("EMAIL").toString())){
					SendMailThread thread=new SendMailThread(recevier, "老师:"+user.get("NAME")+"作业上传", file);
					thread.start();
				}
				
			}else if("学生".equals(currentUserType)){
				params=new HashMap<String, Object>();
				params.put("ID", classObj.get("LSUSERID"));
				recevier=userService.load(params);	
				if(StringUtils.isNotBlank(recevier.get("EMAIL").toString())){
					SendMailThread thread=new SendMailThread(recevier, "学生:"+user.get("NAME")+"作业上传", file);
					thread.start();
				}
				
			}
			/*SendMailUtil sender=new SendMailUtil(true);
			sender.sendMail("邮件提醒", "您对应的课程存在作业上传,请及时登录查看下载！", "zjf890811@sina.com", file);*/
		}
		/**
		 * zhangjf 2015-06-28 进行邮件发送end
		 */
		return result;
	}
	
}
