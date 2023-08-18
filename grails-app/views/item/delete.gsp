<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'item.label', default: 'Item')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
    <h1 class="form-title">Konfirmasi Delete</h1>
    <p>Apakah yakin akan menghapus data ini: '${item.itemName}'?</p>
    <form method="post" action="${createLink(action: 'deleteConfirmed')}">
        <input type="hidden" id="itemId" name="itemId" value="">
        <button type="button" onclick="showConfirmMessage(${item.id}, '${item.itemName}')">Delete</button>
        <a href="${createLink(action: 'index')}">Cancel</a>
    </form>
    </body>
</html>
