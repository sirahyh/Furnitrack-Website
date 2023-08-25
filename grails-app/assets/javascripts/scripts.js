(function($) {
    "use strict";


    $(function () {
        for (var nk = window.location, o = $(".nano-content li a").filter(function () {
            return this.href == nk;
        })
            .addClass("active")
            .parent()
            .addClass("active"); ;) {
            if (!o.is("li")) break;
            o = o.parent()
                .addClass("d-block")
                .parent()
                .addClass("active");
        }
    });


    /* 
    ------------------------------------------------
    Sidebar open close animated humberger icon
    ------------------------------------------------*/

    $(".hamburger").on('click', function() {
        $(this).toggleClass("is-active");
    });





    /* TO DO LIST 
    --------------------*/
    $(".tdl-new").on('keypress', function(e) {
        var code = (e.keyCode ? e.keyCode : e.which);
        if (code == 13) {
            var v = $(this).val();
            var s = v.replace(/ +?/g, '');
            if (s == "") {
                return false;
            } else {
                $(".tdl-content ul").append("<li><label><input type='checkbox'><i></i><span>" + v + "</span><a href='#' class='ti-close'></a></label></li>");
                $(this).val("");
            }
        }
    });


    $(".tdl-content a").on("click", function() {
        var _li = $(this).parent().parent("li");
        _li.addClass("remove").stop().delay(100).slideUp("fast", function() {
            _li.remove();
        });
        return false;
    });

    // for dynamically created a tags
    $(".tdl-content").on('click', "a", function() {
        var _li = $(this).parent().parent("li");
        _li.addClass("remove").stop().delay(100).slideUp("fast", function() {
            _li.remove();
        });
        return false;
    });






})(jQuery);

// MY SCRIPT
$(document).ready(function() {
    // Menangani klik tombol close di dalam modal
    $('.modal').on('hidden.bs.modal', function() {
        // Kembali ke halaman awal
        window.location.href = '/item/index';
    });
});

function openInputModal(itemId, itemName, description) {
    $('#inputItemId').val(parseInt(itemId));
    $('#inputItemName').text(itemName);
    $('#inputItemDescription').text(description);
    $('#inputModal').modal('show');
}

function editDataItem(itemId, itemName, itemDescription, itemQuantity, itemImage) {
    $('#itemId').val(parseInt(itemId));
    $('#itemName').val(itemName);
    $('#itemDescription').val(itemDescription);
    $('#itemQuantity').val(itemQuantity);
    if (itemImage) {
        $('#currentItemImage').attr('src', 'item-image/' + itemId + '-' + itemImage);
    } else {
        $('#currentItemImage').attr('src', 'images/default-image.png');
    }
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


// CREATE PAGE --> ADD MULTIPLE DATA
const addBtn = document.querySelector(".add");
const inputGroup = document.querySelector(".inp-group");

function removeInput() {
    this.parentElement.remove();
}

function addInput() {
    const select = document.createElement("select");
    const options = ['Benih', 'Pestisida', 'Pupuk', 'Alat'];

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

    // Buat input field: Image
    const itemImageLabel = document.createElement("label");
    itemImageLabel.textContent = "Image";
    const itemImageInput = document.createElement("input");
    itemImageInput.type = "file";
    itemImageInput.className = "form-control";
    itemImageInput.name = "itemImage";
    const itemImageFormGroup = document.createElement("div");
    itemImageFormGroup.className = "form-group";
    itemImageFormGroup.appendChild(itemImageLabel);
    itemImageFormGroup.appendChild(itemImageInput);

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

    flex.appendChild(itemImageFormGroup)
    flex.appendChild(select);
    flex.appendChild(name);
    flex.appendChild(description);
    flex.appendChild(quantity);
    flex.appendChild(btn);

    inputGroup.appendChild(flex);
}

addBtn.addEventListener("click", addInput);

function collectFormData(inputGroup) {
    const formData = new FormData(); // Gunakan objek FormData untuk mengumpulkan data

    const inputs = inputGroup.querySelectorAll(".flex");

    for (let i = 0; i < inputs.length; i++) {
        const input = inputs[i];
        const select = input.querySelector("#itemCategory");
        const itemName = input.querySelector("#itemName");
        const itemDescription = input.querySelector("#itemDescription");
        const itemQuantity = input.querySelector("#itemQuantity");

        const itemImageInput = input.querySelector("input[name='itemImage']");
        const itemImageFile = itemImageInput.files[0];

        formData.append("category", select.value);
        formData.append("name", itemName.value);
        formData.append("description", itemDescription.value);
        formData.append("quantity", itemQuantity.value);
        formData.append("itemImage", itemImageFile);
    }

    return formData;
}
const endpointURL = document.getElementById('endpoint-save').getAttribute('data-endpoint-url');

function sendDataToController() {
    const inputGroup = document.getElementById("inputGroup"); // Ganti dengan id yang sesuai
    const formData = collectFormData(inputGroup);

    fetch(endpointURL, {
        method: "POST",
        body: formData, // Kirim FormData yang berisi data dan file gambar
    })
        .then(response => response.json())
        .then(data => {
            // Lakukan sesuatu dengan respons dari controller jika diperlukan
        })
        .catch(error => {
            console.error("Error sending data:", error);
        })
}

const submitButton = document.getElementById("tombol-submit");
submitButton.addEventListener("click", function(event) {
    event.preventDefault()
    console.log("button submit tertekan")
    console.log("isi dari fungsi collectData : ", collectFormData())
})

// KODE ASLI
// const addBtn = document.querySelector(".add");
// const inputGroup = document.querySelector(".inp-group");
//
// function removeInput() {
//     this.parentElement.remove();
// }
//
// function addInput() {
//     const select = document.createElement("select");
//     const options = ["Chair", "Table", "Cupboard"];
//
//     options.forEach(option => {
//         const optionElement = document.createElement("option");
//         optionElement.value = option;
//         optionElement.textContent = option;
//         select.appendChild(optionElement);
//     });
//     select.className = "select-field";
//     select.id = "itemCategory"
//
//     const name = document.createElement("input");
//     name.type = "text";
//     name.placeholder = "Input Item Name";
//     name.className = "input-field";
//     name.id = "itemName"
//
//     const description = document.createElement("textarea");
//     description.rows = 1;
//     description.cols = 40;
//     description.placeholder = "Input Item Description";
//     description.className = "textarea-field";
//     description.id = "itemDescription"
//
//     // Buat input field: Image
//     const itemImageLabel = document.createElement("label");
//     itemImageLabel.textContent = "Image";
//     const itemImageInput = document.createElement("input");
//     itemImageInput.type = "file";
//     itemImageInput.className = "form-control";
//     itemImageInput.name = "itemImage";
//     const itemImageFormGroup = document.createElement("div");
//     itemImageFormGroup.className = "form-group";
//     itemImageFormGroup.appendChild(itemImageLabel);
//     itemImageFormGroup.appendChild(itemImageInput);
//
//     const quantity = document.createElement("input");
//     quantity.type = "number";
//     quantity.placeholder = "Input Item Quantity";
//     quantity.className = "input-field";
//     quantity.id = "itemQuantity"
//
//     const btn = document.createElement("a");
//     btn.className = "delete";
//     btn.innerHTML = "&times";
//     btn.addEventListener("click", removeInput);
//
//     const flex = document.createElement("div");
//     flex.className = "flex";
//
//     flex.appendChild(itemImageFormGroup)
//     flex.appendChild(select);
//     flex.appendChild(name);
//     flex.appendChild(description);
//     flex.appendChild(quantity);
//     flex.appendChild(btn);
//
//     inputGroup.appendChild(flex);
// }
//
// addBtn.addEventListener("click", addInput);
//
// function collectFormData() {
//     const formData = [];
//     const flexItems = document.querySelectorAll(".flex");
//
//     flexItems.forEach(item => {
//         const category = item.querySelector("#itemCategory");
//         const name = item.querySelector("#itemName");
//         const description = item.querySelector("#itemDescription");
//         const quantity = item.querySelector("#itemQuantity");
//
//         formData.push({
//             category: category.value,
//             name: name.value,
//             description: description.value,
//             quantity: quantity.value
//         });
//     });
//
//     return formData;
// }
//
// document.getElementById('tombol-submit').addEventListener('click', function() {
//     console.log('BUTTON SUBMIT PADA PAGE CREATE TERTEKAN')
// })
//
// const submitButton = document.getElementById("tombol-submit");
//
// const endpointURL = document.getElementById('endpoint-save').getAttribute('data-endpoint-url');
//
// submitButton.addEventListener("click", function() {
//     const jsonData = collectFormData();
//     console.log(jsonData);
//
//     fetch(endpointURL, {
//         method: 'POST',
//         headers: {
//             'Content-Type': 'application/json'
//         },
//         body: JSON.stringify(jsonData)
//     })
//         .then(response => response.json())
//         .then(data => {
//             console.log("Data sent successfully:", data);
//             // Handle the response from the server if needed
//         })
//         .catch(error => {
//             console.error("Error sending data:", error);
//             // Handle errors if any
//         });
// });
