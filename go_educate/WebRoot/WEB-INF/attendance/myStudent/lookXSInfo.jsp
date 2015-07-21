<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<%@include file="/WEB-INF/common/head.jsp"%>
	<script type="text/javascript" src="<%=request.getContextPath()%>/script/attendance/myStudent.js"></script>
	<script type="text/javascript">
	function beforeSubimt(eform){
	return true;
}
	</script>
</head>
<body>
	<%@include file="/WEB-INF/common/banner.jsp"%>
	<div class="page">
		<div class="box mtop">
			<%@include file="/WEB-INF/common/nav.jsp"%>
			<div class="rightbox">

				<h2 class="mbx">考勤管理  &gt; 我的学生管理</h2>
				<%@include file="/WEB-INF/platform/nav.jsp"%>
				<div class="cztable">
					<h2 class="mbx">考勤管理  &gt;我的学生编辑</h2>
					<form action="saveXSInfo.do" method="post" id="eform">
						<input type="hidden" name="ID" value="${vo.ID }" id="ID" />
						<table width="100%" cellpadding="0" cellspacing="0">
							<tr>
								<td width="15%" align="right"><div align="right">姓名：</div></td>
								<td>${vo.NAME }</td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">性别：</div></td>
								<td>
									<c:if test="${vo.SEX==1 }">男</c:if>
									<c:if test="${vo.SEX==0 }">女</c:if>
								</td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">QQ：</div></td>
								<td>${vo.QQ }</td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">电子邮箱：</div></td>
								<td>${vo.EMAIL }</td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">备注：</div></td>
								<td><textarea name="REMARK"  cols="80" rows="6" class="input_2" >${vo.REMARK }</textarea></td>
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

