<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exercise Records</title>
    <style>
        /* 輸入框和表單樣式 */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            margin-top: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        td form {
            display: inline;
        }

        /* 按鈕樣式（Update 和 Delete 按鈕） */
        .update,.delete{
            padding: 5px 10px;
            margin: 0 5px;
            background-color: #4585A0;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        
       .update:hover{
            background-color: #6BCFF9 ;
        }
        
       .delete:hover {
            background-color: #E1AFBE;
        }

        /* 顯示錯誤訊息 */
        .error-message {
            color: red;
            padding: 10px;
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
            border-radius: 5px;
            margin: 10px 0;
        }

        .alert-success {
            color: #3c763d;
            background-color: #dff0d8;
            border: 1px solid #d6e9c6;
            border-radius: 5px;
            padding: 10px;
            margin: 10px 0;
        }

        .record-count {
            text-align: center;
            margin-top: 20px;
            font-size: 1.2em;
            color: #333;
        }

        /* 返回主畫面的按鈕樣式 */
        .back-button {
            padding: 10px 20px;
            background-color: #459CA0;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            position: fixed;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        .back-button:hover {
            background-color: skyblue;
        }
    </style>
</head>
<body>
    <h1>Exercise Records</h1>

    <!-- 顯示錯誤訊息 -->
    <c:if test="${not empty errorMessage}">
        <div class="error-message">
            <strong>Error:</strong> ${errorMessage}
        </div>
    </c:if>

    <!-- 顯示成功訊息 -->
    <c:if test="${not empty successMessage}">
        <div class="alert-success">
            <c:choose>
                <c:when test="${successMessage == 'Record Deleted Successfully'}">
                    <strong>Success:</strong> Record Deleted Successfully
                </c:when>
                <c:otherwise>
                    ${successMessage}
                </c:otherwise>
            </c:choose>
        </div>
    </c:if>

    <!-- 顯示運動紀錄 -->
    <c:if test="${not empty records}">
        <table>
            <thead>
                <tr>
                    <th>Exercise Type</th>
                    <th>Duration</th>
                    <th>Calories</th>
                    <th>Date</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="record" items="${records}">
                    <tr>
                        <td>${record.exerciseType}</td>
                        <td>${record.exerciseDuration}</td>
                        <td>${record.caloriesBurned}</td>
                        <td>${record.exerciseDate}</td>
                        <td>
                            <!-- 更新按鈕，會跳轉到更新頁面 -->
                            <a href="../../api/fitness/progress?action=update&recordId=${record.recordId}&userId=${record.userId}">
                                <input type="button" value="Update" class="update">
                            </a>

                            <!-- 刪除表單 -->
                            <form action="../../api/fitness/progress" method="post" style="display:inline;">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="recordId" value="${record.recordId}">
                                <input type="hidden" name="userId" value="${record.userId}">
                                <input type="submit" value="Delete" class="delete">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- 顯示資料總數 -->
        <div class="record-count">
            <p>Total Records: ${fn:length(records)}</p>
        </div>
    </c:if>

    <c:if test="${empty records}">
        <p>No records found for the given User ID.</p>
    </c:if>

    <!-- 返回主畫面的按鈕 -->
    <button class="back-button" onclick="window.location.href='../../jsp/fitness/index.jsp'">Back To Home</button>
</body>
</html>
