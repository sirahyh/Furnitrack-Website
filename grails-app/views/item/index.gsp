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

<div class="card">
    <div class="header">
        <h2>LIST ITEMS</h2>
    </div>
    <a class="btn btn-success btn-sm" href="${createLink(action: 'create')}">Add Data</a>
    <div class="body">
        <div class="table-responsive">
            <table class="table table-hover mb-0 c_list">
                <thead>
                <tr>
                    <th>Item Name</th>
                    <th>Description</th>
                    <th>Quantity</th>
                    <th>Transaction</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                    <g:each in="${items}" var="item">
                        <tr>
                            <td>${item.itemName}</td>
                            <td>${item.description}</td>
                            <td>${item.quantity}</td>
                            <td>
                                <a class="btn btn-success" href="${createLink(action: 'inout', id: item.id)}">IN/OUT</a>
                            </td>
                            <td>
                                <a class="btn btn-warning" href="${createLink(action: 'edit', id: item.id)}">Update</a>
                                <a class="btn btn-danger" href="${createLink(action: 'delete', id: item.id)}">Delete</a>
                            </td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
        </div>
    </div>
</div>

%{-- Table Lama --}%
%{--    <div class="index-field">--}%
%{--        <h1>Data Items</h1>--}%

%{--        <a class="add-button" href="${createLink(action: 'create')}">Add Data</a>--}%

%{--        <table>--}%
%{--            <thead>--}%
%{--            <tr>--}%
%{--                <th>Item Name</th>--}%
%{--                <th>Description</th>--}%
%{--                <th>Quantity</th>--}%
%{--                <th>Transaksi</th>--}%
%{--                <th>Actions</th>--}%
%{--            </tr>--}%
%{--            </thead>--}%
%{--            <tbody>--}%
%{--            <g:each in="${items}" var="item">--}%
%{--                <tr>--}%
%{--                    <td>${item.itemName}</td>--}%
%{--                    <td>${item.description}</td>--}%
%{--                    <td>${item.quantity}</td>--}%
%{--                    <td class="action-buttons">--}%
%{--                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#inputModal" data-id="${item.id}">--}%
%{--                            IN--}%
%{--                        </button>--}%
%{--                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#outputModal">--}%
%{--                            OUT--}%
%{--                        </button>--}%
%{--                    </td>--}%
%{--                    <td class="action-buttons">--}%
%{--                        <a class="edit-button" href="${createLink(action: 'edit', id: item.id)}">Update</a>--}%
%{--                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#editDataModal">--}%
%{--                            Update--}%
%{--                        </button>--}%
%{--                        <form method="post" action="${createLink(action: 'delete', id: item.id)}">--}%
%{--                            <button class="btn btn-warning btn sweet-confirm" type="submit">Delete</button>--}%
%{--                        </form>--}%
%{--                    </td>--}%
%{--                </tr>--}%
%{--            </g:each>--}%
%{--            </tbody>--}%
%{--        </table>--}%

%{--            <!-- /# card -->--}%
%{--        </div>--}%
%{--    </div>--}%

%{-- MODAL INPUT DATA --}%
<div class="modal fade" id="inputModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="inputItemModal">Import Item Stock</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <g:form controller="item" action="update" params="[id: items.id]">

                    <div class="card-body">
                        <div class="basic-form">

                            <p>${items.itemName}</p>
                            <p>${items.description}</p>
                            <div class="form-group">
                                <label for="inputQuantity">Quantity</label>
                                <input type="number" class="form-control" id="inputQuantity" name="itemQuantity" min="1" value="${items.quantity}" >
                            </div>
                        </div>
                    </div>

                </g:form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>

%{-- MODAL EDIT DATA--}%
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
                    <div class="form-group">
                        <label for="itemQuantity">Quantity</label>
                        <input type="number" class="form-control" id="itemQuantity" name="itemQuantity" min="1">
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

%{-- MODAL OUTPUT DATA --}%
<div class="modal fade" id="outputModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="outputItemModal">Output Item Stock</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <g:form controller="item" action="update" params="[id: items.id]">

                    <div class="card-body">
                        <div class="basic-form">

                            <p>${items.itemName}</p>
                            <p>${items.description}</p>
                            <div class="form-group">
                                <label for="outputQuantity">Quantity</label>
                                <input type="number" class="form-control" id="outputQuantity" name="itemQuantity" min="1" value="${items.quantity}" >
                            </div>
                        </div>
                    </div>

                </g:form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>

<script>
    function openInputModal(itemName, description) {
        $('#inputItemName').text(itemName);
        $('#inputItemDescription').text(description);
        $('#inputModal').modal('show');
    }

    function openOutputModal(itemName, description) {
        $('#outputItemName').text(itemName);
        $('#outputItemDescription').text(description);
        $('#outputModal').modal('show');
    }

    function editDataItem(itemId, itemName, itemDescription, itemQuantity) {
        $('#itemId').val(parseInt(itemId));
        $('#itemName').val(itemName);
        $('#itemDescription').val(itemDescription);
        $('#itemQuantity').val(itemQuantity);
        $('#editDataModal').modal('show');
    }

    $(document).ready(function() {
        $('#btn-update').on('click', function() {
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


%{-- MODAL EDIT DATA --}%
%{--<div class="modal fade" id="editDataModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">--}%
%{--    <div class="modal-dialog" role="document">--}%
%{--        <div class="modal-content">--}%
%{--            <div class="modal-header">--}%
%{--                <h4 class="modal-title" id="editItemModal">Edit Data Item</h4>--}%
%{--                <button type="button" class="close" data-dismiss="modal" aria-label="Close">--}%
%{--                    <span aria-hidden="true">&times;</span>--}%
%{--                </button>--}%
%{--            </div>--}%
%{--            <div class="modal-body">--}%
%{--                <g:form controller="item" action="update" params="[id: items.id]">--}%

%{--                    <form>--}%
%{--                        <div class="form-group">--}%
%{--                            <label for="itemName">Item Name</label>--}%
%{--                            <input type="text" class="form-control" id="itemName" name="itemName" value="${items.itemName}">--}%
%{--                        </div>--}%
%{--                        <div class="form-group">--}%
%{--                            <label for="itemDescription">Description</label>--}%
%{--                            <textarea class="form-control" id="itemDescription" name="itemDescription" rows="4" required>${items.description}</textarea><br>--}%

%{--                        </div>--}%
%{--                        <div class="form-group">--}%
%{--                            <label for="itemQuantity">Quantity</label>--}%
%{--                            <input type="number" class="form-control" id="itemQuantity" name="itemQuantity" min="1" value="${items.quantity}" >--}%
%{--                        </div>--}%
%{--                    </form>--}%
%{--                </g:form>--}%
%{--            </div>--}%
%{--            <div class="modal-footer">--}%
%{--                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>--}%
%{--                <button type="button" class="btn btn-primary">Save changes</button>--}%
%{--            </div>--}%
%{--        </div>--}%
%{--    </div>--}%
%{--</div>--}%

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel">Modal Title</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!-- Your modal content goes here -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>


</body>
</html>