<%--
  Created by IntelliJ IDEA.
  User: rahmayh
  Date: 8/22/23
  Time: 10:58 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="public" />
    <title></title>
</head>

<body data-theme="light" class="font-nunito">
<!-- WRAPPER -->
<div id="wrapper" class="theme-cyan">
    <div class="vertical-align-wrap">
        <div class="vertical-align-middle auth-main">
            <div class="auth-box">

                <div class="card">
                    <div class="header">
                        <p class="lead">Create an account</p>
                    </div>
                    <div class="body">
                        <g:form controller="authentication" action="doRegistration">
                            <div class="form-group">
                                <label for="username" class="control-label sr-only">Username</label>
                                <input type="text" class="form-control" id="username" placeholder="User Name" name="username">
                            </div>
                            <div class="form-group">
                                <label for="signup-email" class="control-label sr-only">Email</label>
                                <input type="email" class="form-control" id="signup-email" placeholder="Your email" name="email">
                            </div>
                            <div class="form-group">
                                <label for="signup-password" class="control-label sr-only">Password</label>
                                <input type="password" class="form-control" id="signup-password" placeholder="Password" name="password">
                            </div>
                            <button type="submit" class="btn btn-primary btn-lg btn-block" name="registration">REGISTER</button>
                            <div class="bottom">
                                <span class="helper-text">Already have an account? <a href="${g.createLink(controller: 'authentication', action: 'login')}">Login</a></span>
                            </div>
                        </g:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- END WRAPPER -->
</body>

</html>