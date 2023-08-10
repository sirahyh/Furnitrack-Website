<%--
  Created by IntelliJ IDEA.
  User: rahmayh
  Date: 8/9/23
  Time: 12:31 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
%{--    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">--}%
%{--    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>--}%
%{--    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>--}%
</head>

<body>

<div class="sidebar sidebar-hide-to-small sidebar-shrink sidebar-gestures">
    <div class="nano">
        <div class="nano-content">
            <div class="logo"><a href="index.html"><!-- <img src="images/logo.png" alt="" /> --><span>Focus</span></a></div>
            <ul>
                <li class="label">Main</li>
                <li><a class="sidebar-sub-toggle"><i class="ti-home"></i> Dashboard </a>

                </li>

                <li class="label">Apps</li>
                <li><a class="sidebar-sub-toggle"><i class="ti-file"></i>    Log  <span class="sidebar-collapse-icon ti-angle-down"></span></a>
                    <ul>
                        <li><a href="chart-flot.html">Chairs</a></li>
                        <li><a href="chart-morris.html">Tables</a></li>
                        <li><a href="chartjs.html">Cupboards</a></li>
                    </ul>
                </li>
                <li><a href="app-event-calender.html"><i class="ti-bar-chart-alt"></i> Statictics </a></li>

            </ul>
        </div>
    </div>
</div>
<!-- /# sidebar -->


<div class="header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="float-left">
                    <div class="hamburger sidebar-toggle">
                        <span class="line"></span>
                        <span class="line"></span>
                        <span class="line"></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>