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
            background-color: #45a086;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: lightgreen;
        }
    </style>
</head>
<body>
    <h1>Exercise Records</h1>

    <!-- 新增運動紀錄的按鈕 -->
    <form action=../../jsp/fitness/addExerciseRecord.jsp method="get">
        <button type="submit">Add Exercise Record</button>
    </form>

    <!-- 查詢運動紀錄 -->
    <form action=../../api/fitness/progress method="get">
        <label for="userId">User ID:</label>
        <input type="number" name="userId" required placeholder="Enter User ID">
        <button type="submit">Search</button>
    </form>
</body>
</html>
