<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<%@include file="/WEB-INF/common/head.jsp"%>
	<script type="text/javascript" src="<%=request.getContextPath()%>/script/attendance/class.js"></script>
	<%@include file="/My97DatePicker/date.jsp"%>
</head>
<body>
	<%@include file="/WEB-INF/common/banner.jsp"%>
	<div class="page">
		<div class="box mtop">
			<%@include file="/WEB-INF/common/nav.jsp"%>
			<div class="rightbox">

				<h2 class="mbx">考勤管理 &gt; 节课管理</h2>
				<%@include file="/WEB-INF/platform/nav.jsp"%>
				<div class="cztable">
					<div class="tis">
						<form action="findList.do" method="post" id="searchForm">
							老师姓名:<input size="20" name="LSUSERNAME" value="${parameter.LSUSERNAME }" class="input_2"  />
							从:<input size="20" name="STARTDATE" value="${parameter.STARTDATE }" class="input_2 Wdate"  />
							到:<input size="20" name="ENDDATE" value="${parameter.ENDDATE }" class="input_2 Wdate"  />
							<input class="input2" type="submit" value="查询"   />
							<input class="input2" type="button" value="清空"  onclick="clearData('searchForm')"  />
							<%--<input class="input2" type="button" value="添加" onclick="addxx()"  />
							<input class="input2" type="button" value="删除" onclick="deleteAll()"  />--%>
						</form>
					</div>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tbody>
							<tr style="height: 25px" align="center">
								<th scope="col"><input type="checkbox" id="checkAll"  onclick="checkAll(this);"  /><label for="checkAll">全选</label></th>
								<th scope="col">日期 </th>
								<th scope="col">老师 </th>
								<th scope="col">学生 </th>
								<th scope="col">课时 </th>
								<th scope="col">课程 </th>
								<th scope="col">上课时间</th>
								<th scope="col">下课时间</th>
								<th scope="col">状态</th>
								<%--<th scope="col">操作</th>
							--%></tr>
							<c:forEach items="${pageBean.list }" var="vo" >
								<tr align="center">
									<td><input type="checkbox" name="ID" value="${vo.ID }" /></td>
									<td>${vo.DATE }</td>
									<td>${vo.LSNAME }</td>
									<td>${vo.XSNAME }</td>
									<td>${vo.MUCHLESSON }</td>
									<td>${vo.CURRICULUMNAME }</td>
									<td>${vo.STARTTIME }</td>
									<td>${vo.ENDTIME }</td>
									<td>
										<c:if test="${vo.STATUS==0 }">正常</c:if>
										<c:if test="${vo.STATUS==1 }">学生未上课</c:if>
										<c:if test="${vo.STATUS==2 }">老师未上课</c:if>
										<c:if test="${vo.STATUS==3 }">学生请假</c:if>
										<c:if test="${vo.STATUS==4 }">老师请假</c:if>
										<c:if test="${vo.STATUS==5 }">调课</c:if>
										<c:if test="${vo.STATUS==null }">未上课</c:if>
										<c:if test="${vo.STATUS=='' }">未上课</c:if>
									</td>
									<%--<td>
										<a href="javascript:void(0);"  onclick="loadxx('${vo.ID}')">修改</a> | 
										<a href="javascript:void(0);" onclick="deleteOne('${vo.ID}')" >删除</a>
										<c:if test="${vo.ISACTIVES==0 }"> | <a href="javascript:void(0);" onclick="changeIsactives('${vo.ID}','1')" >启用</a></c:if>
										<c:if test="${vo.ISACTIVES==1 }"> | <a href="javascript:void(0);" onclick="changeIsactives('${vo.ID}','0')" >禁用</a></c:if>
									</td>
								--%></tr>
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
