<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<%@include file="/WEB-INF/common/head.jsp"%>
	<script type="text/javascript" src="<%=request.getContextPath()%>/script/platform/buser.js"></script>
	<script type="text/javascript">
	function back(){
		location.href="findInfo.do"
	}
	</script>
</head>
<body>
	<%@include file="/WEB-INF/common/banner.jsp"%>
	<div class="page">
		<div class="box mtop">
			<%@include file="/WEB-INF/common/nav.jsp"%>
			<div class="rightbox">

				<h2 class="mbx">系统管理 &gt; 用户管理</h2>
				<%@include file="/WEB-INF/platform/nav.jsp"%>
				<div class="cztable">
					<h2 class="mbx">用户管理 &gt; 用户编辑</h2>
					<form action="modifyInfo.do" method="post" id="eform">
						<input type="hidden" name="ID" value="${user.ID }" />
						<table width="100%" cellpadding="0" cellspacing="0">
							<tr>
								<td width="15%" align="right"><div align="right">类型：</div></td>
								<td>
									<c:if test="${user.TYPE==1 }">老师</c:if>
									<c:if test="${user.TYPE==2 }">学生</c:if>
									<c:if test="${user.TYPE==3 }">管理员</c:if>
								</td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">账号：</div></td>
								<td>${user.TEXT }</td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">姓名：</div></td>
								<td><input size="25" name="NAME" value="${user.NAME }" class="input_2 requires"  /></td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">性别：</div></td>
								<td>
									<input type="radio" value="1"  name="SEX" id="sex_1" checked="checked"/><label for="sex_1">男</label>
									<input type="radio" value="0" name="SEX" id="sex_0" /><label for="sex_0">女</label>
								</td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">身份证：</div></td>
								<td><input size="25" name="IDENF" value="${user.IDENF }" class="input_2"  /></td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">电话：</div></td>
								<td><input size="25" name="TELEPHONE" value="${user.TELEPHONE }" class="input_2"  /></td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">QQ：</div></td>
								<td><input size="25" name="QQ" value="${user.QQ }" class="input_2"  /></td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">电子邮箱：</div></td>
								<td><input size="25" name="EMAIL" value="${user.EMAIL }" class="input_2"  /></td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">教学经验：</div></td>
								<td><textarea name="EXPERIENCE"  cols="80" rows="6" class="input_2">${user.EXPERIENCE }</textarea></td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">备注：</div></td>
								<td><textarea name="REMARK"  cols="80" rows="6" class="input_2">${user.REMARK }</textarea></td>
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

