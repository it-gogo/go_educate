package com.go.controller.common;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.go.common.util.ContextUtil;
import com.go.common.util.ValidateCode;
import com.go.controller.base.BaseController;


@Controller
@RequestMapping("/common")
public class CommonController extends BaseController{

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
}
