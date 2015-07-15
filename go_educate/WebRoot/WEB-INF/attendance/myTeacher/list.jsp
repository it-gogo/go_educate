<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<%@include file="/WEB-INF/common/head.jsp"%>
	<script type="text/javascript" src="<%=request.getContextPath()%>/script/attendance/myTeacher.js"></script>
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
							<input class="input2" type="submit" value="查询"   />
							<input class="input2" type="button" value="清空"  onclick="clearData('searchForm')"  />
						</form>
					</div>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tbody>
							<tr style="height: 25px" align="center">
								<th scope="col">姓名 </th>
								<th scope="col">课程</th>
								<%--<th scope="col">电话</th>
								--%><th scope="col">性别</th>
								<th scope="col">QQ</th>
								<th scope="col">电子邮箱</th>
								<th scope="col">操作</th>
							</tr>
							<c:forEach items="${pageBean.list }" var="vo" >
								<tr align="center">
									<td>${vo.NAME }</td>
									<td>
										<c:forEach items="${vo.curriculumList }" var="po"  >
											(${po.NAME })
										</c:forEach>
									</td>
									<%--<td>${vo.TELEPHONE }</td>
									<td>${vo.IDENF }
										<c:if test="${vo.SEX==1 }">男</c:if>
										<c:if test="${vo.SEX==0 }">女</c:if><td>--%>
										<td>
									<c:choose>
										<c:when test="${!empty vo.SEX && vo.SEX==1 }">
											男
										</c:when>
										<c:otherwise>
											女
										</c:otherwise>
									</c:choose>
									<!-- 
										<c:if test="#{vo.SEX==1 }">男</c:if>
										<c:if test="#{vo.SEX==0 }">女</c:if>
									-->
									</td>
									
									<td>${vo.QQ }</td>
									<td>${vo.EMAIL }</td>
									<td>
										<a href="javascript:void(0);"  onclick="loadxx('${vo.ID}')">详 情</a>
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
