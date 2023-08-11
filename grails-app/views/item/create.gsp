<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
         <title>Create New Item</title>


    </head>
    <body>
    <h1>Create New Item</h1>

    <g:form controller="item" action="saveItems">
        <div id="item-container">
            <div class="item-form">
                <label>Category:</label>
                <g:select style="width: 200px" name="categoryName" from="${['Chair', 'Table', 'Cupboard']}" required="true"/><br>
                <label for="itemName">Item Name:</label>
                <input type="text" name="itemName" id="itemName" required><br>
                <label for="description">Description:</label>
                <input type="text" name="description" id="description" required><br>
                <label for="quantity">Quantity:</label>
                <input type="number" name="quantity" id="quantity" required><br><br>
            </div>
        </div>
        <div id="dynamic-fields">
            <!-- Tempat input fields yang ditambahkan secara dinamis -->
        </div>
        <button type="button" id="add-item">Add Item</button>
        <button type="submit">Submit</button>
    </g:form>
    <script>
        const itemContainer = document.getElementById("item-container");
        const dynamicFields = document.getElementById("dynamic-fields");
        const addItemButton = document.getElementById("add-item");
        let itemCount = 1;

        addItemButton.addEventListener("click", () => {
            const newItemForm = document.createElement("div");
            newItemForm.className = "item-form";
            newItemForm.innerHTML = `
                <label for="category">Category:</label>
                <g:select style="width: 200px" name="categoryName" from="${['Chair', 'Table', 'Cupboard']}" required="true"/><br>
                <label for="itemName">Item Name:</label>
                <input type="text" name="itemName" required><br>
                <label for="description">Description:</label>
                <input type="text" name="description" required><br>
                <label for="quantity">Quantity:</label>
                <input type="number" name="quantity" required><br><br>
            `;
            dynamicFields.appendChild(newItemForm);
            itemCount++;
        });
    </script>

%{--    <g:form controller="item" action="save">--}%
%{--        <div class="row">--}%
%{--        <div class="col-lg-6">--}%
%{--            <div class="card">--}%
%{--                <div class="card-title">--}%
%{--                    <h4></h4>--}%

%{--                </div>--}%

%{--                    <div class="card-body">--}%
%{--                        <div class="basic-form">--}%
%{--                            <form>--}%
%{--                                <div class="form-group">--}%
%{--                                    <label for="categoryName">Category</label>--}%
%{--                                    <g:select class="form-control" name="categoryName" from="${['Chair', 'Table', 'Cupboard']}" required="true"/><br>--}%

%{--                                </div>--}%
%{--                                <div class="form-group">--}%
%{--                                    <label for="itemName">Item Name</label>--}%
%{--                                    <input type="text" class="form-control" id="itemName" name="itemName">--}%
%{--                                </div>--}%
%{--                                <div class="form-group">--}%
%{--                                    <label for="itemDescription">Description</label>--}%
%{--                                    <textarea class="form-control" id="itemDescription" name="itemDescription" rows="4"></textarea>--}%
%{--                                </div>--}%
%{--                                <div class="form-group">--}%
%{--                                    <label for="itemQuantity">Quantity</label>--}%
%{--                                    <input type="number" class="form-control" id="itemQuantity" name="itemQuantity" min="1" >--}%
%{--                                </div>--}%
%{--                            </form>--}%
%{--                        </div>--}%
%{--                    </div>--}%
%{--            </div>--}%

%{--            <input type="submit" class="btn btn-default" value="Save">--}%

%{--        </div>--}%

%{--    </div>--}%
%{--    </g:form>--}%
%{--    --}%
    </body>
</html>
