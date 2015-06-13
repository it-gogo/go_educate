<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<%@include file="/WEB-INF/common/head.jsp"%>
	<script type="text/javascript" src="<%=request.getContextPath()%>/script/attendance/semester.js"></script>
</head>
<body>
	<%@include file="/WEB-INF/common/banner.jsp"%>
	<div class="page">
		<div class="box mtop">
			<%@include file="/WEB-INF/common/nav.jsp"%>
			<div class="rightbox">

				<h2 class="mbx">考勤管理 &gt; 修改选课</h2>
				<%@include file="/WEB-INF/platform/nav.jsp"%>
				<div class="cztable">
					<div class="tis">
						<form action="modifyElective.do" method="post" id="searchForm">
							名称:<input size="20" name="NAME" value="${parameter.NAME }" class="input_2"  />
							<input class="input2" type="submit" value="查询"   />
							<input class="input2" type="button" value="清空"  onclick="clearData('searchForm')"  />
							<input class="input2" type="button" value="返回"  onclick="back()" style="float: right;"  />
						</form>
					</div>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tbody>
							<tr style="height: 25px" align="center">
								<th scope="col">名称 </th>
								<th scope="col">操作</th>
							</tr>
							<c:forEach items="${pageBean.list }" var="vo" >
								<tr align="center">
									<td>${vo.NAME }</td>
									<td>
										<c:if test="${vo.ELECTIVEID==NULL }"><a href="javascript:void(0);"  onclick="elective('${vo.ID}','${vo.USERID }','${parameter.SEMESTERID }')">选课</a></c:if>
										 <c:if test="${vo.ELECTIVEID!=NULL }">
										 	<a href="javascript:void(0);"  onclick="load('${vo.ID}','${vo.ELECTIVEID}','${parameter.SEMESTERID }')">修改</a> |
										 	<a href="javascript:void(0);"  onclick="deleteOne('${vo.ELECTIVEID}')">删除</a>
										 </c:if>
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
