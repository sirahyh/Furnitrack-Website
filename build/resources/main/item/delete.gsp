<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'item.label', default: 'Item')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
    <h1>Konfirmasi Delete</h1>
    <p>Apakah yakin akan menghapus data ini: '${item.itemName}'?</p>
    <form method="post" action="${createLink(action: 'deleteConfirmed', id: item.id)}">
        <button type="submit">Delete</button>
        <a href="${createLink(action: 'index')}">Cancel</a>
    </form>
    </body>
</html>
