<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
            <li><a href="HealthManagement.jsp">首頁</a></li>
            <li><a href="#">會員管理</a></li>
            <li><a href="#">商城購物</a></li>
            <li><a href="#">健身成效</a></li>
            <li><a href="index.jsp" class="active">課程管理</a></li>
            <li><a href="#">社群論壇</a></li>
        </ul>
    </div>
    	<br>
	<div id="content"  align="center">
		<h2>修改課程資訊</h2>
		<br>
		<form method="post" action="${pageContext.request.contextPath}/CourseDAO2">
			請輸入課程編號 : <input type="text" name="course_id" /> 
			<input type="hidden" name="action" value="updatedata" />
			<input type="submit" value="確定" />
		</form>
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
		<form method="post" action="${pageContext.request.contextPath}/CourseDAO2">
			<input type="hidden" name="action" value="update" />
			<table border="1">
				<tr>
					<td>課程編號：</td>
					<td><input type="text" name="course_id" value="${course.course_id}" required /></td>
				</tr>
				<tr>
					<td>課程名稱：</td>
					<td><input type="text" name="course_name" value="${course.course_name}" required /></td>
				</tr>
				<tr>
					<td>課程描述：</td>
					<td><textarea rows="5" name="course_description" style="overflow: hidden;" required>${course.course_description}</textarea></td>
				</tr>
				<tr>
					<td>課程日期：</td>
					<td><input type="date" name="course_date" value="${course.course_date}" required /></td>
				</tr>
				<tr>
					<td>教練編號：</td>
					<td><input type="text" name="coach_id" value="${course.coach_id}" required /></td>
				</tr>
				<tr>
					<td>教練名字：</td>
					<td><input type="text" name="coach_name" value="${course.coach_name}" required /></td>
				</tr>
				<tr>
					<td>課程時長：</td>
					<td><input type="text" name="course_time" value="${course.course_time}" required /></td>
				</tr>
				<tr>
					<td>課程人數：</td>
					<td><input type="text" name="max_capacity" value="${course.max_capacity}" required /></td>
				</tr>
			</table>
			<br> 
			<input type="submit" value="確定" /><br>
		</form>
		<br>
		<a href="http://localhost:8080/HealthManagement/jsp/course/index.jsp" class="back-button">返回</a>
	</div>
    <div id="footer">
        <p>© 2025 健康管理系統. All Rights Reserved.</p>
    </div>
</body>
</html>