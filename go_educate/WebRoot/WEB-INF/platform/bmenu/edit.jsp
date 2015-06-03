<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<%@include file="/WEB-INF/common/head.jsp"%>
	<script type="text/javascript" src="<%=request.getContextPath()%>/script/platform/bmenu.js"></script>
</head>
<body>
	<%@include file="/WEB-INF/common/banner.jsp"%>
	<div class="page">
		<div class="box mtop">
			<%@include file="/WEB-INF/common/nav.jsp"%>
			<div class="rightbox">

				<h2 class="mbx">系统管理 &gt; 菜单管理</h2>
				<%@include file="/WEB-INF/platform/nav.jsp"%>
				<div class="cztable">
					<h2 class="mbx">菜单管理 &gt; 菜单编辑</h2>
					<form action="save.do" method="post" id="eform">
						<input type="hidden" name="ID" value="${vo.ID }" />
						<input type="hidden" name="SEQ" value="${vo.SEQ }" />
						<input type="hidden" name="MCODE" value="${vo.MCODE }" />
						<input type="hidden" name="PMCODE" value="${vo.PMCODE }" />
						<input type="hidden" name="SERIES" value="${vo.SERIES }" />
						<input type="hidden" name="ISACTIVES" value="${vo.ISACTIVES }" />
						<table width="100%" cellpadding="0" cellspacing="0">
							<tr>
								<td width="15%" align="right"><div align="right">上级菜单：</div></td>
								<td>
									<select   name="PID" style="width: 138px;"   >
										<option value="" selected="selected">请选择</option>
										<c:forEach items="${list }" var="menu" >
											<option value="${menu.ID }" <c:if test="${vo.PID==menu.ID }">selected="selected"</c:if> >${menu.MNAME }</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">菜单名称：</div></td>
								<td><input size="20" name="MNAME" value="${vo.MNAME }" class="input_2 requires"  /></td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">菜单URL：</div></td>
								<td><input  size="100" name="URLS" value="${vo.URLS }" class="input_2 requires" /></td>
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
