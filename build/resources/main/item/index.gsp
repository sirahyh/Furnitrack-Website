<%--
  Created by IntelliJ IDEA.
  User: rahmayh
  Date: 8/4/23
  Time: 3:43 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main" />
    <title>Current Projects</title>

</head>

<body>

    <div class="index-field">
        <h1>Data Items</h1>

        <a class="add-button" href="${createLink(action: 'create')}">Add Data</a>

        <table>
            <thead>
            <tr>
                <th>Item Name</th>
                <th>Description</th>
                <th>Quantity</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${items}" var="item">
                <tr>
                    <td>${item.itemName}</td>
                    <td>${item.description}</td>
                    <td>${item.quantity}</td>
                    <td class="action-buttons">
                        <a class="edit-button" href="${createLink(action: 'edit', id: item.id)}">Update</a>
                        <form method="post" action="${createLink(action: 'delete', id: item.id)}">
                            <button class="btn btn-warning btn sweet-confirm" type="submit">Delete</button>
                        </form>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="col-lg-3">
            <div class="card">
                <div class="card-title">
                    <h4 class="coba-style">Sweet Confirm</h4>
                    <div class="card-title-right-icon">
                        <ul>

                        </ul>
                    </div>
                </div>
                <div class="sweetalert m-t-15">

                    <button class="btn btn-warning btn sweet-confirm">Sweet Confirm</button>

                </div>
            </div>
            <!-- /# card -->
        </div>
    </div>


</body>
</html>