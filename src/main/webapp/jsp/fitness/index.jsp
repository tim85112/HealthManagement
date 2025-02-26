<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<div align="center">
    <h1>運動數據記錄</h1>

    <!-- 新增運動紀錄的按鈕 -->
    <form action=../../jsp/fitness/addExerciseRecord.jsp method="get">
        <button type="submit">新增單筆運動紀錄</button>
    </form>

    <!-- 查詢運動紀錄 -->
    <form action=../../jsp/fitness/findUserRecords.jsp method="get">
        <button type="submit">以ID查詢用戶紀錄</button>
    </form>
    
    <!-- 查詢所有用戶運動紀錄 -->
    <form action=../../api/fitness/progress method="get">
        <button type="submit" name="action" value="all">所有用戶紀錄</button>
    </form>
    </div>
     <div id="footer">
        <p>&copy; 2025 享健你. 讓運動成為習慣，遇見更好的自己。</p>
    </div>
</body>
</html>
