<%--
  Created by IntelliJ IDEA.
  User: rahmayh
  Date: 8/11/23
  Time: 4:40 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main" />
    <title></title>
</head>

<body>

<h1>Transaction History</h1>

<div class="body">
    <div class="table-responsive">
        <table class="table table-hover mb-0 c_list">
            <thead>
            <tr>
                <th>Transaction Type</th>
                <th>Quantity</th>
                <th>Date</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${transactions}" var="transaction">
                <tr>
                    <td>${transaction.transactionType}</td>
                    <td>${transaction.quantity}</td>
                    <td>${transaction.transactionDate}</td>
                </tr>
            </g:each>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>