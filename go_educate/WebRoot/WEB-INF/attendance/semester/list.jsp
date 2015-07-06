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

				<h2 class="mbx">考勤管理 &gt; 学期管理</h2>
				<%@include file="/WEB-INF/platform/nav.jsp"%>
				<div class="cztable">
					<div class="tis">
						<form action="findList.do" method="post" id="searchForm">
							学生:<input size="20" name="XSNAME" value="${parameter.XSNAME }" class="input_2"  />
							<input class="input2" type="submit" value="查询"   />
							<input class="input2" type="button" value="清空"  onclick="clearData('searchForm')"  />
						</form>
					</div>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tbody>
							<tr style="height: 25px" align="center">
								<th scope="col">学员 </th>
								<th scope="col">学期 </th>
								<th scope="col">课时 </th>
								<th scope="col">日期 </th>
								<th scope="col">操作</th>
							</tr>
							<c:forEach items="${pageBean.list }" var="vo" >
								<tr align="center">
									<td>${vo.USERNAME }</td>
									<td>第 ${vo.SEVERAL } 学期</td>
									<td>${vo.MUCHLESSON }</td>
									<td> ${vo.FIRST } - ${vo.LATEST }</td>
									<td>
										<a href="javascript:void(0);"  onclick="lookTimetable('${vo.ID}')">查看</a> 
										<c:if test="${user.TYPE!=2 }">
										| <a href="javascript:void(0);"  onclick="modifyElective('${vo.ID}','${vo.USERID }')">修改</a> 
										| <a href="javascript:void(0);"  onclick="deleteOne('${vo.ID}')">删除</a>
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
