<%-- 
    Document   : cadastro_cliente
    Created on : 27/04/2023, 16:44:02
    Author     : sala303b
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SISEC - EDIÇÃO DE CLIENTE</title>  
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        
 </head>
    <body>

        <div class="container">
            <header class="p-4 mt-4 text-light bg-dark rounded">
                <h2>.: EDITAR CLIENTE</h2>
            </header>
            <div class="mt-5 px-5">
                <form action="srvc" method="POST" name="frm_cad_cliente" id="frm_cad_cliente"> 
                    <h3>DADOS DO CLIENTE</h3>
                    <input type="hidden" value="${cliente.idCliente}" id="idCliente" name="idCliente">
                    <label for="txtNome">Nome do Cliente: </label>
                    <input value="${cliente.nome}" class="form-control" type="text" id="txtNome" name="txtNome" placeholder="Seu nome aqui" required > 
                    <br>
                    <label for="txtEmail">E-mail do Cliente: </label>
                    <input value="${cliente.email}"  class="form-control" type="email" id="txtEmail" name="txtEmail" placeholder="EX: contato@gmail.com" required > 
                    <br>
                    <label for="txtEmail">Usuario: </label>
                    <input value="${cliente.usuario}"  class="form-control" type="email" id="txtUsuario" name="txtUsuario" placeholder="EX: contato@gmail.com" required > 
                    <br>
                    <label for="txtTel">Telefone do Cliente: </label>
                    <input value="${cliente.telefone}" class="form-control" type="tel" id="txtTel" name="txtTel" placeholder="(00)00000-0000" > 
                    <br>
                    <label for="txtIdade">Senha: </label>
                    <input value="${cliente.senha}" class="form-control" type="text" id="txtSenha" name="txtSenha" placeholder="EX: 25" required> 
                    <br>
                    <input type="hidden" value="atualizar" id="acao" name="acao">
                    <input class="btn btn-primary" type="submit" value="Enviar dados">
                    <input class="btn btn-warning" type="reset" value="Limpar dados" >
                </form>
            </div>
        </div>
    </body>
</html>
