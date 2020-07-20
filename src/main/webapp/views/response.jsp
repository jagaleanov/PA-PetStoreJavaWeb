<%-- 
    Document   : response
    Created on : 15/02/2019, 12:11:32 AM
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

    </head>
    <body>
        <!--HEADER---------------------------------------------------------------->
        <header>
            <img src="images/header.jpg" width="100%">
        </header>
        <!--MAIN------------------------------------------------------------->
        <div id="wrapper">
            <div class="container">
                <h1>Gracias por tu compra!</h1>
                <hr>
                <div class="main">
                    <a href="Stock" class="btn btn-primary">Volver al catálogo</a>
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
