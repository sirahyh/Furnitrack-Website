<%--
  Created by IntelliJ IDEA.
  User: rahmayh
  Date: 8/22/23
  Time: 2:20 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
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

<header>
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top bg-dark rounded">
        <a class="navbar-brand" href="#">Grails Online Contacts Book</a>
        <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse"
                data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
    </nav>
</header>


<div class="container-fluid">
    <div class="row">
        <main role="main" class="col-sm-12 ml-sm-auto col-md-12 pt-3">
            <g:layoutBody/>
        </main>
    </div>
</div>

</body>
</html>