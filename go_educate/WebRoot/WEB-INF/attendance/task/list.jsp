<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<%@include file="/WEB-INF/common/head.jsp"%>
	<script type="text/javascript" src="<%=request.getContextPath()%>/script/attendance/task.js"></script>
	<script src="<%=request.getContextPath() %>/uploadify/jquery.uploadify.min.js" type="text/javascript"></script>
	<%@include file="/My97DatePicker/date.jsp"%>
	<script type="text/javascript">
		$(function(){
			//上传控件
			$("input[id^='file_upload_']").each(function(){
				//console.log($(this).attr("remark"));
				var cid=$(this).attr("remark");
				upload($(this),cid);
			});
		});
		//文件上传
		function upload(obj,cid){
			obj.uploadify({
				 'swf' 				:'<%=request.getContextPath()%>/uploadify/uploadify.swf',
				 'uploader'			:'<%=request.getContextPath()%>/common/task_upload.do',
				 'height'			:20,
				 'auto'				:true,
				 'formData'			:{classID:cid},
				 'buttonText'		:'上传作业',
				 'fileTypeExts'		:'*.*',
				 'uploadLimit' : 7 ,
				 'onFallback':function(){
		       },
		        'onUploadSuccess': function (file, data, response) {
		        	console.log(data); 
		        	if(isNaN(data)){
		        		jBox.alert('上传失败', '错误');	
		        	}else{
		        		jBox.alert('上传成功', '提示');
		        	}
		        		  
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

				<h2 class="mbx">系统管理 &gt; 作业管理</h2>
				<%@include file="/WEB-INF/platform/nav.jsp"%>
				<div class="cztable">
					<div class="tis">
						<form action="findList.do" method="post" id="searchForm">
							从:<input size="20" name="STARTDATE" value="${parameter.STARTDATE }" class="input_2 Wdate"  />
							到:<input size="20" name="ENDDATE" value="${parameter.ENDDATE }" class="input_2 Wdate"  />
							<input class="input2" type="submit" value="查询"   />
							<input class="input2" type="button" value="清空"  onclick="clearData('searchForm')"  />
						</form>
					</div>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tbody>
							<tr style="height: 25px" align="center">
								<th scope="col"><input type="checkbox" id="checkAll"  onclick="checkAll(this);"  /><label for="checkAll">全选</label></th>
								<th scope="col">日期 </th>
								<th scope="col">老师 </th>
								<th scope="col">学生 </th>
								<th scope="col">课时 </th>
								<th scope="col">课程 </th>
								<th scope="col">上课时间</th>
								<th scope="col">下课时间</th>
								<th scope="col">操作</th>
							</tr>
							<c:forEach items="${pageBean.list }" var="vo" varStatus="pg">
								<tr align="center">
									<td><input type="checkbox" name="ID" value="${vo.ID }" /></td>
									<td>${vo.DATE }</td>
									<td>${vo.LSNAME }</td>
									<td>${vo.XSNAME }</td>
									<td>${vo.MUCHLESSON }</td>
									<td>${vo.CURRICULUMNAME }</td>
									<td>${vo.STARTTIME }</td>
									<td>${vo.ENDTIME }</td>
									<td>
										<input type="text" remark="${vo.ID }" id="file_upload_${pg.index }"  alt="作业上传"/>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<%@include file="/WEB-INF/common/page.jsp"%>
				</div>
			</div>
		</div>
	<%@include file="/WEB-INF/common/footer.jsp"%>
	</div>
</body>
</html>
