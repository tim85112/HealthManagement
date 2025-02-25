<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style type="text/css">
            /* 返回主畫面的按鈕樣式 */
     .back-button {
            padding: 10px 20px;
            background-color: #459CA0;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            display: block; /* 改為區塊元素，會自動排列在上方內容後 */
            margin-top: 20px; /* 可增加與報錯訊息的間距 */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        .back-button:hover {
            background-color: skyblue;
        }</style>
    <title>Error</title>
</head>
<body>
    <h1>Error</h1>
    <p>${errorMessage}</p>

<button class="back-button" onclick="window.location.href='../../jsp/fitness/index.jsp'">Back To Home</button>
    
        
</body>
</html>
