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


    <g:layoutHead/>
</head>
<body>
%{--<div id="throbber" style="display:none; min-height:120px;"></div>--}%
%{--<div id="noty-holder"></div>--}%
<div id="wrapper">
%{--    <g:render template="/layouts/sidebar"/>--}%
    <g:layoutBody/>


    <div id="spinner" class="spinner" style="display:none;">
        <g:message code="spinner.alt" default="Loading&hellip;"/>
    </div>
</div>


<asset:javascript src="application.js"/>

</body>
</html>
