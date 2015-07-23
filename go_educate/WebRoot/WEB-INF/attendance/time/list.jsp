<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<%@include file="/WEB-INF/common/head.jsp"%>
	<script type="text/javascript" src="<%=request.getContextPath()%>/script/attendance/time.js"></script>
	<%@include file="/My97DatePicker/date.jsp"%>
</head>
<body>
	<%@include file="/WEB-INF/common/banner.jsp"%>
	<div class="page">
		<div class="box mtop">
			<%@include file="/WEB-INF/common/nav.jsp"%>
			<div class="rightbox">

				<h2 class="mbx">考勤管理 &gt; 老师时间管理</h2>
				<%@include file="/WEB-INF/platform/nav.jsp"%>
				<div class="cztable">
					<div class="tis">
						<form action="findList.do" method="post" id="searchForm">
							开始时间:<input size="20" name="STARTDATE" value="${parameter.STARTDATE }" class="input_2 Wdate"  />
							结束时间:<input size="20" name="ENDDATE" value="${parameter.ENDDATE }" class="input_2 Wdate"  />
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
								<th scope="col">日期 </th>
								<!-- <th scope="col">课时</th> -->
								<th scope="col">上课时间</th>
								<th scope="col">操作</th>
							</tr>
							<c:forEach items="${pageBean.list }" var="vo" >
								<tr align="center">
									<td>
										<c:if test="${vo.ELECTIVENUM==0}"><input type="checkbox" name="ID" value="${vo.ID }" /></c:if>
										<c:if test="${vo.ELECTIVENUM>0}">已选课</c:if>
									</td>
									<td>${vo.USERNAME }</td>
									<td>${vo.DATE }</td>
									<%-- <td>
										<c:forEach items="${vo.children}" var="po" >
										${po.NAME }</br>
										</c:forEach>
									</td> --%>
									<td>
										<c:forEach items="${vo.children}" var="po" >
										${po.STARTTIME }-${po.ENDTIME }</br>
										</c:forEach>
									</td>
									<td>
										<c:if test="${vo.ELECTIVENUM==0}">
											<a href="javascript:void(0);"  onclick="loadxx('${vo.ID}')">修改</a> | 
											<a href="javascript:void(0);" onclick="deleteOne('${vo.ID}')" >删除</a>
										</c:if>
										<c:if test="${vo.ELECTIVENUM>0}"><a href="javascript:void(0);"  onclick="look('${vo.ID}')">查看</a></c:if>
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
