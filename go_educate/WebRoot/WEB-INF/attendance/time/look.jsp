<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<%@include file="/WEB-INF/common/head.jsp"%>
	<script type="text/javascript" src="<%=request.getContextPath()%>/script/attendance/time.js"></script>
	<style type="text/css">
	#time div{margin: 3px;}
	</style>
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
					<h2 class="mbx">老师时间管理 &gt; 查看时间</h2>
					<form action="save.do" method="post" id="eform">
						<input type="hidden" name="ID" value="${vo.ID }" />
						<table width="100%" cellpadding="0" cellspacing="0">
							<tr>
								<td width="15%" align="right"><div align="right">日期：</div></td><%--{dateFmt:'HH:mm',disabledDates:['..\:1','..\:2','..\:4','..\:5','..\:6','..\:7','..\:8','..\:9','..\:^0']}--%>
								<td>
								${vo.DATE }
								</td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">时间段：</div></td>
								<td id="time">
									<c:forEach items="${timelesson }" var="vo">
										<div>
											${vo.STARTTIME }-${vo.ENDTIME}
										</div>
									</c:forEach>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<div align="center">
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
