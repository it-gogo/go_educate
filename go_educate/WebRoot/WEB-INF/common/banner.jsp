<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<script type="text/javascript">
<!--
function loginOut(){
	jBox.confirm('您是否要退出系统？', '询问', function(v, h, f) {
		  if(v=="ok"){
			  location.href="../common/loginOUT.do"
		  }
	  });
}
//-->
</script>
<div class="banner">
	<div class="bgh">
		<div class="page">
			<div id="logo">
				<a href="Index.aspx.html"> 
					<img src="<%=request.getContextPath()%>/css/images/Student/logo.gif" alt="" width="165" height="48" /> 
				</a>
			</div>
			<div class="topxx">
				<%--<select onchange="changeCateory($(this))"
					style="font-size: 11px; background: #4991cf; color: #fff;">
					<option value="4">远程</option>
					<option selected='selected' value="1">自考</option>
				</select> --%>
				<c:if test="${user.TYPE==1 }">老师：</c:if>
				<c:if test="${user.TYPE==2 }">学生：</c:if>
				<c:if test="${user.TYPE==3 }">管理员：</c:if>
				${user.NAME}，欢迎您！ 
				<a href="../buser/findInfo.do">我的信息</a>  
				<a href="../buser/modifypw.do">密码修改</a> 
				<a onclick="loginOut()" href="javascript:">安全退出</a>
			</div>
			<div class="blog_nav">
				<ul>
					<li><a href="Index.aspx.html">我的信息</a></li>
					<li><a href="EducationCenter/Score.aspx.html">教务中心</a></li>
					<li><a href="MyAccount/wdcw.aspx.html">我的学费</a></li>
					<li><a href="OnlineTeaching/StudentMaterial.aspx.html">资料中心</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>