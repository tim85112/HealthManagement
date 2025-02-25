<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, model.social.SocialPost" %>

<%
    List<SocialPost> searchResults = (List<SocialPost>) request.getAttribute("searchResults");
    String errorMessage = (String) request.getAttribute("errorMessage");
    boolean searched = (searchResults != null || errorMessage != null); // 判斷是否有進行過查詢
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>搜尋文章</title>
    <jsp:include page="header.jsp" />
    <style type="text/css">
    .search-button {
    display: inline-block;
    background-color: #f0f0f0; /* ⚪ 修改這裡的背景顏色 */
    color: #333;
    padding: 8px 12px;
    border: 1px solid #ccc;
    border-radius: 5px;
    text-decoration: none;
    font-size: 14px;
    cursor: pointer;
}

.search-button:hover {
    background-color: #e3e3e3; /* ⚫ 懸停時的顏色 */
}</style>
</head>
<body>

    <h1>搜尋文章</h1>

    <!-- 搜尋表單 -->
    <form action="${pageContext.request.contextPath}/api/Social/search" method="get">
        <label>關鍵字：</label>
        <input type="text" name="searchQuery" required>
        <button type="submit" class="search-button">查詢</button>
        <a href="${pageContext.request.contextPath}/api/Social/post" class="search-button">回到論壇</a> <!-- 這裡要指向 Controller，而不是 posts.jsp -->
    </form>

    <hr>

    <!-- 顯示錯誤訊息 -->
    <% if (errorMessage != null) { %>
        <p style="color: red;"><%= errorMessage %></p>
    <% } %>

    <!-- 只有在用戶點擊查詢後，且 `searchResults` 為空時，才顯示 `查無相關文章。` -->
    <% if (searched && (searchResults == null || searchResults.isEmpty())) { %>
        <p>  </p>
    <% } %>

    <!-- 顯示查詢結果 -->
    <% if (searchResults != null && !searchResults.isEmpty()) { %>
        <ul>
            <% for (SocialPost post : searchResults) { %>
                <li>
                    <h3><%= post.getTitle() %></h3>
                    <p><%= post.getContent() %></p>
                    <div class="post-meta">
                        <img src="${pageContext.request.contextPath}/images/user.svg" alt="User" width="16px" height="16px"> <%= post.getUserId() %>
                        <img src="${pageContext.request.contextPath}/images/clock.svg" alt="Clock" width="16px" height="16px"> <%= post.getFormattedPublishDate() %>
                    </div>
                </li>
            <% } %>
        </ul>
    <% } %>

</body>
</html>
