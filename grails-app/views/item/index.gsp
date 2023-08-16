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

    <a class="add-button" href="${createLink(action: 'create')}">Add Multiple Data</a>
    <a class="add-button" href="${createLink(action: 'insert')}">Add One Data</a>

    <table>
        <thead>
        <tr>
            <th>Item Name</th>
            <th>Description</th>
            <th>Quantity</th>
            <th>Transaksi</th>
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
                    <button type="button" class="btn btn-primary" data-toggle="modal" onclick="openInputModal('${item.id}','${item.itemName}', '${item.description}')" data-target="#insertTransactionModal">
                        IN/OUT
                    </button>
                </td>
                <td class="action-buttons">
                    %{--                        <a class="edit-button" href="${createLink(action: 'edit', id: item.id)}">Update</a>--}%
                    <button type="button" class="btn btn-warning" data-toggle="modal" onclick="editDataItem('${item.id}','${item.itemName}', '${item.description}', '${item.quantity}')" data-target="#editDataModal">
                        Update
                    </button>
                    <form method="post" action="${createLink(action: 'delete', id: item.id)}">
                        <button class="btn btn-danger btn sweet-confirm" type="submit">Delete</button>
                    </form>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>

    <!-- /# card -->
</div>
</div>

%{-- MODAL INSERT TRANSACTION --}%
<div class="modal fade" id="insertTransactionModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="inputItemModal">Insert Transaction</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <g:form controller="transaction" action="addTransaction">

                    <div class="card-body">
                        <div class="basic-form">

                            <input type="hidden" id="inputItemId" name="inputItemId" value="">
                            <p id="inputItemName"></p>
                            <p id="inputItemDescription"></p>
                            <g:select class="form-control" name="transactionType" from="${['IN', 'OUT']}" required="true"/><br>

                            <div class="form-group">
                                <label for="inputQuantity">Quantity</label>
                                <input type="number" class="form-control" id="inputQuantity" name="transactionQuantity" min="1">
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </g:form>
            </div>

        </div>
    </div>
</div>

%{-- MODAL EDIT DATA --}%
<div class="modal fade" id="editDataModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="editItemModal">Edit Data Item</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <g:form controller="item" action="update">
                    <div class="form-group">
                        <label for="itemName">Item Name</label>
                        <input type="text" class="form-control" id="itemName" name="itemName">
                    </div>
                    <div class="form-group">
                        <label for="itemDescription">Description</label>
                        <textarea class="form-control" id="itemDescription" name="itemDescription" rows="4" required></textarea>

                    </div>
                    <input type="hidden" id="itemId" name="id" value="">

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary" id="submitDataEdit">Save changes</button>
                    </div>
                </g:form>
            </div>

        </div>
    </div>
</div>

<script>
    function openInputModal(itemId, itemName, description) {
        $('#inputItemId').val(parseInt(itemId));
        $('#inputItemName').text(itemName);
        $('#inputItemDescription').text(description);
        $('#inputModal').modal('show');
    }

    function editDataItem(itemId, itemName, itemDescription, itemQuantity) {
        $('#itemId').val(parseInt(itemId));
        $('#itemName').val(itemName);
        $('#itemDescription').val(itemDescription);
        $('#itemQuantity').val(itemQuantity);
        $('#editDataModal').modal('show');
    }

    $(document).ready(function() {
        $('#submitDataEdit').on('click', function() {
            console.log('Button Submit edit clicked');
        });
    });

    // function editDataItem(itemId, itemName, itemDescription, itemQuantity){
    //     $('#itemId').val(itemId)
    //     $('#itemName').val(itemName)
    //     $('#itemDescription').val(itemDescription)
    //     $('#itemQuantity').val(itemQuantity)
    //     $('#editDataModal').modal('show')
    // }
</script>

</body>
</html>