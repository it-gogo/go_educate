<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<%@include file="/WEB-INF/common/head.jsp"%>
	<%@include file="/My97DatePicker/date.jsp"%>
	<script>
		function sign(id){
			$.ajax({
				url:"../sign/doSign.do",
				type:"POST",
				data:"ID="+id,
				success:function(message){
					var msg = eval("("+message+")");
					var result = msg.msg;
					if(result=="200"){
						location.reload();
					}else{
						jBox(result);
					}
				}
			});
		}
	</script>
</head>
<body>
	<%@include file="/WEB-INF/common/banner.jsp"%>
	<div class="page">
		<div class="box mtop">
			<%@include file="/WEB-INF/common/nav.jsp"%>
			<div class="rightbox">

				<h2 class="mbx">考勤管理 &gt; 签到管理</h2>
				<%@include file="/WEB-INF/platform/nav.jsp"%>
				<div class="cztable">
					<div class="tis">
						<form action="findList.do" method="post" id="searchForm">
							从:<input size="20" name="STARTDATE" value="${parameter.STARTDATE }" class="input_2 Wdate"  />
							到:<input size="20" name="ENDDATE" value="${parameter.ENDDATE }" class="input_2 Wdate"  />
							<input class="input2" type="submit" value="查询"   />
							<input class="input2" type="button" value="清空"  onclick="clearData('searchForm')"  />
							<%--<input class="input2" type="button" value="添加" onclick="addxx()"  />
							<input class="input2" type="button" value="删除" onclick="deleteAll()"  />--%>
						</form>
					</div>
					<span style="color:red;"> 签到时间:课前25至2min,准时; 课前2至0分钟,警告; 课后0至15min,迟到; 课后15min后,忘记签到.</span>
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
								<th scope="col">签到情况</th>
								<th scope="col">操作</th>
							</tr>
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
									<c:if test="${roleType =='1'}">
									<td>${vo.sign =="0"?"<span style='color:red;'>未签到</span>"
												:vo.sign=="1"?"<span style='color:blue;'>已签</span>"
												:vo.sign=="2"?"迟到"
												:vo.sign=="3"?"<span style='color:red;'>警告</span>"
												:"<span style='color:green;'>忘记签到</span>"
										 }
									</td>
									<td>
										<c:if test="${ vo.DATE==today and vo.sign =='0'}">
											<a href="javascript:void(0);"  onclick="sign('${vo.ID}')">签到</a>
										</c:if>
									</td>
									</c:if>
									<c:if test="${roleType =='2'}">
									<td>${vo.sign2 =="0"?"<span style='color:red;'>未签到</span>"
												:vo.sign2=="1"?"<span style='color:blue;'>已签</span>"
												:vo.sign2=="2"?"迟到"
												:vo.sign2=="3"?"<span style='color:red;'>警告</span>"
												:"<span style='color:green;'>忘记签到</span>"
										 }
									</td>
									<td>
										<c:if test="${ vo.DATE==today and vo.sign2 =='0'}">
											<a href="javascript:void(0);"  onclick="sign('${vo.ID}')">签到</a>
										</c:if>
									</td>
									</c:if>
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
