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


<nav class="navbar navbar-expand-lg navbar-dark navbar-static-top" role="navigation">
%{--    <a class="navbar-brand logo-navbar" id="logo-navbar" href="/#"><asset:image src="logo.png" alt="Logo"/></a>--}%
%{--    --}%

    <div class="collapse navbar-collapse" aria-expanded="false" style="height: 0.8px;" id="navbarContent">
        <ul class="nav navbar-nav ml-auto">
            <g:pageProperty name="page.nav"/>
            <sec:ifLoggedIn>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                        <sec:loggedInUserInfo field='fullname'/>
                    </a>
                    <div class="dropdown-menu navbar-dark">
                        <g:form controller="logout">
                            <g:submitButton class="dropdown-item navbar-dark color-light" name="Submit" value="Logout" style="color:gray" />
                        </g:form>
                    </div>
                </li>
            </sec:ifLoggedIn>
        </ul>
    </div>

</nav>

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
