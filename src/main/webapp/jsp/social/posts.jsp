<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, model.social.SocialPost" %>

<%
    if (request.getAttribute("posts") == null) {
        response.sendRedirect(request.getContextPath() + "/api/Social/post");
        return;
    }

    List<SocialPost> posts = (List<SocialPost>) request.getAttribute("posts");
    int totalPosts = posts.size();
    int postsPerPage = 10;
    int totalPages = (int) Math.ceil((double) totalPosts / postsPerPage);
    
    String pageParam = request.getParameter("page");
    int currentPage = (pageParam != null) ? Integer.parseInt(pageParam) : 1;

    int startIndex = (currentPage - 1) * postsPerPage;
    int endIndex = Math.min(startIndex + postsPerPage, totalPosts);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>社群論壇</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/forum.css">
    <style>
        /* 🔹 Modal 基本樣式 */
        .modal {
            display: none;  
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
            width: 400px;
            z-index: 1000;
        }
        
                /* 🔹 按鈕樣式 */
        button {
            cursor: pointer; /* 🖱️ 鼠標變成手指 */
            border: none;
            padding: 10px;
            border-radius: 5px;
        }

        /* 🔹 遮罩層 */
        .overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 999;
        }

        /* 🔹 按鈕樣式 */
        .modal-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 10px;
        }

        /* 🔹 文章操作按鈕 */
        .post-actions {
            position: absolute;
            top: 10px;
            right: 10px;
            display: flex;
            gap: 10px;
        }

        .post-actions button {
            border: none;
            background: none;
            cursor: pointer;
            color: black;
            font-size: 14px;
        }

        .post-actions button:hover {
            text-decoration: underline;
        }
        
         /* 🔹 讓「主題:」「內容:」對齊左側 */
        .modal-form-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 10px;
        }

        .modal-form-group label {
            font-size: 14px;
            font-weight: bold;
            margin-bottom: 5px; /* 讓標題和輸入框有間距 */
        }
        
               .modal-form-group input,
        .modal-form-group textarea {
            width: 100%;
            padding: 8px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        
        /* 🔹 輸入框樣式 (包含浮水印效果) */
        input[type="text"], textarea {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        /* 🔹 讓浮水印的顏色更淡 */
        input::placeholder, textarea::placeholder {
            color: #aaa;
            font-style: italic;
        }

        /* 🔹 文字區塊 (textarea) 調整大小 */
        textarea {
            height: 100px;
            resize: none;
        }
        
        
        /* 🔹 分頁樣式 */
        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .pagination a, .pagination span {
            padding: 8px 12px;
            margin: 2px;
            text-decoration: none;
            border: 1px solid #ccc;
            border-radius: 5px;
            color: #333;
        }

        .pagination a:hover {
            background-color: #e3e3e3;
        }

        .pagination .active {
            font-weight: bold;
            background-color: #808080;
            color: white;
        }
        
    </style>
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
            <li><a href="index.jsp" class="active">社群論壇</a></li>
        </ul>
    </div>

    <div id="content">
        <h1>社群論壇</h1>

        <div class="buttons-container">
            <button onclick="openInsertModal()">發表文章</button>
            <jsp:include page="search.jsp" />
        </div>

        <hr>

        <ul id="postList">
            <% for (int i = startIndex; i < endIndex; i++) { %>
                <% SocialPost post = posts.get(i); %>
                <li class="post-item" data-id="<%= post.getArticleId() %>">

                    <!-- 🔹 修改與刪除 -->
                    <div class="post-actions">
                        <button onclick="openEditModal('<%= post.getArticleId() %>', '<%= post.getTitle() %>', '<%= post.getContent() %>')">修改</button>
                        <jsp:include page="delete.jsp">
                            <jsp:param name="articleId" value="<%= post.getArticleId() %>" />
                        </jsp:include>
                    </div>

                    <h3><%= post.getTitle() %></h3>
                    <p><%= post.getContent() %></p>

                    <div class="post-meta">
                        <img src="${pageContext.request.contextPath}/images/user.svg" alt="User" width="16px" height="16px"> <%= post.getUserId() %>
                        <img src="${pageContext.request.contextPath}/images/clock.svg" alt="Clock" width="16px" height="16px"> <%= post.getFormattedPublishDate() %>
                    </div>
                </li>
            <% } %>
        </ul>
        
        <!-- ✅ 分頁功能 (獨立出來，不會重複) -->
        <div class="pagination">
            <% if (currentPage > 1) { %>
                <a href="?page=<%= currentPage - 1 %>">上一頁</a>
            <% } %>

            <% for (int i = 1; i <= totalPages; i++) { %>
                <% if (i == currentPage) { %>
                    <span class="active"><%= i %></span>
                <% } else { %>
                    <a href="?page=<%= i %>"><%= i %></a>
                <% } %>
            <% } %>

            <% if (currentPage < totalPages) { %>
                <a href="?page=<%= currentPage + 1 %>">下一頁</a>
            <% } %>
        </div>

	</div>
        <div id="insertModal" class="modal">
            <h2>發表文章</h2>
            <form id="insertForm" action="${pageContext.request.contextPath}/api/Social/post" method="post">
                                <!-- 🔹 主題輸入區塊（標題 + 輸入框） -->
                <div class="modal-form-group">
                    <label for="insertTitle">主題:</label>
                    <input type="text" name="title" id="insertTitle" placeholder="請輸入文章標題" required>
                </div>

                <!-- 🔹 內容輸入區塊（標題 + 內容框獨立一行） -->
                <div class="modal-form-group">
                    <label for="insertContent">內容:</label>
                    <textarea name="content" id="insertContent" placeholder="請輸入文章內容" required></textarea>
                </div>

                <div class="modal-buttons">
                    <button type="submit">提交</button>
                    <button type="button" onclick="closeInsertModal()">取消</button>
                </div>
            </form>
        </div>

        <div id="editModal" class="modal">
            <h2>修改文章</h2>
            <form id="editForm" method="post" action="${pageContext.request.contextPath}/api/Social/update">
                <input type="hidden" name="articleId" id="editArticleId">
                
                <div class="modal-form-group">
                    <label for="editTitle">主題:</label>
                    <input type="text" name="title" id="editTitle" required>
                </div>

                <div class="modal-form-group">
                    <label for="editContent">內容:</label>
                    <textarea name="content" id="editContent" required></textarea>
                </div>

                <div class="modal-buttons">
                    <button type="submit">確認</button>
                    <button type="button" onclick="closeEditModal()">取消</button>
                </div>
            </form>
        </div>

            <hr>
    <div id="footer">
        <p>© 2025 健康管理系統. All Rights Reserved.</p>
    </div>

    <script>
        function openInsertModal() {
            document.getElementById("insertModal").style.display = "block";
        }

        function closeInsertModal() {
            document.getElementById("insertModal").style.display = "none";
        }

        function openEditModal(articleId, title, content) {
            document.getElementById("editArticleId").value = articleId;
            document.getElementById("editTitle").value = title;
            document.getElementById("editContent").value = content;
            document.getElementById("editModal").style.display = "block";
        }

        function closeEditModal() {
            document.getElementById("editModal").style.display = "none";
        }
    </script>

</body>
</html>
