<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<%@include file="/WEB-INF/common/head.jsp"%>
	<style type="text/css">
	</style>
</head>
<body>
    <%@include file="/WEB-INF/common/banner.jsp" %>
    <div class="page">
        <div class="box mtop">
            <%@include file="/WEB-INF/common/nav.jsp" %>
            <div class="rightbox">
	    		<h2 class="mbx">我的工作台&nbsp;&nbsp;&nbsp;&nbsp;</h2>
			  	<div class="dhbg">
			    	<div class="dhwz" style="padding: 0px 0 0 120px;">
						<p>我的学员：<span class="red">${studentcount }</span></p>
						<p>本月已上课数：<span class="red">${attendcount } </span></p>
						<p>本月已排课数：<span class="red">${alreadycount }</span></p>
						<p>下月已排课数：<span class="red">${nextcount }</span></p>
					</div>
				</div>
			    <div class="xxlc">
			        <strong class="lcbt">未上课学员</strong>
			    </div>
			    <div class="cztable">
			    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tbody>
							<tr style="height: 25px" align="center">
								<th scope="col">日期 </th>
								<th scope="col">学生 </th>
								<th scope="col">课时 </th>
								<th scope="col">课程 </th>
								<th scope="col">课时段</th>
								<th scope="col">上课状态</th>
								</tr>
							<c:forEach items="${classList}" var="vo" >
								<tr align="center">
									<td>${vo.DATE }</td>
									<td>${vo.XSNAME }</td>
									<td>${vo.MUCHLESSON }</td>
									<td>${vo.CURRICULUMNAME }</td>
									<td>${vo.STARTTIME }-${vo.ENDTIME }</td>
									<td>未上课</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
			    </div>
            </div>
        </div>
        <%@include file="/WEB-INF/common/footer.jsp" %>
    </div>
</body>
</html>
