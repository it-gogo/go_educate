<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<%@include file="/WEB-INF/common/head.jsp"%>
	<script type="text/javascript" src="<%=request.getContextPath()%>/script/attendance/myStudent.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/script/attendance/time.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/script/jQuery.timeRange.js"></script>
	<script src="<%=request.getContextPath() %>/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
	<%@include file="/WEB-INF/common/banner.jsp"%>
	<div class="page">
		<div class="box mtop">
			<%@include file="/WEB-INF/common/nav.jsp"%>
			<div class="rightbox">

				<h2 class="mbx">考勤管理 &gt; 我的学生管理</h2>
				<%@include file="/WEB-INF/platform/nav.jsp"%>
				<div class="cztable">
					<h2 class="mbx">课时管理 &gt; 申请调课</h2>
					<form action="save.do" method="post" id="eform">
						<input type="hidden" name="ID" value="${vo.ID }" />
						<input type="hidden" name="LSUSERID" value="${vo.LSUSERID }" />
						<input type="hidden" name="XSUSERID" value="${vo.LSUSERID }" />
						<table width="100%" cellpadding="0" cellspacing="0">
							<tr>
								<td width="15%" align="right"><div align="right">老师：</div></td>
								<td>${vo.LSNAME }</td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">学员：</div></td>
								<td>${vo.XSNAME }</td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">原课程科目：</div></td>
								<td>${vo.CURRICULUMNAME }</td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">原日期：</div></td>
								<td>${vo.DATE }</td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">原时段：</div></td>
								<td>${vo.STARTTIME }-${vo.ENDTIME }</td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">课程科目：</div></td>
								<td>
									<select name="CURRICULUMID" style="width: 168px;">
										<c:forEach items="${curriculumList }" var="curriculum" >
											<option value="${curriculum.ID }">${curriculum.NAME }</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">日期：</div></td>
								<td><input size="25" name="DATE" value="" class="input_2 requires Wdate" onFocus="WdatePicker({minDate:'%y-%M-{%d+1}'})"   /></td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">时间段：</div></td>
								<td>
									<div>
										<input size="25" name="TIME" readonly="readonly" class="input_2" onclick="timeRange(this)" />
									</div>
								</td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">调课说明：</div></td>
								<td><input size="100" name="REMARK" value="" class="input_2"  /></td>
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
