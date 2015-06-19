<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<%@include file="/WEB-INF/common/head.jsp"%>
	<script type="text/javascript" src="<%=request.getContextPath()%>/script/platform/buser.js"></script>
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
					<div class="tis">
						<form action="findList.do" method="post" id="searchForm">
							姓名:<input size="20" name="NAME" value="${parameter.NAME }" class="input_2"  />
							账号:<input size="20" name="TEXT" value="${parameter.TEXT }" class="input_2"  />
							类型:<select name="TYPESTR">
								<option value="">请选择类型</option>
								<option value="1" <c:if test="${parameter.TYPESTR==1 }">selected="selected"</c:if> >老师</option>
								<option value="2" <c:if test="${parameter.TYPESTR==2 }">selected="selected"</c:if>>学生</option>
								<option value="3" <c:if test="${parameter.TYPESTR==3 }">selected="selected"</c:if>>管理员</option>
							</select>
							<input class="input2" type="submit" value="查询"   />
							<input class="input2" type="button" value="清空"  onclick="clearData('searchForm')"  />
							<input class="input2" type="button" value="添加" onclick="addxx()"  />
							<input class="input2" type="button" value="删除" onclick="deleteAll()"  />
						</form>
					</div>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tbody>
							<tr style="height: 25px" align="center">
								<th scope="col"><input type="checkbox" id="checkAll"  onclick="checkAll(this);"  /><label for="checkAll">全选</label></th>
								<th scope="col">姓名 </th>
								<th scope="col">账号</th>
								<th scope="col">类型</th>
								<th scope="col">操作</th>
							</tr>
							<c:forEach items="${pageBean.list }" var="vo" >
								<tr align="center">
									<td><input type="checkbox" name="ID" value="${vo.ID }" /></td>
									<td>${vo.NAME }</td>
									<td>${vo.TEXT }</td>
									<td>
										<c:if test="${vo.TYPE==1 }">老师</c:if>
										<c:if test="${vo.TYPE==2 }">学生</c:if>
										<c:if test="${vo.TYPE==3 }">管理员</c:if>
									</td>
									<td>
										<a href="javascript:void(0);"  onclick="loadxx('${vo.ID}')">修改</a> | 
										<a href="javascript:void(0);" onclick="deleteOne('${vo.ID}')" >删除</a>
										<c:if test="${vo.ISACTIVES==0 }"> | <a href="javascript:void(0);" onclick="changeIsactives('${vo.ID}','1')" >启用</a></c:if>
										<c:if test="${vo.ISACTIVES==1 }"> | <a href="javascript:void(0);" onclick="changeIsactives('${vo.ID}','0')" >禁用</a></c:if>
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
