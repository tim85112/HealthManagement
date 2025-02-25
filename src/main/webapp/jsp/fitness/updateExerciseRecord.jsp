<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Exercise Record</title>
    <style>
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

        .form-container {
            width: 50%;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .form-container label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }

        .form-container input[type="text"], .form-container input[type="number"], .form-container input[type="date"] {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        .form-container input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #0056b3;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .form-container input[type="submit"]:hover {
            background-color: lightblue;
        }

        .back-link {
            display: block;
            margin-top: 20px;
            text-align: center;
        }

        .error-message {
            color: red;
            padding: 10px;
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
            border-radius: 5px;
            margin: 10px 0;
        }
    </style>
</head>
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
        <a class="back-link" href="../../api/fitness/progress?userId=${record.userId}">Back to Records</a>
    </div>

</body>
</html>
