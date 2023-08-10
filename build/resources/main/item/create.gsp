<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
         <title>Create New Item</title>


    </head>
    <body>
    <h1>Create New Item</h1>

    <div class="row">
        <div class="col-lg-6">
            <div class="card">
                <div class="card-title">
                    <h4>Input New Item</h4>

                </div>
                <div class="card-body">
                    <div class="basic-form">
                        <form>
                            <div class="form-group">
                                <label>Category</label>
                                <select class="form-control" name="categoryName">
                                    <option>Chair</option>
                                    <option>Table</option>
                                    <option>Cupboard</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="itemName">Item Name</label>
                                <input type="text" class="form-control" id="itemName" name="itemName">
                            </div>
                            <div class="form-group">
                                <label for="itemDescription">Description</label>
                                <input type="text-area" class="form-control" id="itemDescription" name="itemDescription" rows="4">
                            </div>
                            <div class="form-group">
                                <label for="itemQuantity">Quantity</label>
                                <input type="number" class="form-control" id="itemQuantity" name="itemQuantity" min="1">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <button type="submit" class="btn btn-default">Submit</button>
        </div>


        <!-- /# column -->

    </div>
%{--    <g:form controller="item" action="save">--}%
%{--        <label for="categoryName">Category:</label>--}%
%{--        <g:select name="categoryName" from="${['kursi', 'meja', 'lemari']}" required="true"/><br>--}%

%{--        <label for="itemName">Item Name:</label>--}%
%{--        <input type="text" id="itemName" name="itemName" required><br>--}%

%{--        <label for="itemDescription">Item Description:</label>--}%
%{--        <textarea id="itemDescription" name="itemDescription" rows="4" required></textarea><br>--}%

%{--        <label for="itemQuantity">Quantity:</label>--}%
%{--        <input type="number" id="itemQuantity" name="itemQuantity" min="1" required><br>--}%

%{--        <input type="submit" value="Save">--}%
%{--    </g:form>--}%

    </body>
</html>
