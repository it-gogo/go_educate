<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<%@include file="/WEB-INF/common/head.jsp"%>
	<script type="text/javascript" src="<%=request.getContextPath()%>/script/platform/buser.js"></script>
	<script type="text/javascript">
	$(function(){
		showCurriculum();
		var obj='${usercurriculum }';
		if(typeof(obj)=='undefined' || obj==''){
			return ;
		}else{
			var json= eval("("+obj+")");
			var box=$("input[name='CURRICULUMID']");
			for(var i=0;i<box.size();i++){
				var o=box.get(i);
				for(var j=0;j<json.length;j++){
					if(o.value==json[j].CURRICULUMID){
						o.checked=true;
						break;
					}
				}
			}
		}
	});
	function showCurriculum(){
		var val=$("#TYPE").val();
		if(val==1){//选择老师
			$("#TYPESPAN").show();
		}else{
			$("#TYPESPAN").hide();
		}
	}
	</script>
</head>
<body>
	<%@include file="/WEB-INF/common/banner.jsp"%>
	<div class="page">
		<div class="box mtop">
			<%@include file="/WEB-INF/common/nav.jsp"%>
			<div class="rightbox">

				<h2 class="mbx">系统管理 &gt; 用户管理</h2>
				<%@include file="/WEB-INF/platform/nav.jsp"%>
				<div class="cztable">
					<h2 class="mbx">用户管理 &gt; 用户编辑</h2>
					<form action="save.do" method="post" id="eform">
						<input type="hidden" name="ID" value="${vo.ID }" id="ID" />
						<input type="hidden" name="PASSWORD" value="${vo.PASSWORD }" />
						<table width="100%" cellpadding="0" cellspacing="0">
							<tr>
								<td width="15%" align="right"><div align="right">类型：</div></td>
								<td>
									<select   name="TYPE" style="width: 168px;" id="TYPE" onchange="showCurriculum();"  >
										<option value="1" <c:if test="${vo.TYPE==1 }">selected="selected"</c:if>>老师</option>
										<option value="2" <c:if test="${vo.TYPE==2 }">selected="selected"</c:if>>学生</option>
										<option value="3" <c:if test="${vo.TYPE==3 }">selected="selected"</c:if>>管理员</option>
									</select>
									<span id="TYPESPAN">
										<c:forEach items="${curriculumList }" var="curriculum">
										<input type="checkbox" value="${curriculum.ID }" name="CURRICULUMID" />${curriculum.NAME }
										</c:forEach>
									</span>
								</td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">角色：</div></td>
								<td>
									<select   name="ROLEID" style="width: 168px;"   >
										<c:forEach items="${roleList }" var="role">
											<option value="${role.ID }" <c:if test="${vo.ROLEID==role.ID }">selected="selected"</c:if>>${role.ROLETEXT }</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">姓名：</div></td>
								<td><input size="25" name="NAME" value="${vo.NAME }" class="input_2 requires"  /></td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">性别：</div></td>
								<td>
									<input type="radio" value="1"  name="SEX" id="sex_1" checked="checked"/><label for="sex_1">男</label>
									<input type="radio" value="0" name="SEX" id="sex_0" /><label for="sex_0">女</label>
								</td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">账号：</div></td>
								<td>
									<input size="25" name="TEXT" value="${vo.TEXT }" class="input_2 requires"  onblur="checkText(this)"  />
								</td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">密码：</div></td>
								<td>
									<input size="25" type="password" name="newpw" value="" class="input_2"  />(默认:123456)
								</td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">身份证：</div></td>
								<td><input size="25" name="IDENF" value="${vo.IDENF }" class="input_2"  /></td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">电话：</div></td>
								<td><input size="25" name="TELEPHONE" value="${vo.TELEPHONE }" class="input_2"  /></td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">QQ：</div></td>
								<td><input size="25" name="QQ" value="${vo.QQ }" class="input_2"  /></td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">电子邮箱：</div></td>
								<td><input size="25" name="EMAIL" value="${vo.EMAIL }" class="input_2"  /></td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">是否启用：</div></td>
								<td>
									<input type="radio" value="1"  name="ISACTIVES" id="isactives_1" checked="checked"/><label for="isactives_1">是</label>
									<input type="radio" value="0" name="ISACTIVES" id="isactives_0" /><label for="isactives_0">否</label>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<div align="center">
										<input type="button" value="提交" onclick="save('eform')" class="input2" /> 
										<input type="button" value="返回" onclick="back()" class="input2" />
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
