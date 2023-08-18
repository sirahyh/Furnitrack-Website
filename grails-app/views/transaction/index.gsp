<%--
  Created by IntelliJ IDEA.
  User: rahmayh
  Date: 8/11/23
  Time: 4:40 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main" />
    <title></title>
</head>

<body>
    <div class="container-fluid" id="export-data">
        <div class="block-header">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-12">
                    <h2>Transaction History</h2>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-12">
                    <div class="d-flex flex-row-reverse">
                        <div class="page_action">
                            <button type="button" class="btn btn-secondary" id="btnExport"><i class="fa fa-download"></i> Download report</button>
                        </div>
                        <div class="p-2 d-flex">

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row clearfix">
            <div class="col-lg-12">
                <div class="card">
                    <div class="header">
                        <h2>Transaction Report <small>Click the <code>Download</code> button to export the transaction report to <code>PDF</code>.</small> </h2>
                    </div>
                    <div class="body table-responsive" >
                        <table class="table table-hover" id="tblCustomers">
                            <thead>
                            <tr>
                                <th>Item Name</th>
                                <th>Transaction Type</th>
                                <th>Quantity</th>
                                <th>Transaction Date</th>
                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${transactions}" var="transaction">
                                <tr>
                                    <td>${transaction[0]}</td> <!-- Transaction Type -->
                                    <td>${transaction[1]}</td> <!-- Transaction Date -->
                                    <td>${transaction[2]}</td> <!-- Quantity -->
                                    <td>${transaction[3]}</td> <!-- Item Name -->
                                </tr>
                            </g:each>
                            </tbody>
                        </table>
                        <br />
%{--                        <input type="button" id="btnExport" value="Export" />--}%
                    </div>
                </div>
            </div>
        </div>
    </div>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>

<script type="text/javascript">
    $("#export-data").on("click", "#btnExport", function () {
        html2canvas($('#tblCustomers')[0], {
            onrendered: function (canvas) {
                var data = canvas.toDataURL();
                var docDefinition = {
                    content: [{
                        image: data,
                        width: 500
                    }]
                };
                pdfMake.createPdf(docDefinition).download("transaction-history.pdf");
            }
        });
    });
</script>
</body>
</html>