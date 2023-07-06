<%-- 
    Document   : loginTest
    Created on : 07/06/2023, 17:33:09
    Author     : sala303b
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="loginADM.css">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="srvf" class="sign-in-form" method="POST">
            <h2 class="title">Painel de Adm</h2>
            <div class="input-field">
                <i class="fas fa-user"></i>
                <input type="text" placeholder="Usuario" name="usuario" id="usuario">
            </div>
            <div class="input-field">
                <i class="fas fa-lock"></i>
                <input type="password" placeholder="Password" name="senha" id="senha">
            </div>

            <input type="submit" value="logar" class="btn solid" name="acao" id="acao">
        </form>
    </body>
</html>
