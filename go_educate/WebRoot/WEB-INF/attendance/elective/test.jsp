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
				<div class="cztable">
				<table width="100%" cellpadding="0" cellspacing="0">
					<tr>
						<th></th>
						<c:forEach items="${map.dateList }" var="date"  >
							<th>${date.DATE }</th>
						</c:forEach>
					</tr>
					<c:forEach items="${map.lessonList }" var="lesson" varStatus="i" >
						<tr>
							<td align="center">${lesson.STARTTIME}-${lesson.ENDTIME}</td>
							<c:forEach items="${map.dateList }" var="date" varStatus="j"  >
								<td align="center">
									<c:forEach items="${date[lesson.ID]}" var="vo" varStatus="j"  >
									${vo.USERNAME }(${vo.CURRICULUMNAME })
									</c:forEach>
								</td>
							</c:forEach>
						</tr>
					</c:forEach>
				</table>
				</div>
		</div>
		<%@include file="/WEB-INF/common/footer.jsp"%>
	</div>
</body>
</html>
