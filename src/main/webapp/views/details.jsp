
<%-- 
    Document   : details
    Created on : 11/02/2019, 11:47:35 PM
    Author     : jgale
--%>


<%@page import="java.text.NumberFormat"%>
<%@page import="logic.Product"%>
<%@page import="db.DBProducts"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Product product = (Product) request.getAttribute("product");

    NumberFormat formatter;
    formatter = NumberFormat.getInstance();
%>
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
                <div class="main">
                    <div id="content" class="container">
                        <div class="row">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <img src="images/<%= product.getImg()%>.jpg" 
                                     class="mx-auto d-block 
                                     img-thumbnail" id="">
                                <hr>
                                <p class="h5 font-italic text-justify"><%=product.getShortDescription()%></p>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <h1><%= product.getName()%></h1>
                                <div><%=product.getDescription()%></div>
                                Valor por unidad:
                                <p class="h2">
                                    $<%= formatter.format(product.getPrice())%>
                                </p>
                                <hr>
                                <form action="Details" method="post">
                                    <label for="quantity">Cantidad</label>
                                    <%
                                        if ((product.getStock() - product.getSold()) > 0) {
                                    %>
                                    <div class="form-group">
                                        <select name="quantity" id="quantity" class="form-control">
                                            <%
                                                for (int i = 1; i <= (product.getStock() - product.getSold()); i++) {
                                            %>
                                            <option value="<%= i%>">
                                                <%= i%>
                                            </option>
                                            <%
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <input type="hidden" name="product_id" value="<%= product.getId()%>" readonly="true">
                                    <input type="hidden" name="price" value="<%= product.getPrice()%>" readonly="true">
                                    <input type="submit" value="Comprar" class="btn btn-primary">
                                    <%
                                    } else {
                                    %>
                                    <div class="form-group">
                                        <select name="quantity" id="quantity" disabled="true">
                                            <option>Agotado</option>
                                        </select>
                                    </div>
                                    <input type="submit" value="Comprar" disabled="true" class="btn btn-primary">
                                    <%
                                        }
                                    %>
                                </form>
                            </div>
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
    </body>
</html>


