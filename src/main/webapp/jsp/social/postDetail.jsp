<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.social.SocialPost, service.social.SocialService"%>

<%
int articleId = Integer.parseInt(request.getParameter("articleId"));
SocialService socialService = new SocialService();
SocialPost post = socialService.getPostById(articleId);

if (post == null) {
	response.sendRedirect("posts.jsp"); // 如果文章不存在，回到論壇首頁
	return;
}

int prevId = socialService.getPreviousArticleId(articleId);
int nextId = socialService.getNextArticleId(articleId);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=post.getTitle()%></title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/gymstyle.css">
<style>
/* 文章頁面主要容器 */
.container {
	max-width: 800px;
	margin: 40px auto;
	background: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

/* 文章內容區塊，確保文字不會超出容器 */
.article-content {
	line-height: 1.6;
	color: #444;
	text-align: justify;
	padding: 15px;
	background: #f9f9f9;
	border-radius: 5px;
	box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.1);
	word-wrap: break-word; /* ✅ 遇到長單字會換行 */
	overflow-wrap: break-word; /* ✅ 確保所有瀏覽器都支援自動換行 */
	white-space: pre-wrap; /* ✅ 保持原本的換行格式 */
	max-width: 100%; /* ✅ 確保內容不會超出容器 */
}

/* 文章標題 */
.article-title {
	font-size: 2em;
	font-weight: bold;
	color: #777;
	text-align: center;
	margin-bottom: 10px;
}

/* 讓文章內容區塊支援內部定位 */
.article-content {
    position: relative; /* ✅ 讓內部的 post-meta 可以相對於這個區塊定位 */
    max-width: 100%;
    min-height: 5px; /* ✅ 確保文章內容區塊不會太矮 */
}

/* 文章發布資訊 */
.post-meta img {
	width: 16px;
	height: 16px;
	margin-right: 0.5px;
}

/* 分頁 & 返回按鈕 */
.navigation-buttons {
	display: flex;
	justify-content: space-between;
	margin-top: 25px;
	text-decoration: none; /* 移除超連結的底線 */
	padding: 10px 15px; /* 內邊距，使按鈕更易點擊 */
	border-radius: 5px; /* 圓角邊框 */
}

</style>
</head>
<body>

	<jsp:include page="header.jsp" />

	<div class="container">
		<!-- 文章標題 -->
		<h1 class="article-title"><%=post.getTitle()%></h1>
	</div>
<!-- 文章內容 -->
<div class="article-content">
    <p><%= post.getContent().replace("\n", "<br>") %></p>

    <!-- 🔹 發布資訊移到內容區塊內部 -->
    <div class="post-meta">
        <img src="${pageContext.request.contextPath}/images/user.svg" alt="User"> 
        <span class="author">發佈者: <%= post.getUserId() %></span> 
        <img src="${pageContext.request.contextPath}/images/clock.svg" alt="Clock"> 
        <span class="publish-time">發佈時間: <%= post.getFormattedPublishDate() %></span>
    </div>
</div>

		<!-- 返回 & 分頁按鈕 -->
		<div class="navigation-buttons">
			<%
			if (nextId > 0) {
			%>
			<a
				href="${pageContext.request.contextPath}/jsp/social/postDetail.jsp?articleId=<%= nextId %>"
				class="btn next-post">⬅ 上一篇</a>
			<%
			} else {
			%>
			<a class="btn next-post disabled">⬅ 上一篇</a>
			<%
			}
			%>

			<%
			if (prevId > 0) {
			%>
			<a
				href="${pageContext.request.contextPath}/jsp/social/postDetail.jsp?articleId=<%= prevId %>"
				class="btn prev-post">下一篇 ➡</a>
			<%
			} else {
			%>
			<a class="btn prev-post disabled">下一篇 ➡</a>
			<%
			}
			%>

			<a href="${pageContext.request.contextPath}/jsp/social/posts.jsp"
				class="btn back-button">🔙 返回論壇</a>
		</div>



		<div id="footer">
			<p>&copy; 2025 享健你. 讓運動成為習慣，遇見更好的自己。</p>
		</div>
</body>
</html>
