<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<div class="morebt">
	<ul>
		<c:forEach items="${selectMenu.list }" var="menu">
			<li><a class="<c:if test="${selectMenu.selectID==menu.ID }">tab1</c:if><c:if test="${selectMenu.selectID!=menu.ID }">tab2</c:if>" href="${menu.URLS }">${menu.MNAME }</a></li>
		</c:forEach>
	</ul>
</div>