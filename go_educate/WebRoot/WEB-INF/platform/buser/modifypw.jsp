<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<%@include file="/WEB-INF/common/head.jsp"%>
	<script type="text/javascript" src="<%=request.getContextPath()%>/script/platform/modifypw.js"></script>
	<script type="text/javascript">
	function back(){
		location.href="modifypw.do"
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
					<h2 class="mbx">修改密码</h2>
					<form action="modify.do" method="post" id="eform">
						<input type="hidden" name="ID" value="${vo.ID }" />
						<table width="100%" cellpadding="0" cellspacing="0">
							<tr>
								<td width="15%" align="right"><div align="right">旧密码：</div></td>
								<td><input size="20" type="password" name="opw" value="" class="input_2 requires"  /></td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">新密码：</div></td>
								<td><input size="20" type="password" name="npw" value="" class="input_2 requires"  /></td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">确认密码：</div></td>
								<td>
									<input size="20" type="password" name="cpw" value="" class="input_2 requires"  />
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<div align="center">
										<input type="button" value="提交" onclick="save('eform')" class="input2" /> 
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
