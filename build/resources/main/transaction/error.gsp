<%--
  Created by IntelliJ IDEA.
  User: rahmayh
  Date: 8/21/23
  Time: 9:10 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <style>
    body {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        background-color: #f8f9fa;
    }
    .error-container {
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        padding: 20px;
        text-align: center;
    }
    .error-message {
        font-size: 18px;
        font-weight: bold;
        margin-bottom: 20px;
    }
    .ok-button {
        background-color: #17a2b8;
        color: #fff;
        border: none;
        padding: 10px 20px;
        border-radius: 4px;
        cursor: pointer;
        text-decoration: none;
    }
    </style>
</head>

<body>
<div class="error-container">
    <p class="error-message">${message}</p>
    <a href="${g.createLink(controller: 'item', action: 'index')}" class="ok-button">OK</a>
</div>
</body>
</html>