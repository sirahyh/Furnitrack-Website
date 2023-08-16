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

<table>
    <thead>
    <tr>
%{--        <th>Item Name</th>--}%
        <th>Item Name</th>
        <th>Transaction Type</th>
        <th>Quantity</th>
        <th>Transaction Date</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${transactions}" var="transaction">
        <tr>
            <td>${transaction[0]}</td> <!-- Transaction Type -->
            <td>${transaction[1]}</td> <!-- Transaction Date -->
            <td>${transaction[2]}</td> <!-- Quantity -->
            <td>${transaction[3]}</td> <!-- Item Name -->
        </tr>
    </g:each>
%{--    <g:each in="${transactions}" var="transaction">--}%
%{--        <tr>--}%
%{--            <td>${transaction.transactionType}</td>--}%
%{--            <td>${transaction.quantity}</td>--}%
%{--            <td>${transaction.transactionDate}</td>--}%

%{--        </tr>--}%
%{--    </g:each>--}%
    </tbody>
</table>

</body>
</html>