<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>蜗牛上树管理系统</title>
<link rel="shortcut icon" href="http://www.snailforward.com/wp-content/uploads/2015/03/logo777.png" type="image/gif" />
<link type="text/css" href="<%=request.getContextPath()%>/css/loginstyle.css"  rel="stylesheet"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/script/jquery-1.4.2.min.js"></script>
<script language="javascript">

</script> 
<style>
	
</style>
</head>

<body>
	<img src="<%=request.getContextPath() %>/css/images/login.jpg" style="position:absolute;left:0px;top:0px;width:100%;height:100%;z-Index:-1; border:1px solid blue"/>
	<div style="margin-left:60%;margin-top: 12%;border: 3px #298d69 solid;width: 25%;">
    <form id="loginform" name="loginform" method="post" action="../common/login.do" style="margin-top: 10%;margin-bottom: 10%;" >
	    <ul>
	    <li><span style="color:blue;margin-left: 8%;font-size: 15pt;color: #298d69;">欢迎登录蜗牛</span></li>
	    <li><input name="TEXT" type="text" class="loginuser" value="${vo.TEXT }" style="width: 80%;margin-left: 5%;"/></li>
	    <li><input name="PASSWORD" type="password" class="loginpwd" value="${vo.PASSWORD}"  style="width: 80%;;margin-left: 5%;" /></li>
	   	<li>
	   		<label><input name="" type="checkbox" value="" checked="checked" style="margin-left: 70%;margin-top: 4%;"/>记住登录状态</label>
	    	<label style="color:red;">${msg}</label></li>
	    <li>
	    	<input name="" type="submit" class="loginbtn" value="登 录"  style="margin-left: 10%;margin-top: 2%;background-color: #298d69;width: 80%;border-radius:5px" />
	    </li>
	    </ul>
    </form>
    </div>
    <div class="loginbm" >&copy;copyright 2015 <a href="http://www.snailforward.com/" target="_blank">上海语浩文化传播有限公司</a>  版权所有 </div>
</body>
</html>
