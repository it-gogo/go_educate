<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<%@include file="/WEB-INF/common/head.jsp"%>
	<script type="text/javascript" src="<%=request.getContextPath()%>/script/attendance/teacherkb.js"></script>
	<%@include file="/My97DatePicker/date.jsp"%>
</head>
<body>
	<%@include file="/WEB-INF/common/banner.jsp"%>
	<div class="page">
		<div class="box mtop">
			<%@include file="/WEB-INF/common/nav.jsp"%>
			<div class="rightbox">

				<h2 class="mbx">考勤管理 &gt; 老师课表管理</h2>
				<%@include file="/WEB-INF/platform/nav.jsp"%>
				<div class="cztable">
					<div class="tis">
						<form action="lookTimetable.do" method="post" id="searchForm">
							<input type="hidden" name="USERID" value="${parameter.USERID }" />
							开始时间:<input size="20" name="STARTDATE" value="${parameter.STARTDATE }" class="input_2 Wdate"  />
							到:<input size="20" name="ENDDATE" value="${parameter.ENDDATE }" class="input_2 Wdate"  />
							<input class="input2" type="submit" value="查询"   />
							<input class="input2" type="button" value="清空"  onclick="clearData('searchForm')"  />
						</form>
					</div>
					<table width="100%" cellpadding="0" cellspacing="0">
						<c:forEach items="${map.pb.list }" var="dateList"  >
							<tr>
								<th></th>
								<c:forEach items="${dateList }" var="date"  >
									<th>${date.DATE }</th>
								</c:forEach>
							</tr>
							<c:forEach items="${map.lessonList }" var="lesson" varStatus="i" >
								<tr>
									<td align="center">${lesson.STARTTIME}-${lesson.ENDTIME}</td>
									<c:forEach items="${dateList }" var="date" varStatus="j"  >
										<td align="center">
											<c:forEach items="${date[lesson.ID]}" var="vo" varStatus="j"  >
											${vo.USERNAME }&nbsp;&nbsp;&nbsp;${vo.CURRICULUMNAME }&nbsp;&nbsp;&nbsp;${vo.XSUSERNAME }
											</c:forEach>
										</td>
									</c:forEach>
								</tr>
							</c:forEach>
						</c:forEach>
					</table>
					<%@include file="/WEB-INF/common/page.jsp"%>
				</div>
			</div>
		</div>
	<%@include file="/WEB-INF/common/footer.jsp"%>
	</div>
</body>
</html>
