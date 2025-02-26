<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>享健你，遇見更好的自己．</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/gymstyle.css">
<style>

</style>
</head>
<body>
    <div id="header">
        <h1>享健你，遇見更好的自己．</h1>
        <h2>你，今天健了嗎？</h2>
    </div>

    <!-- ✅ 導覽列 -->
    <div id="navigation">
		<ul>
			<li><a href="http://localhost:8080/HealthManagement/jsp/course/HealthManagement.jsp">首頁</a></li>
			<li><a href="http://localhost:8080/HealthManagement/jsp/membercenter.jsp" class="active">會員管理</a></li>
			<li><a href="#">商城購物</a></li>
			<li><a href="http://localhost:8080/HealthManagement/jsp/fitness/index.jsp">健身成效</a></li>
			<li><a href="http://localhost:8080/HealthManagement/jsp/course/index.jsp">課程管理</a></li>
            <li><a href="http://localhost:8080/HealthManagement/api/Social/post">社群論壇</a></li> <!-- ✅ 修正網址 -->
		</ul>
    </div>
	<br>
<body>

    <h1>Update Exercise Record</h1>

    <div class="form-container">
        <form action="../../api/fitness/progress" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="recordId" value="${record.recordId}">
            <input type="hidden" name="userId" value="${record.userId}">
            
            <label for="exerciseType">Exercise Type:</label>
            <input type="text" id="exerciseType" name="exerciseType" value="${record.exerciseType}" required>
            
            <label for="exerciseDuration">Duration (minutes):</label>
            <input type="number" id="exerciseDuration" name="exerciseDuration" value="${record.exerciseDuration}" required min="1">
            
            <label for="exerciseDate">Exercise Date:</label>
            <input type="date" id="exerciseDate" name="exerciseDate" value="${record.exerciseDate}" required>
            
            <input type="submit" value="Update">
        </form>

        <!-- 返回到紀錄頁面 -->
        <a class="back-link" href="../../api/fitness/progress?userId=${record.userId}">回到運動紀錄首頁</a>
    </div>
     <div id="footer">
        <p>&copy; 2025 享健你. 讓運動成為習慣，遇見更好的自己。</p>
</body>
</html>
