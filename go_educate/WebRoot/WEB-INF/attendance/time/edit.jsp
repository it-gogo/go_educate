<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<%@include file="/WEB-INF/common/head.jsp"%>
	<script type="text/javascript" src="<%=request.getContextPath()%>/script/attendance/time.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/script/jQuery.timeRange.js"></script>
	<%--<%@include file="/My97DatePicker/date.jsp"%>
	--%><script src="<%=request.getContextPath() %>/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript">
	$(function(){
		var obj='${timelesson }';
		if(typeof(obj)=='undefined' || obj==''){
			return ;
		}else{
			var json= eval("("+obj+")");
			var box=$("input[name='LESSONID']");
			for(var i=0;i<box.size();i++){
				var o=box.get(i);
				for(var j=0;j<json.length;j++){
					if(o.value==json[j].LESSONID){
						o.checked=true;
						break;
					}
				}
			}
		}
	});
	
	function removeTime(obj){
		if($("#time").find("div").size()==1){
			jBox("必须保留一个时间段。");
			return;
		}
		$(obj).parent("div").remove();
	}
	function addTime(){
		var index=$("#time").find("div").size();
		//var html="<div>从<input size=\"25\" id=\"STARTTIME\" class=\"input_2 Wdate\" onFocus=\"WdatePicker({dateFmt:'HH:mm',maxDate:'#F{$dp.$D(\'ENDTIME\')}'})\"  /> 到<input size=\"25\" id=\"ENDTIME\"  class=\"input_2 Wdate\" onFocus=\"WdatePicker({dateFmt:'HH:mm',minDate:'#F{$dp.$D(\'STARTTIME\')}'})\" /> <a style=\"width:32px;height: 32px;display: inline-block;vertical-align:middle;background-position: 32px;background-image: url('<%=request.getContextPath()%>/css/images/jbox-icons.png');\" href=\"javascript:void(0);\" onclick=\"removeTime(this);\"></a></div>";
		//var html="<div>从<input size=\"25\" name=\"STRETTIME\" class=\"input_2 Wdate\" onFocus=\"WdatePicker({dateFmt:'HH:mm'})\"  /> 到<input size=\"25\" name=\"ENDTIME\"  class=\"input_2 Wdate\" onFocus=\"WdatePicker({dateFmt:'HH:mm'})\" /> <a style=\"width:32px;height: 32px;display: inline-block;vertical-align:middle;background-position: 32px;background-image: url('<%=request.getContextPath()%>/css/images/jbox-icons.png');\" href=\"javascript:void(0);\" onclick=\"removeTime(this);\"></a></div>";
		var html="<div><input size=\"25\" readonly=\"readonly\" name=\"TIME\"  class=\"input_2\" onclick=\"timeRange(this)\" /> <a style=\"width:32px;height: 32px;display: inline-block;vertical-align:middle;background-position: 32px;background-image: url('<%=request.getContextPath()%>/css/images/jbox-icons.png');\" href=\"javascript:void(0);\" onclick=\"removeTime(this);\"></a></div>";
		$("#time").append(html);
	}
	
	</script>
	<style type="text/css">
	#time div{margin: 3px;}
	</style>
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
					<h2 class="mbx">老师时间管理 &gt; 时间编辑</h2>
					<form action="save.do" method="post" id="eform">
						<input type="hidden" name="ID" value="${vo.ID }" />
						<table width="100%" cellpadding="0" cellspacing="0">
							<tr>
								<td width="15%" align="right"><div align="right">日期：</div></td><%--{dateFmt:'HH:mm',disabledDates:['..\:1','..\:2','..\:4','..\:5','..\:6','..\:7','..\:8','..\:9','..\:^0']}--%>
								<td>
									<input size="25" name="DATE" value="${vo.DATE }" class="input_2 requires Wdate" onFocus="WdatePicker({minDate:'%y-%M-{%d}'})"  />
									<input class="input2" type="button" value="添加时间段" onclick="addTime();" style="float: right;" />
								</td>
							</tr>
							<tr>
								<td width="15%" align="right"><div align="right">时间段：</div></td>
								<td id="time">
									<c:if test="${timelesson==null}">
										<div>
											<input size="25" name="TIME" readonly="readonly" class="input_2" onclick="timeRange(this)" />
											<a style="width:32px;height: 32px;display: inline-block;vertical-align:middle;background-position: 32px;background-image: url('<%=request.getContextPath()%>/css/images/jbox-icons.png');" href="javascript:void(0);" onclick="removeTime(this);"></a>
										</div>
									</c:if>
									<c:if test="${timelesson!=null}">
										<c:forEach items="${timelesson }" var="vo">
											<div>
												<input size="25" name="TIME" value="${vo.STARTTIME }-${vo.ENDTIME}" readonly="readonly" class="input_2" onclick="timeRange(this)" />
												<a style="width:32px;height: 32px;display: inline-block;vertical-align:middle;background-position: 32px;background-image: url('<%=request.getContextPath()%>/css/images/jbox-icons.png');" href="javascript:void(0);" onclick="removeTime(this);"></a>
											</div>
										</c:forEach>
									</c:if>
									<%--<div>
										从<input size="25" name="STRETTIME"  class="input_2 Wdate" onFocus="WdatePicker({dateFmt:'HH:mm'})"  />
										到<input size="25" name="ENDTIME" class="input_2 Wdate" onFocus="WdatePicker({dateFmt:'HH:mm'})" />
										<a style="width:32px;height: 32px;display: inline-block;vertical-align:middle;background-position: 32px;background-image: url('<%=request.getContextPath()%>/css/images/jbox-icons.png');" href="javascript:void(0);" onclick="removeTime(this);"></a>
									</div>
									--%><%-- <c:forEach items="${lessonList }" var="lesson">
										<input type="checkbox" name="LESSONID" value="${lesson.ID }" id="${lesson.ID }" /><label for="${lesson.ID }">${lesson.STARTTIME }-${lesson.ENDTIME }</label>&nbsp;&nbsp;
									</c:forEach> --%>
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
