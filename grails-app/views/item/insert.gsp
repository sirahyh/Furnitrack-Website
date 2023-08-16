<%--
  Created by IntelliJ IDEA.
  User: rahmayh
  Date: 8/16/23
  Time: 8:51 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>

<h1>Insert One Data To Database</h1>
<g:form controller="item" action="saveOneItem">
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