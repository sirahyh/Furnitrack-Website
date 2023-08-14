<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <title>Transaction Input</title>
</head>
<body>
<div class="form-title">
    <h1>Transaction</h1>
</div>

<g:form controller="transaction" action="addTransactionData">
    <div class="row">
        <div class="col-lg-6">
            <div class="card">
                <div class="card-title">
                    <h4></h4>

                </div>

                <div class="card-body">
                    <div class="basic-form">

                        <p class="item-name-of-transaction">${items.itemName}</p>
                        <p class="description-of-transaction">${items.description}</p>
                        <label for="transactionType">Category</label>
                        <g:select class="form-control" name="transactionType" from="${['In', 'Out']}" required="true"/><br>

                        <div class="form-group">
                            <label for="itemQuantity">Quantity</label>
                            <input type="number" class="form-control" id="itemQuantity" name="itemQuantity" min="1" >
                        </div>

                    </div>
                </div>
            </div>

            <input type="submit" class="btn btn-default" value="Submit">

        </div>

    </div>
</g:form>

</body>
</html>
