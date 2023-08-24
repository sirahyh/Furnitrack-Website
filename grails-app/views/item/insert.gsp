<%--
  Created by IntelliJ IDEA.
  User: rahmayh
  Date: 8/16/23
  Time: 8:51 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main" />
    <title></title>
</head>

<body>

<h1>Insert One Data To Database</h1>
<g:form controller="item" action="saveOneItem" enctype="multipart/form-data">
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
                                <label>Category</label>
                                <g:select class="form-control" name="category" from="${['Benih', 'Pupuk', 'Alat']}" required="true"/><br>

                            </div>
                            <div class="form-group">
                                <label for="itemName">Item Name</label>
                                <input type="text" class="form-control" id="itemName" name="itemName">
                            </div>
                            <div class="form-group">
                                <label for="itemDescription">Description</label>
                                <textarea class="form-control" id="itemDescription" name="description" rows="4"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="itemQuantity">Quantity</label>
                                <input type="number" class="form-control" id="itemQuantity" name="quantity" min="1" >
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <g:field name="itemImage" class="form-control" type="file" placeholder="Please Upload Image"/>
                                <g:if test="${item?.image}">
                                    <img src="${resource(dir: "item-image", file: "/${item.id}-${item.image}")}" class="img-thumbnail" style="margin-top: 10px; height: 100px; width: 100px;"/>
                                </g:if>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <input type="submit" class="btn btn-default" value="Save">

        </div>

    </div>
</g:form>

%{--<div class="body">--}%
%{--    <h6>2. Custom file input</h6>--}%
%{--    <div class="input-group mb-3">--}%
%{--        <div class="input-group-prepend">--}%
%{--            <span class="input-group-text">Upload</span>--}%
%{--        </div>--}%
%{--        <div class="custom-file">--}%
%{--            <input type="file" class="custom-file-input" id="inputGroupFile01">--}%
%{--            <label class="custom-file-label" for="inputGroupFile01">Choose file</label>--}%
%{--        </div>--}%
%{--    </div>--}%

%{--    <div class="input-group mb-3">--}%
%{--        <div class="custom-file">--}%
%{--            <input type="file" class="custom-file-input" id="inputGroupFile02">--}%
%{--            <label class="custom-file-label" for="inputGroupFile02">Choose file</label>--}%
%{--        </div>--}%
%{--        <div class="input-group-append">--}%
%{--            <span class="input-group-text" id="">Upload</span>--}%
%{--        </div>--}%
%{--    </div>--}%

%{--    <div class="input-group mb-3">--}%
%{--        <div class="input-group-prepend">--}%
%{--            <button class="btn btn-outline-secondary" type="button">Button</button>--}%
%{--        </div>--}%
%{--        <div class="custom-file">--}%
%{--            <input type="file" class="custom-file-input" id="inputGroupFile03">--}%
%{--            <label class="custom-file-label" for="inputGroupFile03">Choose file</label>--}%
%{--        </div>--}%
%{--    </div>--}%

%{--    <div class="input-group">--}%
%{--        <div class="custom-file">--}%
%{--            <input type="file" class="custom-file-input" id="inputGroupFile04">--}%
%{--            <label class="custom-file-label" for="inputGroupFile04">Choose file</label>--}%
%{--        </div>--}%
%{--        <div class="input-group-append">--}%
%{--            <button class="btn btn-outline-secondary" type="button">Button</button>--}%
%{--        </div>--}%
%{--    </div>--}%
%{--</div>--}%

</body>
</html>