<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c"%>
<div class="leftbox">
	<div class="l_nav2">
		<c:forEach items="${user.menuList }" var="menu" varStatus="i">
			<div class="ta1">
				<strong>${menu.MNAME }</strong>
				<c:if test="${i.index==0 }"><div class="leftbgbt"></div></c:if>
				<c:if test="${i.index!=0 }"><div class="leftbgbt2"></div></c:if>
			</div>
			<div class="cdlist">
				<c:forEach items="${menu.list }" var="children">
					<div>
						<a href="${children.URLS }" <c:if test="${selectMenu.selectID==children.ID }">class="select"</c:if>>${children.MNAME }</a>
					</div>
				</c:forEach>
			</div>
		</c:forEach>
		<%--<div class="ta1">
			<strong>个人中心</strong>
			<div class="leftbgbt"></div>
		</div>
		<div class="cdlist">
			<div>
				<a href="../bmenu/findList.do">菜单管理</a>
			</div>
			<div>
				<a href="MyInfo/ClassInfo.aspx.html">班级信息 </a>
			</div>
			<div>
				<a href="User/StudentInfor/Letter.aspx.html">短信息</a>
			</div>
			<div>
				<a href="User/StudentInfor/systemMsge.aspx.html">学院通知</a>
			</div>
			<div>
				<a href="MyInfo/Objection.aspx.html">我的异议</a>
			</div>
		</div>
		<div class="ta1">
			<strong>教务中心</strong>
			<div class="leftbgbt2"></div>
		</div>
		<div class="cdlist">
			<div>
				<a href="EducationCenter/Application.aspx.html">我的报考</a>
			</div>
			<div>
				<a href="EducationCenter/Score.aspx.html">我的成绩</a>
			</div>
			<div>
				<a href="EducationCenter/Book.aspx.html">我的书籍</a>
			</div>
		</div>
		<div class="ta1">
			<strong>学习中心</strong>
			<div class="leftbgbt2"></div>
		</div>
		<div class="cdlist">
			<div>
				<a href="OnlineTeaching/StudentMaterial.aspx.html">资料下载</a>
			</div>
			<div>
				<a href="OnlineTeaching/StudentStudyRecordList.aspx.html">学习历程</a>
			</div>
		</div>

		<div class="ta1">
			<strong>财务中心</strong>
			<div class="leftbgbt2"></div>
		</div>
		<div class="cdlist">
			<div>
				<a href="MyAccount/wdcw.aspx.html">我的财务</a>
			</div>
		</div>
		<div class="ta1">
			<a href="" target="_blank"><strong>教学系统</strong> </a>
			<div class="leftbgbt2"></div>
		</div>--%>
	</div>
</div>