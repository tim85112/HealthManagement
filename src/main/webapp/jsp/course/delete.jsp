<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>享健你，遇見更好的自己．</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/gymstyle.css">
</head>
<div id="header">
	<h1>享健你，遇見更好的自己．</h1>
	<h2>你，今天健了嗎？</h2>
</div>
<div id="navigation">
	<ul>
		<li><a href="HealthManagement.jsp">首頁</a></li>
		<li><a href="#">會員管理</a></li>
		<li><a href="#">商城購物</a></li>
		<li><a href="#">健身成效</a></li>
		<li><a href="index.jsp" class="active">課程管理</a></li>
		<li><a href="#">社群論壇</a></li>
	</ul>
</div>
<br>
<div id="content" align="center">
	<h2>刪除課程資訊</h2>
	<form method="post"
		action="${pageContext.request.contextPath}/CourseDAO2">
		<input type="hidden" name="action" value="delete">
	<%-- 顯示成功或錯誤訊息 --%>
	<% String successMessage = (String) request.getAttribute("successMessage");
	   String errorMessage = (String) request.getAttribute("errorMessage"); %>
	<% if (successMessage != null) { %>
	<br><div style="color: #808080;">
		<%=successMessage%>
	</div>
	<% } %>
	<% if (errorMessage != null) { %>
	<br><div style="color: red;">
		<%=errorMessage%>
	</div>
	<% } %>
		<p>
			請輸入課程編號：<input type="text" name="course_id" required /> <input
				type="submit" value="確定" />
		</p>
	</form>
	<br>
	<a href="http://localhost:8080/HealthManagement/jsp/course/index.jsp"
		class="back-button">返回</a>
</div>
<div id="footer">
	<p>© 2025 健康管理系統. All Rights Reserved.</p>
</div>
</body>
</html>