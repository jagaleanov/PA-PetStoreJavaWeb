<%-- 
    Document   : buyer
    Created on : 14/02/2019, 01:00:38 PM
    Author     : jgale
--%>

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

        <!--JS-->
        <script type="text/javascript" src="js/library.js"></script>
        <!--JS-->

    </head>
    <body>
        <!--HEADER---------------------------------------------------------------->
        <header>
            <img src="images/header.jpg" width="100%">
        </header>
        <!--MAIN------------------------------------------------------------->
        <div id="wrapper">
            <div class="container">
                <h1>Datos del comprador</h1>
                <hr>
                <div class="main">
                    <div class="main col-xs-12 col-sm-12 col-md-6 col-lg-6">
                        <form action="Buyer" method="post" name="buyerForm">
                            <div class="form-group">
                                <label for="name">Nombre</label>
                                <input type="text" class="form-control" id="name" name="name">
                            </div>
                            
                            <div class="form-group">
                                <label for="creditCardNumber">Número de tarjeta de crédito</label>
                                <input type="text" class="form-control" id="creditCardNumber" name="creditCardNumber">
                            </div>
                            
                            <div class="form-group">
                                <label for="creditCardCode">Número de seguridad de la tarjeta de crédito</label>
                                <input type="text" class="form-control" id="creditCardCode" name="creditCardCode">
                            </div>

                            <input type="hidden" name="orderId" value="<%= request.getAttribute("orderId")%>">
                            <input type="button" class="btn btn-primary" value="Finalizar la compra" onclick="validateBuyer()">
                            <a href="Cancel?id=<%= request.getAttribute("orderId")%>" class="btn btn-primary">Cancelar</a>
                            
                        </form>
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
