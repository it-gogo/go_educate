<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<%@include file="/WEB-INF/common/head.jsp"%>

</head>
<body>
	<%@include file="/WEB-INF/common/banner.jsp"%>
	<div class="page">
		<div class="box mtop">
			<%@include file="/WEB-INF/common/nav.jsp"%>
			<div class="rightbox">

				<h2 class="mbx"> 老师课程反馈</h2>
				<%@include file="/WEB-INF/platform/nav.jsp"%>
				<div class="cztable">
					<h2 class="mbx">课程管理 &gt; 课程反馈</h2>
					<form action="<%=request.getContextPath()%>/feedback/save.do" method="post" id="eform">
						<input type="hidden" name="ID" value="${vo.ID}" />
						<input type="hidden" name="CLASSID" value="${classId}" />
						<table width="100%" cellpadding="0" cellspacing="0">
							<tr>
								<td width="15%" align="right"><div align="right">作业情况：</div></td>
								<td>
									
									${vo.WORKSTATUS=='0'?'good':vo.WORKSTATUS=='1'?'fair':vo.WORKSTATUS=='2'?'bad':'unfinish'}
								</td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">作业评语：</div></td>
								<td>
									${vo.WORKDESC}
								</td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">课程内容：</div></td>
								<td>
									${vo.CLASSCONTEXT}
								</td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">本堂课后作业：</div></td>
								<td>
									${vo.WORK}
								</td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">学员反馈及进度：</div></td>
								<td>
									${vo.STUDENTDESC}
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<div align="center">
										<input type="button" value="返回" onclick="javascript:window.history.go(-1);" class="input2" />
									</div>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		<%@include file="/WEB-INF/common/footer.jsp"%>
	</div>
</body>
</html>
