<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <title>Create New Item</title>
</head>
<body>
<h1>Create New Item</h1>

<div class="container-create">
    <div class="wrap">
        <h2>Add Dynamic Input Field</h2>
        <a href="#" class="add">&plus;</a>
    </div>
    <form>
        <div class="inp-group">

        </div>
        <button type="submit" id="tombol-submit">Submit</button>
    </form>
</div>

<script>
    const addBtn = document.querySelector(".add");
    const inputGroup = document.querySelector(".inp-group");

    function removeInput() {
        this.parentElement.remove();
    }

    function addInput() {
        const select = document.createElement("select");
        const options = ["Chair", "Table", "Cupboard"];

        options.forEach(option => {
            const optionElement = document.createElement("option");
            optionElement.value = option;
            optionElement.textContent = option;
            select.appendChild(optionElement);
        });
        select.className = "select-field";
        select.id = "itemCategory"

        const name = document.createElement("input");
        name.type = "text";
        name.placeholder = "Input Item Name";
        name.className = "input-field";
        name.id = "itemName"

        const description = document.createElement("textarea");
        description.rows = 1;
        description.cols = 40;
        description.placeholder = "Input Item Description";
        description.className = "textarea-field";
        description.id = "itemDescription"

        const quantity = document.createElement("input");
        quantity.type = "number";
        quantity.placeholder = "Input Item Quantity";
        quantity.className = "input-field";
        quantity.id = "itemQuantity"

        const btn = document.createElement("a");
        btn.className = "delete";
        btn.innerHTML = "&times";
        btn.addEventListener("click", removeInput);

        const flex = document.createElement("div");
        flex.className = "flex";

        flex.appendChild(select);
        flex.appendChild(name);
        flex.appendChild(description);
        flex.appendChild(quantity);
        flex.appendChild(btn);

        inputGroup.appendChild(flex);
    }

    addBtn.addEventListener("click", addInput);

    function collectFormData() {
        const formData = [];
        const flexItems = document.querySelectorAll(".flex");

        flexItems.forEach(item => {
            const category = item.querySelector("#itemCategory");
            const name = item.querySelector("#itemName");
            const description = item.querySelector("#itemDescription");
            const quantity = item.querySelector("#itemQuantity");

            formData.push({
                category: category.value,
                name: name.value,
                description: description.value,
                quantity: quantity.value
            });
        });

        return formData;
    }

    // document.querySelector("form").addEventListener("submit", function (event) {
    //     event.preventDefault();
    //
    //     const jsonData = JSON.stringify(collectFormData());
    //     console.log(jsonData);
    // });

    document.getElementById('tombol-submit').addEventListener('click', function() {
        console.log('BUTTON SUBMIT PADA PAGE CREATE TERTEKAN')
    })

    const submitButton = document.getElementById("tombol-submit");

    const endpointURL = '<%= g.createLink(controller: 'item', action: 'saveItems') %>';

    submitButton.addEventListener("click", function() {
        const jsonData = collectFormData();
        console.log(jsonData);

        fetch(endpointURL, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(jsonData)
        })
            .then(response => response.json())
            .then(data => {
                console.log("Data sent successfully:", data);
                // Handle the response from the server if needed
            })
            .catch(error => {
                console.error("Error sending data:", error);
                // Handle errors if any
            });
    });

</script>

%{--    <g:form controller="item" action="saveItems">--}%
%{--        <div id="item-container">--}%
%{--            <div class="item-form">--}%
%{--                <label>Category:</label>--}%
%{--                <g:select style="width: 200px" name="categoryName" from="${['Chair', 'Table', 'Cupboard']}" required="true"/><br>--}%
%{--                <label for="itemName">Item Name:</label>--}%
%{--                <input type="text" name="itemName" id="itemName" required><br>--}%
%{--                <label for="description">Description:</label>--}%
%{--                <input type="text" name="description" id="description" required><br>--}%
%{--                <label for="quantity">Quantity:</label>--}%
%{--                <input type="number" name="quantity" id="quantity" required><br><br>--}%
%{--            </div>--}%
%{--        </div>--}%
%{--        <div id="dynamic-fields">--}%
%{--            <!-- Tempat input fields yang ditambahkan secara dinamis -->--}%
%{--        </div>--}%
%{--        <button type="button" id="add-item">Add Item</button>--}%
%{--        <button type="submit">Submit</button>--}%
%{--    </g:form>--}%
%{--    <script>--}%
%{--        const itemContainer = document.getElementById("item-container");--}%
%{--        const dynamicFields = document.getElementById("dynamic-fields");--}%
%{--        const addItemButton = document.getElementById("add-item");--}%
%{--        let itemCount = 1;--}%

%{--        addItemButton.addEventListener("click", () => {--}%
%{--            const newItemForm = document.createElement("div");--}%
%{--            newItemForm.className = "item-form";--}%
%{--            newItemForm.innerHTML = `--}%
%{--                <label for="category">Category:</label>--}%
%{--                <g:select style="width: 200px" name="categoryName" from="${['Chair', 'Table', 'Cupboard']}" required="true"/><br>--}%
%{--                <label for="itemName">Item Name:</label>--}%
%{--                <input type="text" name="itemName" required><br>--}%
%{--                <label for="description">Description:</label>--}%
%{--                <input type="text" name="description" required><br>--}%
%{--                <label for="quantity">Quantity:</label>--}%
%{--                <input type="number" name="quantity" required><br><br>--}%
%{--            `;--}%
%{--            dynamicFields.appendChild(newItemForm);--}%
%{--            itemCount++;--}%
%{--        });--}%
%{--    </script>--}%



</body>
</html>
