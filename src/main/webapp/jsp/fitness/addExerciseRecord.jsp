<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>享健你，遇見更好的自己．</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/gymstyle.css">
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
			<li><a
				href="http://localhost:8080/HealthManagement/jsp/course/HealthManagement.jsp">首頁</a></li>
			<li><a
				href="http://localhost:8080/HealthManagement/jsp/membercenter.jsp"
				class="active">會員管理</a></li>
			<li><a href="#">商城購物</a></li>
			<li><a
				href="http://localhost:8080/HealthManagement/jsp/fitness/index.jsp">健身成效</a></li>
			<li><a
				href="http://localhost:8080/HealthManagement/jsp/course/index.jsp">課程管理</a></li>
			<li><a
				href="http://localhost:8080/HealthManagement/api/Social/post">社群論壇</a></li>
			<!-- ✅ 修正網址 -->
		</ul>
	</div>
	<br>
<body>
	<div id="content" align="center">
		<h1>新增運動單筆紀錄</h1>

		<!-- 用戶輸入 User ID 並添加運動紀錄 -->
		<form action="../../api/fitness/progress" method="post">
			<input type="hidden" name="action" value="add">
			<table border="1" id="">
				<tr>
					<td>用戶 ID：</td>
					<td><input type="text" name="userId" required
						placeholder="Enter User ID"></td>
				</tr>
				<tr>
					<td>運動類型：</td>
					<td><select name="exerciseType" required>
							<option value="瑜伽" selected>瑜伽 (Yoga)</option>
							<option value="重訓">重訓 (Weight Training)</option>
							<option value="有氧">有氧 (Cardio)</option>
					</select></td>
				</tr>
				<tr>
					<td>運動時長 (分鐘)：</td>
					<td><input type="number" name="exerciseDuration" required
						placeholder="Enter Duration" value="20"></td>
				</tr>
				<tr>
					<td>運動日期：</td>
					<td><input type="date" name="exerciseDate" required
						id="exerciseDate"></td>
				</tr>
				<tr>
					 <button type="submit">Add Record</button>
				</tr>
			</table>
		</form>


		<script>
			// 獲取當天日期
			const today = new Date().toISOString().split('T')[0]; // 轉換為 'YYYY-MM-DD' 格式
			document.getElementById('exerciseDate').value = today; // 設置為 input 的預設值
		</script>

	<!-- 返回主畫面的按鈕 -->
 <a href="http://localhost:8080/HealthManagement/jsp/fitness/index.jsp" class="back-button">返回</a>
</div>

	<div id="footer">
		<p>&copy; 2025 享健你. 讓運動成為習慣，遇見更好的自己。</p></div>
</body>
</html>
