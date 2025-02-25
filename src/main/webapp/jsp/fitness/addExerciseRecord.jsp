<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Exercise Record</title>
    <style>
        /* 表單樣式 */
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

        form {
            margin: 20px;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin: 5px 0;
        }

        input, select {
            width: 100%;
            padding: 8px;
            margin: 8px 0;
            box-sizing: border-box;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        button {
            padding: 10px 20px;
            background-color: #6D91A0;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

    <h1>Add New Exercise Record</h1>

    <!-- 用戶輸入 User ID 並添加運動紀錄 -->
    <form action="../../api/fitness/progress" method="post">
        <input type="hidden" name="action" value="add">

        <label for="userId">User ID:</label>
        <input type="number" name="userId" required placeholder="Enter User ID">

        <label for="exerciseType">Exercise Type:</label>
        <select name="exerciseType" required>
            <option value="瑜伽" selected>瑜伽 (Yoga)</option>
            <option value="重訓">重訓 (Weight Training)</option>
            <option value="有氧">有氧 (Cardio)</option>
        </select>

        <label for="exerciseDuration">Duration (minutes):</label>
        <input type="number" name="exerciseDuration" required placeholder="Enter Duration" value="20">

        <label for="exerciseDate">Exercise Date:</label>
        <input type="date" name="exerciseDate" required id="exerciseDate">

        <button type="submit">Add Record</button>
    </form>

    <script>
        // 獲取當天日期
        const today = new Date().toISOString().split('T')[0]; // 轉換為 'YYYY-MM-DD' 格式
        document.getElementById('exerciseDate').value = today; // 設置為 input 的預設值
    </script>

</body>
</html>
