<%--
  Created by IntelliJ IDEA.
  User: rahmayh
  Date: 8/11/23
  Time: 4:40 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>

<h1>Transaction History</h1>

<table>
    <thead>
    <tr>
        <th>Item Name</th>
        <th>Transaction Type</th>
        <th>Quantity</th>
        <th>Date</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${items}" var="item">
        <tr>
            <td>${item.itemName}</td>
            <td>${item.description}</td>
            <td>${item.quantity}</td>
            <td class="action-buttons">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#inputModal" data-id="${item.id}">
                    IN
                </button>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#outputModal">
                    OUT
                </button>
            </td>
            <td class="action-buttons">
                %{--                        <a class="edit-button" href="${createLink(action: 'edit', id: item.id)}">Update</a>--}%
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#editDataModal">
                    Update
                </button>
                <form method="post" action="${createLink(action: 'delete', id: item.id)}">
                    <button class="btn btn-warning btn sweet-confirm" type="submit">Delete</button>
                </form>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>

</body>
</html>