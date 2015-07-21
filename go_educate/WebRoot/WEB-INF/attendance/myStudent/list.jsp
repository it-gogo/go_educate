<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<%@include file="/WEB-INF/common/head.jsp"%>
	<script type="text/javascript" src="<%=request.getContextPath()%>/script/attendance/myStudent.js"></script>
	<%@include file="/My97DatePicker/date.jsp"%>
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
					<div class="tis">
						<form action="findList.do" method="post" id="searchForm">
							姓名:<input size="20" name="XSNAME" value="${parameter.XSNAME }" class="input_2"  />
							<input class="input2" type="submit" value="查询"   />
							<input class="input2" type="button" value="清空"  onclick="clearData('searchForm')"  />
						</form>
					</div>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tbody>
							<tr style="height: 25px" align="center">
								<th scope="col">姓名 </th>
								<%--<th scope="col">状态 </th>
								--%><th scope="col">电话 </th>
								<th scope="col">QQ </th>
								<th scope="col">总课时 </th>
								<th scope="col">已读课时</th>
								<th scope="col">操作</th>
							</tr>
							<c:forEach items="${pageBean.list }" var="vo" >
								<tr align="center">
									<td>${vo.NAME }</td>
									<td>${vo.TELEPHONE }</td>
									<td>${vo.QQ }</td>
									<td>${vo.ZLESSON }</td>
									<td>${vo.YDLESSON }</td>
									<td>
										<a href="javascript:void(0);"  onclick="lookClass('${vo.SEMESTERID}')">课程详情</a> | 
										<a href="javascript:void(0);"  onclick="lookTimetable('${vo.SEMESTERID}')">查看课表</a> | 
										<a href="javascript:void(0);"  onclick="lookXSInfo('${vo.XSUSERID}')">学生信息</a>  
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
