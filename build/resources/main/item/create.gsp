<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <title>Create New Item</title>
</head>
<body>

<div class="create-page">
    <h1 >Create New Item</h1>
    <div class="container-create">

        <div class="wrap">
            <h2>Add Dynamic Input Field</h2>
            <a href="#" class="add-data-item">&plus;</a>
        </div>
        <form>
            <div class="inp-group">

            </div>
            <button type="submit" id="tombol-submit" class="btn btn-success">Submit</button>
        </form>
    </div>

</div>


%{--    <div class="input-group">--}%
%{--        <div class="custom-file">--}%
%{--            <input type="file" class="custom-file-input" id="inputGroupFile04">--}%
%{--            <label class="custom-file-label" for="inputGroupFile04">Choose file</label>--}%
%{--        </div>--}%
%{--        <div class="input-group-append">--}%
%{--            <button class="btn btn-outline-secondary" type="button">Button</button>--}%
%{--        </div>--}%
%{--    </div>--}%

<script>
    const addBtn = document.querySelector(".add-data-item");
    const inputGroup = document.querySelector(".inp-group");

    function removeInput() {
        this.parentElement.remove();
    }

    function addInput() {
        const select = document.createElement("select");
        const options = ["Benih", "Pestisida", "Pupuk", "Alat"];

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

</body>
</html>
