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
        <label for="itemName">Item Name:</label>
        <input type="text" id="itemName" name="itemName" value="${items.itemName}" required><br>

        <label for="itemDescription">Item Description:</label>
        <textarea id="itemDescription" name="itemDescription" rows="4" required>${items.description}</textarea><br>

        <label for="itemQuantity">Quantity:</label>
        <input type="number" id="itemQuantity" name="itemQuantity" value="${items.quantity}" min="1" required><br>

        <input type="submit" value="Update">
    </g:form>
    </body>
</html>
