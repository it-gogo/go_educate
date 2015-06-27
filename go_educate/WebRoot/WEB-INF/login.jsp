<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>威信平台理系统</title>
<link type="text/css" href="<%=request.getContextPath()%>/css/loginstyle.css"  rel="stylesheet"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/script/jquery-1.4.2.min.js"></script>
<script language="javascript">






 
</script> 
</head>

<body style=" background-image:url('<%=request.getContextPath() %>/css/images/login.jpg'); background-repeat:no-repeat; background-position:center top; overflow:hidden;">
	<div style="margin-left:65%;margin-top: 20%;/* border: 3px #1f3345 solid;width: 30%; */">
    <form id="loginform" name="loginform" method="post" action="../common/login.do" style="margin:0 auto">
	    <ul>
	    <li><input name="TEXT" type="text" class="loginuser" value="${vo.TEXT }" /></li>
	    <li><input name="PASSWORD" type="password" class="loginpwd" value="${vo.PASSWORD}"  /></li>
	    <li>
	    	<input name="" type="submit" class="loginbtn" value="登 录"  />
	    	<label><input name="" type="checkbox" value="" checked="checked" />记住密码</label>
	    	<label style="color:red;">${msg}</label>
	    </li>
	    </ul>
    </form>
    </div>
    <div class="loginbm" >&copy;copyright 2015 <a href="http://www.snailforward.com/" target="_blank">上海语浩文化传播有限公司</a>  版权所有 </div>
</body>
</html>
