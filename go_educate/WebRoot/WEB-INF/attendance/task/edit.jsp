<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<%@include file="/WEB-INF/common/head.jsp"%>
	<script type="text/javascript" src="<%=request.getContextPath()%>/script/attendance/task.js"></script>
	<script src="<%=request.getContextPath() %>/My97DatePicker/WdatePicker.js"></script>
	<script src="<%=request.getContextPath() %>/uploadify/jquery.uploadify.min.js" type="text/javascript"></script>
	<script type="text/javascript">
	$(function() {
		//上传控件
	$("input[id^='file_upload_']").each(function(){
		upload($(this));
	});
	
		$( ".Wdate" ).click(function(){
			WdatePicker({dateFmt:'HH:mm'});
		});
		$( ".Wdate" ).focus(function(){
			WdatePicker({dateFmt:'HH:mm'});
		});		
	});
	
	//文件上传
function upload(obj){
	obj.uploadify({
		 'swf' 				:'<%=request.getContextPath()%>/uploadify/uploadify.swf',
		 'uploader'			:'<%=request.getContextPath()%>/common/task_upload.do',
		 'height'			:20,
		 'auto'				:true,
		 'buttonText'		:'上传作业',
		 'fileTypeExts'		:'*.*',
		 'uploadLimit' : 7 ,
		 'onFallback':function(){
       },
       'onSelect' : function(file) {
       },
        'onUploadSuccess': function (file, data, response) { 
        		$("input[name='DOWN_LOAD_URL']").val(data);
        		 jBox.alert('上传成功', '提示'); 
       }  
   });
}
	</script>
</head>
<body>
	<%@include file="/WEB-INF/common/banner.jsp"%>
	<div class="page">
		<div class="box mtop">
			<%@include file="/WEB-INF/common/nav.jsp"%>
			<div class="rightbox">

				<h2 class="mbx">考勤管理 &gt; 作业管理</h2>
				<%@include file="/WEB-INF/platform/nav.jsp"%>
				<div class="cztable">
					<h2 class="mbx">作业管理 &gt;添加作业</h2>
					<form action="save.do" method="post" id="eform">
						<input type="hidden" name="ID" value="${vo.ID }" />
						<input type="hidden" name="DOWN_LOAD_URL" value="${vo.DOWN_LOAD_URL }" />
						<table width="100%" cellpadding="0" cellspacing="0">
							<tr>
								<td width="15%" align="right"><div align="right">名称：</div></td>
								<td><input size="25" name="NAME" value="${vo.NAME }" class="input_2 requires"  /></td>
							</tr>
							
							<tr>
								<td width="15%" align="right"><div align="right">上课时间：</div></td>
								<td>
									<select id="lesson_sel" name="LESSON_ID">
										<option value="">---请选择---</option>	
									<c:forEach items="${pageBean.list }" var="vo" >
											<option value="${vo.ID }">${vo.STARTTIME }--${vo.ENDTIME }</option>								 
									</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
							<td width="15%" align="right"><div align="right">作业上传：</div></td>
							<td>
								<div style="width:100px;display: inline-block;float: left;margin-top: 15px;">
								<input type="text" id="file_upload_img"  alt="作业上传"/>
								</div>
							</td>
							</tr>						
							<tr>
								<td colspan="2" align="center">
									<div align="center">
										<input type="button" value="提交" onclick="save('eform')" class="input2" /> 
										<input type="button" value="返回" onclick="back()" class="input2" />
									</div>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		<%@include file="/WEB-INF/common/footer.jsp"%>
	</div>
</body>
</html>
