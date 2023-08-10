<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
         <title>Create New Item</title>


    </head>
    <body>
    <h1>Create New Item</h1>

    <g:form controller="item" action="save">
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
                                    <label for="categoryName">Category</label>
                                    <g:select class="form-control" name="categoryName" from="${['Chair', 'Table', 'Cupboard']}" required="true"/><br>

                                </div>
                                <div class="form-group">
                                    <label for="itemName">Item Name</label>
                                    <input type="text" class="form-control" id="itemName" name="itemName">
                                </div>
                                <div class="form-group">
                                    <label for="itemDescription">Description</label>
                                    <textarea class="form-control" id="itemDescription" name="itemDescription" rows="4"></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="itemQuantity">Quantity</label>
                                    <input type="number" class="form-control" id="itemQuantity" name="itemQuantity" min="1" >
                                </div>
                            </form>
                        </div>
                    </div>
            </div>

            <input type="submit" class="btn btn-default" value="Save">

        </div>

    </div>
    </g:form>
    </body>
</html>
