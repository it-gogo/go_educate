<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<%@include file="/WEB-INF/common/head.jsp"%>
	<script type="text/javascript" src="<%=request.getContextPath()%>/script/platform/role.js"></script>
	<script type="text/javascript">
	$(function(){
		var obj='${roleautority }';
		if(typeof(obj)=='undefined' || obj==''){
			return ;
		}else{
			var json= eval("("+obj+")");
			var box=$("input[name='MENUID']");
			for(var i=0;i<box.size();i++){
				var o=box.get(i);
				for(var j=0;j<json.length;j++){
					if(o.value==json[j].MENUID){
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

				<h2 class="mbx">系统管理 &gt; 角色管理</h2>
				<%@include file="/WEB-INF/platform/nav.jsp"%>
				<div class="cztable">
					<h2 class="mbx">角色管理 &gt; 角色编辑</h2>
					
					<form action="save.do" method="post" id="eform">
						<input type="hidden" name="ID" value="${vo.ID }" />
						<table width="100%" cellpadding="0" cellspacing="0">
							<tr>
								<td width="15%" align="right"><div align="right">名称：</div></td>
								<td><input size="20" name="ROLETEXT" value="${vo.ROLETEXT }" class="input_2 requires"  /></td>
							</tr>
							<tr>
								<th width="15%" align="right"><div align="right">菜单名称：</div></th>
								<th>子菜单</th>
							</tr>
							<c:forEach items="${menuList }" var="menu">
								<tr>
									<td width="15%" align="right">
										<div align="right"><input type="checkbox" name="MENUID" value="${menu.ID }" onclick="checkMenu(this)" />${menu.MNAME }</div>
									</td>
									<td>
										<c:forEach items="${menu.list }" var="children">
											<input type="checkbox" name="MENUID" value="${children.ID }" />${children.MNAME }
										</c:forEach>
									</td>
								</tr>
							</c:forEach>
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
