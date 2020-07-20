<%-- 
    Document   : stock
    Created on : 11/02/2019, 11:47:35 PM
    Author     : jgale
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Iterator"%>
<%@page import="logic.Product"%>
<%@page import="java.util.List"%>
<%@page import="db.DBProducts"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, user-scalable=no,
              initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <title>TIENDA DE ANIMALES - Index</title>
        
        <!--CSS-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <!--CSS-->

    </head>
    <body>
        <!--HEADER---------------------------------------------------------------->
        <header>
            <img src="images/header.jpg" width="100%">
        </header>
        <!--MAIN------------------------------------------------------------->
        <div id="wrapper">
            <div class="container">
                <h1>Nuestro catálogo</h1>
                <hr>
                <div class="main">
                    <div id="content" class="container">
                        <div class="row">
                            <%
                                Iterator<Product> iterator = (Iterator<Product>) request.getAttribute("iterator");

                                Product product = null;
                                while (iterator.hasNext()) {
                                    product = iterator.next();
                                    NumberFormat formatter;
                                    formatter = NumberFormat.getInstance();
                            %>

                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <a href="Details?id=<%= product.getId()%>">
                                    <img src="images/<%= product.getImg()%>.jpg" 
                                         class="mx-auto d-block 
                                         img-thumbnail" id="">
                                    <h3 data-toggle="tooltip" 
                                        data-html="true"
                                        data-placement="bottom"
                                        title="<%=product.getShortDescription()%>">
                                        <%= product.getName()%>
                                    </h3>
                                </a>
                                <div>
                                    $<%= formatter.format(product.getPrice())%>
                                </div>
                            </div>
                            <% }%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--FOOTER------------------------------------------------------------->
        <footer>
            <div class="container">
                © Copyright 2019.
            </div>
        </footer>
        <!--JQUERY------------------------------------------------------------->
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <!--BOOTSTRAP------------------------------------------------------------->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
    </body>
</html>
