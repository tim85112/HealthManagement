<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <div id="content">
        <div>
            <ul>
                <li><a href="schedule.jsp">查詢單筆課程</a></li><br>
                <li><a href="allschedule.jsp">查詢所有課程</a></li><br>
                <li><a href="insert.jsp">新增課程資訊</a></li><br>
                <li><a href="delete.jsp">刪除課程資訊</a></li><br>
                <li><a href="updatedata.jsp">修改課程資訊</a></li><br>
            </ul>
        </div>
    </div>

    <div id="footer">
        <p>© 2025 健康管理系統. All Rights Reserved.</p>
    </div>
</body>
</html>