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

<!-- Page Loader -->
<div class="page-loader-wrapper">
    <div class="loader">
        <div class="m-t-30"><img src="<g:createLinkTo dir="images" file="spinner.gif" />" width="48" height="48" alt="Iconic"></div>
        <p>Please wait...</p>
    </div>
</div>

<!-- main left menu -->
<div id="left-sidebar" class="sidebar">
    <button type="button" class="btn-toggle-offcanvas"><i class="fa fa-arrow-left"></i></button>
    <div class="sidebar-scroll">
%{--        <div class="user-account">--}%
%{--            <img class="img-logo" src="<g:createLinkTo dir="images" file="logo.png" />"/>--}%
%{--            <span>Furnitrack</span>--}%
%{--        </div>--}%

%{--        <header>--}%
%{--            <nav class="navbar navbar-expand-lg navbar-dark fixed-top bg-dark rounded">--}%
%{--                <a class="navbar-brand" href="#">Grails Online Contacts Book</a>--}%
%{--                <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse"--}%
%{--                        data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false"--}%
%{--                        aria-label="Toggle navigation">--}%
%{--                    <span class="navbar-toggler-icon"></span>--}%
%{--                </button>--}%
%{--                --}%%{--Member Action Menu--}%
%{--                <ul class="navbar-nav ml-auto">--}%
%{--                    <UIHelper:memberActionMenu/>--}%
%{--                </ul>--}%
%{--            </nav>--}%
%{--        </header>--}%

        <div class="user-account">
%{--            <img src="assets/images/user.png" class="rounded-circle user-photo" alt="User Profile Picture">--}%
                <span>Welcome,</span>
                <ul class="navbar-nav ml-auto">
                    <UIHelper:memberActionMenu/>
                </ul>
            <hr>

        </div>
        <!-- Tab panes -->
        <div class="tab-content padding-0">
            <div class="tab-pane active" id="menu">
                <nav id="left-sidebar-nav" class="sidebar-nav">
                    <ul id="main-menu" class="metismenu li_animation_delay">
                        <li>
                            <a href="${g.createLink(controller: 'item', action: 'index')}"><i class="fa fa-dashboard"></i><span>Dashboard</span></a>
                        </li>
                        <li>
                            <a href="${g.createLink(controller: 'transaction', action: 'index')}"><i class="fa fa-table"></i><span>Log</span></a>
                        </li>
                        <li>
                            <a href="#Tables"><i class="fa fa-area-chart"></i><span>Statistics</span></a>
                        </li>

%{--                        <li class="active">--}%
%{--                                                    <a href="#Pages" class="has-arrow"><i class="fa fa-file"></i><span>Extra Pages</span></a>--}%
%{--                                                    <ul>--}%
%{--                                                        <li><a href="page-blank.html">Blank Page</a> </li>--}%
%{--                                                        <li><a href="page-profile.html">Profile <span class="badge badge-default float-right">v1</span></a></li>--}%
%{--                                                        <li><a href="page-profile2.html">Profile <span class="badge badge-warning float-right">v2</span></a></li>--}%
%{--                                                        <li><a href="page-gallery.html">Image Gallery <span class="badge badge-default float-right">v1</span></a> </li>--}%
%{--                                                        <li><a href="page-gallery2.html">Image Gallery <span class="badge badge-warning float-right">v2</span></a> </li>--}%
%{--                                                        <li><a href="page-timeline.html">Timeline</a></li>--}%
%{--                                                        <li><a href="page-timeline-h.html">Horizontal Timeline</a></li>--}%
%{--                                                        <li><a href="page-pricing.html">Pricing</a></li>--}%
%{--                                                        <li><a href="page-invoices.html">Invoices</a></li>--}%
%{--                                                        <li><a href="page-invoices2.html">Invoices <span class="badge badge-warning float-right">v2</span></a></li>--}%
%{--                                                        <li><a href="page-search-results.html">Search Results</a></li>--}%
%{--                                                        <li><a href="page-helper-class.html">Helper Classes</a></li>--}%
%{--                                                        <li><a href="page-teams-board.html">Teams Board</a></li>--}%
%{--                                                        <li><a href="page-projects-list.html">Projects List</a></li>--}%
%{--                                                        <li><a href="page-maintenance.html">Maintenance</a></li>--}%
%{--                                                        <li><a href="page-testimonials.html">Testimonials</a></li>--}%
%{--                                                        <li><a href="page-faq.html">FAQ</a></li>--}%
%{--                                                    </ul>--}%
%{--                                                </li>--}%
                    </ul>
                </nav>
            </div>

        </div>
    </div>
</div>
</body>
</html>