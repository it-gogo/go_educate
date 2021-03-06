<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<%@include file="/WEB-INF/common/head.jsp"%>
	<script type="text/javascript" src="<%=request.getContextPath()%>/script/attendance/elective.js"></script>
	<script src="<%=request.getContextPath() %>/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript">
	$(function(){
		var obj='${electiveLesson }';
		if(typeof(obj)=='undefined' || obj==''){
			return ;
		}else{
			var json= eval("("+obj+")");
			var box=$("input[name='LESSONID']");
			for(var i=0;i<box.size();i++){
				var o=box.get(i);
				for(var j=0;j<json.length;j++){
					if(o.value==json[j].TIMEID+"-"+json[j].LESSONID){
						o.checked=true;
						break;
					}
				}
			}
		}
	});
	function selectLesson(obj){
		var $obj=$(obj);
		var id=$obj.attr("id");
		var arr=id.split("-");
		var td=$obj.parent().parent();
		var div=td.find("div");
		for(var i=0;i<div.size();i++){
			var d=div.eq(i);
			var timeid=d.children("input").first().attr("id").split("-")[0];
			var ii=timeid+"-"+arr[1];
			if(ii==id){
				continue;
			}
			if(obj.checked){//选择
				$("#"+ii).attr("disabled","disabled");
			}else{//不选择
				$("#"+ii).attr("disabled","");
			}
		}
	}
	
	/**
	 * 选择所要
	 * @param obj
	 */
	function checkAll(obj){
		var $obj;
		$obj=$(obj).parent().parent().find("input[type='checkbox']");
		for(var i=0;i<$obj.size();i++){
			var o=$obj.get(i);
			if(!o.disabled){
				o.checked = obj.checked;
				selectLesson(o);
			}
		}
	}
	</script>
	<style type="text/css">
	.float{ width:100%; clear:both; line-height:26px; color:#000; text-align:center; margin-top:10px;}
	.float{
	
	position:fixed;  
    left:0px;  
    bottom:10px;  
    _position:absolute;  
    _top:expression(document.documentElement.clientHeight + document.documentElement.scrollTop - this.offsetHeight); 
}
	</style>
</head>
<body>
	<%@include file="/WEB-INF/common/banner.jsp"%>
	<div class="page">
		<div class="box mtop">
			<%@include file="/WEB-INF/common/nav.jsp"%>
			<div class="rightbox">

				<h2 class="mbx">考勤管理 &gt; 课时管理</h2>
				<%@include file="/WEB-INF/platform/nav.jsp"%>
				<div class="cztable">
					<h2 class="mbx">课时管理 &gt; 课时编辑</h2>
					<form action="save.do" method="post" id="eform">
						<input type="hidden" name="CURRICULUMID" value="${parameter.ID }" />
						<input type="hidden" name="ID" value="${vo.ID }" />
						<table width="100%" cellpadding="0" cellspacing="0">
							<c:forEach items="${timeList }" var="time" varStatus="i" >
								<tr>
									<td width="15%" align="right"><div align="right">${time.key }</div></td>
									<td>
										<c:forEach items="${time.value }" var="lesson" varStatus="j">
											<div style="float: left;width:150px; "  >
												<p><input  type="checkbox" onclick="checkAll(this);" id="checkAll-${i.index}-${j.index}"  /><label for="checkAll-${i.index}-${j.index}">${lesson.USERNAME }</label></p>
												<c:forEach items="${lesson.lessonIdList}" var="po" varStatus="ii">
													<input  type="checkbox" name="LESSONID" value="${lesson.ID }-${po.ID }" id="${lesson.ID }-${po.ID }" onchange="selectLesson(this)" />
													<label for="${lesson.ID }-${po.ID }">${po.STARTTIME }-${po.ENDTIME }</label></br>
												</c:forEach>
											</div>
										</c:forEach>
									</td>
								</tr>
							</c:forEach>
							<%--<tr>
								<td width="15%" align="right"><div align="right">开始时间：</div></td>
								<td><input size="25" name="STARTTIME" value="${vo.STARTTIME }" class="input_2 requires Wdate"  /></td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">结束时间：</div></td>
								<td><input size="25" name="ENDTIME" value="${vo.ENDTIME }" class="input_2 requires Wdate"  /></td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">是否启用：</div></td>
								<td>
									<input type="radio" value="1"  name="ISACTIVES" id="isactives_1" checked="checked"/><label for="isactives_1">是</label>
									<input type="radio" value="0" name="ISACTIVES" id="isactives_0" /><label for="isactives_0">否</label>
								</td>
							</tr>--%>
							<%--<tr>
								<td colspan="2" align="center">
									
								</td>
							</tr>--%>
						</table>
						<div align="center" class="float">
							<input type="button" value="提交" onclick="jBox.confirm('您是否要提交选课？', '询问', function(v, h, f) {if(v=='ok'){save('eform');}});" class="input2" /> 
							<input type="button" value="返回" onclick="back()" class="input2" />
						</div>
					</form>
				</div>
			</div>
		</div>
		<%@include file="/WEB-INF/common/footer.jsp"%>
	</div>
</body>
</html>
