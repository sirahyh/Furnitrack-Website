<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'item.label', default: 'Item')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
    <h1>Edit Item</h1>
    <g:form controller="item" action="update" params="[id: items.id]">
        <div class="row">
            <div class="col-lg-6">
                <div class="card">
                    <div class="card-title">
                        <h4></h4>

                    </div>

                    <div class="card-body">
                        <div class="basic-form">
                            <form>
                                <div class="form-group">
                                    <label for="itemName">Item Name</label>
                                    <input type="text" class="form-control" id="itemName" name="itemName" value="${items.itemName}">
                                </div>
                                <div class="form-group">
                                    <label for="itemDescription">Description</label>
                                    <textarea class="form-control" id="itemDescription" name="itemDescription" rows="4" required>${items.description}</textarea><br>

                                </div>
                                <div class="form-group">
                                    <label for="itemQuantity">Quantity</label>
                                    <input type="number" class="form-control" id="itemQuantity" name="itemQuantity" min="1" value="${items.quantity}" >
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <input type="submit" class="btn btn-default" value="Update">

            </div>

        </div>
    </g:form>

    </body>
</html>
