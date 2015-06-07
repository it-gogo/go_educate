<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<%@include file="/WEB-INF/common/head.jsp"%>
	<script type="text/javascript" src="<%=request.getContextPath()%>/script/attendance/lesson.js"></script>
	<script src="<%=request.getContextPath() %>/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript">
	$(function() {
		$( ".Wdate" ).click(function(){
			WdatePicker({dateFmt:'HH:mm'});
		});
		$( ".Wdate" ).focus(function(){
			WdatePicker({dateFmt:'HH:mm'});
		});
	});
	</script>
</head>
<body>
	<%@include file="/WEB-INF/common/banner.jsp"%>
	<div class="page">
		<div class="box mtop">
			<%@include file="/WEB-INF/common/nav.jsp"%>
			<div class="rightbox">

				<h2 class="mbx">考勤管理 &gt; 课时管理</h2>
				<%@include file="/WEB-INF/platform/nav.jsp"%>
				<div class="cztable">
					<h2 class="mbx">课时管理 &gt; 课时编辑</h2>
					<form action="save.do" method="post" id="eform">
						<input type="hidden" name="ID" value="${vo.ID }" />
						<table width="100%" cellpadding="0" cellspacing="0">
							<c:forEach items="${timeList }" var="time" >
								<tr>
									<td width="15%" align="right"><div align="right">${time.DATE }</div></td>
									<td>
										<c:forEach items="${time.timelessonList }" var="timelesson">
											${timelesson.STARTTIME }-${timelesson.ENDTIME }
										</c:forEach>
									</td>
								</tr>
							</c:forEach>
							<tr>
								<td width="15%" align="right"><div align="right">开始时间：</div></td>
								<td><input size="25" name="STARTTIME" value="${vo.STARTTIME }" class="input_2 requires Wdate"  /></td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">结束时间：</div></td>
								<td><input size="25" name="ENDTIME" value="${vo.ENDTIME }" class="input_2 requires Wdate"  /></td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">是否启用：</div></td>
								<td>
									<input type="radio" value="1"  name="ISACTIVES" id="isactives_1" checked="checked"/><label for="isactives_1">是</label>
									<input type="radio" value="0" name="ISACTIVES" id="isactives_0" /><label for="isactives_0">否</label>
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
