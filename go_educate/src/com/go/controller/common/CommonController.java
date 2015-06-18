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
import com.go.common.util.SqlUtil;
import com.go.common.util.SysUtil;
import com.go.common.util.Util;
import com.go.common.util.ValidateCode;
import com.go.controller.base.BaseController;
import com.go.service.attendance.TaskService;

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
			taskParams.put("TYPE", user.get("TYPE"));
			taskParams.put("UPLOAD_TYPE", "0");
		  }else if("2".equals(user.get("TYPE"))){//学生
			  taskParams.put("TYPE", user.get("TYPE"));
			  taskParams.put("UPLOAD_TYPE", "1");
		  }else{
			  taskParams.put("TYPE", user.get("TYPE"));
			  taskParams.put("UPLOAD_TYPE", "0");
		  }
		String month = current_time.split(" ")[0];
		// 保存的位置
		String path = "/task_file/"+month+"/"+user.get("ID")+"/";

		String suffix = StringUtils.isNotBlank(Filedata.getOriginalFilename())?Filedata.getOriginalFilename():"";
		String[] suff = suffix.split("\\.");
		String filename =  String.valueOf(System.currentTimeMillis());
		if(suff.length>1){
			filename +=  "."+suff[suff.length-1];
		}
		path="/task_file/"+month+"/"+user.get("ID")+"/"+filename;
		taskParams.put("DOWN_LOAD_URL", path);
		try {
			InputStream sbs = Filedata.getInputStream(); 
			//文件上传保存
			Util.saveFileFromInputStream(sbs, request.getServletContext().getRealPath("/")+path, filename);
			result ="200";
			taskParams.put("STATUS", "0");
		} catch (IOException e) {
			result =e.getMessage();
			e.printStackTrace();
			taskParams.put("STATUS", "1");
		}
		taskService.add(taskParams);
		return result;
	}
	
}
