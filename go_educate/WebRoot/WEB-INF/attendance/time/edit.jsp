<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<%@include file="/WEB-INF/common/head.jsp"%>
	<script type="text/javascript" src="<%=request.getContextPath()%>/script/attendance/time.js"></script>
	<%@include file="/My97DatePicker/date.jsp"%>
	<script type="text/javascript">
	$(function(){
		var obj='${timelesson }';
		if(typeof(obj)=='undefined' || obj==''){
			return ;
		}else{
			var json= eval("("+obj+")");
			var box=$("input[name='LESSONID']");
			for(var i=0;i<box.size();i++){
				var o=box.get(i);
				for(var j=0;j<json.length;j++){
					if(o.value==json[j].LESSONID){
						o.checked=true;
						break;
					}
				}
			}
		}
	});
	</script>
</head>
<body>
	<%@include file="/WEB-INF/common/banner.jsp"%>
	<div class="page">
		<div class="box mtop">
			<%@include file="/WEB-INF/common/nav.jsp"%>
			<div class="rightbox">

				<h2 class="mbx">考勤管理 &gt; 老师时间管理</h2>
				<%@include file="/WEB-INF/platform/nav.jsp"%>
				<div class="cztable">
					<h2 class="mbx">老师时间管理 &gt; 时间编辑</h2>
					<form action="save.do" method="post" id="eform">
						<input type="hidden" name="ID" value="${vo.ID }" />
						<table width="100%" cellpadding="0" cellspacing="0">
							<tr>
								<td width="15%" align="right"><div align="right">日期：</div></td>
								<td><input size="25" name="DATE" value="${vo.DATE }" class="input_2 requires Wdate"  /></td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">课时：</div></td>
								<td>
									<c:forEach items="${lessonList }" var="lesson">
										<input type="checkbox" name="LESSONID" value="${lesson.ID }" id="${lesson.ID }" /><label for="${lesson.ID }">${lesson.STARTTIME }-${lesson.ENDTIME }</label>&nbsp;&nbsp;
									</c:forEach>
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
