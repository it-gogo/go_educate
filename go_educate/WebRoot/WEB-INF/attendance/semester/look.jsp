<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<%@include file="/WEB-INF/common/head.jsp"%>
	<script type="text/javascript" src="<%=request.getContextPath()%>/script/attendance/elective.js"></script>
	<script src="<%=request.getContextPath() %>/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
	<%--<%@include file="/WEB-INF/common/banner.jsp"%>
	--%><div class="page">
		<div class="box mtop">
				<div class="cztable">
				<div  align="center" style="margin-bottom: 20px;"><h1>${map.USERNAME }（第 ${map.SEVERAL } 学期课表）</h1></div>
				<div  align="left" style="font-size:18px;">上课时间从 ${map.FIRST } 到 ${map.LATEST } 一共 ${map.MUCHLESSON } 课时</div>
				<table width="100%" cellpadding="0" cellspacing="0">
					<c:forEach items="${map.dateList }" var="dateList"  >
						<tr>
							<th style="padding:0px;">
							</th>
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
										${vo.USERNAME }(${vo.CURRICULUMNAME })
										</c:forEach>
									</td>
								</c:forEach>
							</tr>
						</c:forEach>
					</c:forEach>
				</table>
				</div>
		</div>
		<%@include file="/WEB-INF/common/footer.jsp"%>
	</div>
</body>
</html>
