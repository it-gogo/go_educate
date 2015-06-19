<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class='MainStyle'>
	<div ><a href="javascript:void(0);" onclick="findPage('${pageUrl}',1);">首页</a></div>
	<c:if test="${pageBean.hasPreviousPage }">
		<div><a href="javascript:void(0);" onclick="findPage('${pageUrl}','${pageBean.page-1 }');">上一页</a></div>
	</c:if>
	<div>总共<b>${pageBean.totalRows }</b>条数据</div>
	<div><b>${pageBean.page }</b>/${pageBean.totalPage }页</div>
	<c:if test="${pageBean.hasNextPage }">
		<div><a href="javascript:void(0);" onclick="findPage('${pageUrl}','${pageBean.page+1 }');">下一页</a></div>
	</c:if>
	<div><a href="javascript:void(0);" onclick="findPage('${pageUrl}','${pageBean.totalPage }');">尾页</a></div>
	<div class='SearchStyle'>
		<input type='text' id="inputPage"  onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" />
	</div>
	<div class=''>
		<input type='button' value='Go' onclick="findPageToInput('${pageUrl}','${pageBean.totalPage }','inputPage');" />
	</div>
</div>
<script>
	function findPage(url,page) {
		if(url==null  || typeof(url)=='undefined'){
			url = "findList.do";
		}
		var formid="searchForm";
		if(page==0){
			page=1;
		}
		if(url.indexOf("?")<0){
			url=url+"?page="+page;
		}else{
			url=url+"&page="+page;
		}
		$("#"+formid).attr("action",url)
		$("#"+formid).submit();
	}
	/*function findPage(url,page) {
		if(page==0){
			page=1;
		}
		if(url.indexOf("?")<0){
			location.href=url+"?page="+page;
		}else{
			location.href=url+"&page="+page;
		}
	}*/
	/*function findPageToInput(url,totalPage,id){
		var obj=$("#"+id).get(0);
		var page=obj.value;
		if(page==""){
			page=1;
		}else{
			page=parseInt(page);
		}
		if(page<1){
			page=1;
			obj.value=1;
		}else if(page>totalPage){
			page=totalPage;
			obj.value=totalPage;
		}
		if(url.indexOf("?")<0){
			location.href=url+"?page="+page;
		}else{
			location.href=url+"&page="+page;
		}
	}*/
	function findPageToInput(url,totalPage,id){
		var formid="searchForm";
		var obj=$("#"+id).get(0);
		var page=obj.value;
		if(page==""){
			page=1;
		}else{
			page=parseInt(page);
		}
		if(page<1){
			page=1;
			obj.value=1;
		}else if(page>totalPage){
			page=totalPage;
			obj.value=totalPage;
		}
		if(url.indexOf("?")<0){
			url=url+"?page="+page;
		}else{
			url=url+"&page="+page;
		}
		$("#"+formid).attr("action",url)
		$("#"+formid).submit();
	}
</script>