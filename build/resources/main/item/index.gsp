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

<div class="index-page">

    %{-- Search Data --}%
    <div class="search-data">
        <g:form controller="item" action="search">
            <input type="text" class="search-item-field" name="keyword" placeholder="Search Data by Category" />
            <button type="submit" class="btn btn-secondary">Search</button>
        </g:form>
    </div>

    <div class="add-btn-item">
%{--        <a class="btn btn-success btn-sm" id="btn-add-one-data" href="${createLink(action: 'insert')}">Add One Data</a>--}%
        <a class="btn btn-success btn-sm" id="btn-add-one-data" data-toggle="modal" data-target="#addDataModal">Add One Data</a>
        <a class="btn btn-success btn-sm" id="btn-add-multiple-data" href="${createLink(action: 'create')}">Add Multiple Data</a>
    </div>

    <div class="row clearfix">

        <div class="col-lg-12">
            <div class="card">
                <div class="header">
                    <h2>Table of List Items</h2>
                </div>
                <div class="body">
                    <div class="table-responsive">
                        <table class="table table-hover mb-0 c_list">
                            <thead>
                            <tr>
                                <th>Name</th>
                                <th>Desccription</th>
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
                                    <td class="action-buttons">
                                        <button type="button" class="btn btn-info" data-toggle="modal" onclick="openInputModal('${item.id}','${item.itemName}', '${item.description}')" data-target="#insertTransactionModal">
                                            IN/OUT
                                        </button>
                                    </td>
                                    <td class="action-buttons">
                                        <button type="button" class="btn btn-info" title="Edit" data-toggle="modal" onclick="editDataItem('${item.id}','${item.itemName}', '${item.description}', '${item.quantity}')" data-target="#editDataModal"><i class="fa fa-edit"></i></button>
                                        <button type="button" class="btn btn-danger js-sweetalert" data-toggle="modal" data-target="#deleteModal" onclick="deleteDataItem('${item.id}','${item.itemName}')"><i class="fa fa-trash-o"></i></button>

                                    </td>
                                </tr>
                            </g:each>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

%{-- MODAL CONFIRM DELETE--}%
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
        <g:form controller="item" action="deleteConfirmed">
            <div class="modal-header">
                <h5 class="modal-title">Are you sure you want to delete <span id="deleteItemName"></span> ?</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body-delete">
                You will not be able to recover this field again!
                <input type="hidden" id="hapusItemId" name="hapusItemId" value="">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-danger" >Yes, delete it!</button>
            </div>
        </g:form>
        </div>
    </div>
</div>

%{-- MODAL ADD ONE DATA --}%
<div class="modal fade" id="addDataModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="addItemModal">Edit Data Item</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <g:form controller="item" action="saveOneItem">
                    <div class="form-group">
                        <label for="categoryName">Category</label>
                        <g:select class="form-control" name="categoryName" from="${['Chair', 'Table', 'Cupboard']}" required="true"/><br>

                    </div>
                    <div class="form-group">
                        <label for="itemNameAdd">Item Name</label>
                        <input type="text" class="form-control" id="itemNameAdd" name="itemName">
                    </div>
                    <div class="form-group">
                        <label for="itemDescriptionAdd">Description</label>
                        <textarea class="form-control" id="itemDescriptionAdd" name="itemDescription" rows="4"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="itemQuantityAdd">Quantity</label>
                        <input type="number" class="form-control" id="itemQuantityAdd" name="itemQuantity" min="1" >
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-success">Save changes</button>
                    </div>
                </g:form>
            </div>

        </div>
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
                            <div class="insert-transaction">Item Name : &nbsp;<p id="inputItemName"></p></div>
                            <div class="insert-transaction">Description : &nbsp;<p id="inputItemDescription"></p></div>

                            <label>Transaction Type</label>
                            <g:select class="form-control" name="transactionType" from="${['IN', 'OUT']}" required="true"/><br>

                            <div class="form-group">
                                <label for="inputQuantity">Quantity</label>
                                <input type="number" class="form-control" id="inputQuantity" name="transactionQuantity" min="1">
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-success">Submit</button>
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
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-success" id="submitDataEdit">Save changes</button>
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

    function deleteDataItem(itemId, itemName){
        $('#deleteItemName').text(itemName)
        $('#hapusItemId').val(parseInt(itemId))
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