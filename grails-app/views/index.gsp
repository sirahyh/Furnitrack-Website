<!doctype html>
<html>
<head>

    <title>Welcome to Grails</title>

    <asset:link rel="icon" href="logo.png" type="image/x-ico" />
    <asset:stylesheet src="home.css"/>
</head>
<body>

<div class="main-home">
    <div class="left-home">
        <h1>Welcome To AgroStock!</h1>
        <span>Agro Inventory Website</span>
        <p>Assisting you in managing agricultural and farming products storage for more efficient sales</p>

        <button class="btn-home">
            <a href="${g.createLink(controller: 'item', action: 'index')}">Start</a>
        </button>

    </div>

    <div class="right-home">
        <img class="img-logo" src="<g:createLinkTo dir="images" file="home.jpg" />"/>
    </div>
</div>

</body>
</html>
