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
                        <p class="lead">Login to your account</p>
                    </div>
                    <div class="body">
                        <g:form controller="authentication" action="doLogin" class="form-signin">
                            <div class="form-group">
                                <label for="signin-email" class="control-label sr-only">Email</label>
                                <input type="email" class="form-control" id="signin-email" placeholder="Email" name="email">
                            </div>
                            <div class="form-group">
                                <label for="signin-password" class="control-label sr-only">Password</label>
                                <input type="password" class="form-control" id="signin-password" placeholder="Password" name="password">
                            </div>
                            <div class="form-group clearfix">
                                <label class="fancy-checkbox element-left">
                                    <input type="checkbox">
                                    <span>Remember me</span>
                                </label>
                            </div>
                            <button type="submit" class="btn btn-primary btn-lg btn-block" name="login">LOGIN</button>
                            <div class="bottom">
                                <span class="helper-text m-b-10"><i class="fa fa-lock"></i> <a href="page-forgot-password.html">Forgot password?</a></span>
                                <span>Don't have an account? <a href="${g.createLink(controller: 'authentication', action: 'register')}">Register</a></span>
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