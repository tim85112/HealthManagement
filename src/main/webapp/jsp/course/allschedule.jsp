<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, model.course.* "%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>享健你，遇見更好的自己．</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/gymstyle.css">
</head>
<body>
	<div id="header">
		<h1>享健你，遇見更好的自己．</h1>
		<h2>你，今天健了嗎？</h2>
	</div>
    <div id="navigation">
        <ul>
			<li><a href="http://localhost:8080/HealthManagement/jsp/course/HealthManagement.jsp">首頁</a></li>
			<li><a href="http://localhost:8080/HealthManagement/jsp/membercenter.jsp" >會員管理</a></li>
			<li><a href="http://localhost:8080/HealthManagement/product.html">商城購物</a></li>
			<li><a href="http://localhost:8080/HealthManagement/jsp/fitness/index.jsp">健身成效</a></li>
			<li><a href="http://localhost:8080/HealthManagement/jsp/course/index.jsp" class="active">課程管理</a></li>
			<li><a href="http://localhost:8080/HealthManagement/api/Social/post">社群論壇</a></li>
        </ul>
    </div>
    <br>
	<!-- 查詢所有課程按鈕 -->
	<div align="center">
		<form method="post" action="${pageContext.request.contextPath}/CourseDAO2">
			<input type="hidden" name="action" value="findAll">
			<input type="submit" value="查詢所有課程">
		</form>
	</div>
	<div align="center">
		<% 
		String action = request.getParameter("action");
		if ("findAll".equals(action)) {
			List<Course> courses = (List<Course>) request.getAttribute("courses");
		%>
		<table>
			<tr style="background-color: #E0E0E0">
				<th>課程編號</th>
				<th>課程名稱</th>
				<th>課程描述</th>
				<th>課程日期</th>
				<th>教練編號</th>
				<th>教練姓名</th>
				<th>課程時長</th>
				<th>最大容納人數</th>
			</tr>
			<% if (courses != null && !courses.isEmpty()) {
				for (Course course : courses) { %>
			<tr>
				<td><%= course.getcourse_id() %></td>
				<td><%= course.getcourse_name() %></td>
				<td><%= course.getcourse_description() %></td>
				<td><%= course.getcourse_date() %></td>
				<td><%= course.getcoach_id() %></td>
				<td><%= course.getcoach_name() %></td>
				<td><%= course.getcourse_time() %></td>
				<td><%= course.getmax_capacity() %></td>
			</tr>
			<% } } else { %>
			<tr>
				<td colspan="8">查無課程資訊</td>
			</tr>
			<% } %>
		</table>
		<h3>共<%=(courses != null ? courses.size() : 0)%>筆課程資訊</h3>
		<% } %>
	</div>
	<br>
	<!-- 返回按鈕 -->
	<div align="center">
		<a href="http://localhost:8080/HealthManagement/jsp/course/index.jsp" class="back-button">返回</a>
	</div>
	<br>
	    <div id="footer">
        <p>© 2025 健康管理系統. All Rights Reserved.</p>
    </div>
</body>
</html>
