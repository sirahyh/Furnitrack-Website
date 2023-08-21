<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <title>Create New Item</title>
</head>
<body>

<div class="create-page">
    <h1>Create New Item</h1>
    <div class="container-create">
        <div class="wrap">
            <h2>Add Dynamic Input Field</h2>
            <a href="#" class="add">&plus;</a>
        </div>
        <form id="itemForm">
            <div class="inp-group">
                <!-- Input fields will be added here dynamically -->
            </div>
            <button type="submit" id="tombol-submit" class="btn btn-success">Submit</button>
        </form>
    </div>

    <div id="endpoint-save" data-endpoint-url="${g.createLink(controller: 'item', action: 'saveItems')}"></div>
    <div id="redirect-index" data-endpoint-url="${g.createLink(controller: 'item', action: 'index')}"></div>
</div>

%{--<div class="create-page">--}%
%{--    <h1 >Create New Item</h1>--}%
%{--    <div class="container-create">--}%

%{--        <div class="wrap">--}%
%{--            <h2>Add Dynamic Input Field</h2>--}%
%{--            <a href="#" class="add">&plus;</a>--}%
%{--        </div>--}%
%{--        <form>--}%
%{--            <div class="inp-group">--}%

%{--            </div>--}%
%{--            <button type="submit" id="tombol-submit" class="btn btn-success">Submit</button>--}%
%{--        </form>--}%
%{--    </div>--}%

%{--    <div id="endpoint-save" data-endpoint-url="${g.createLink(controller: 'item', action: 'saveItems')}"></div>--}%
%{--    <div id="redirect-index" data-endpoint-url="${g.createLink(controller: 'item', action: 'index')}"></div>--}%

%{--</div>--}%

</body>
</html>
