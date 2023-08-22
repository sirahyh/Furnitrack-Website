<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <asset:stylesheet src="application.css"/>
    <asset:link rel="icon" href="logo.png" type="image/x-ico" />

    <g:layoutHead/>
</head>
<body>
%{--<div id="throbber" style="display:none; min-height:120px;"></div>--}%
%{--<div id="noty-holder"></div>--}%
<header>
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top bg-dark rounded">
        <a class="navbar-brand" href="#">Grails Online Contacts Book</a>
        <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse"
                data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        %{--Member Action Menu--}%
        <ul class="navbar-nav ml-auto">
            <UIHelper:memberActionMenu/>
        </ul>
    </nav>
</header>


<div id="wrapper">
    <g:render template="/layouts/sidebar"/>
    <g:layoutBody/>


    <div id="spinner" class="spinner" style="display:none;">
        <g:message code="spinner.alt" default="Loading&hellip;"/>
    </div>
</div>


<asset:javascript src="application.js"/>

</body>
</html>
