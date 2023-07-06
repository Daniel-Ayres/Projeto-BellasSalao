<%-- 
    Document   : cadastro_matricula
    Created on : 05/05/2023, 16:49:31
    Author     : sala303b
--%>

<%@page import="model.Servicos"%>
<%@page import="dao.ServicosDAO"%>
<%@page import="model.Funcionarios"%>
<%@page import="java.util.List"%>
<%@page import="dao.FuncionariosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SISEC - Cadastro de agendamento</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

    </head>
    <body>
        <div class="container">
            <header class="p-4 mt-4 text-light bg-dark rounded">
                <h2>.: CADASTRAR AGENDAMENTO</h2>
            </header>
            <form action="srvA" method="POST" >
                <label for="txtNome"> Nome completo: </label>
                <input class="form-control" type="text" id="txtNome" name="txtNome">
                <label for="txtEmail">E-mail: </label>
                <input class="form-control" type="email" id="txtEmail" name="txtEmail">

                <label for="cbFunc"> Funcionario: </label>
                <select class="form-control" name="cbFunc" id="cbFunc">
                    <%
                        // Criar uma instância do objeto FuncionariosDAO
                        FuncionariosDAO dao = new FuncionariosDAO();

                        // Chamar o método read() para obter a lista de funcionários
                        List<Funcionarios> funcionarios = dao.read();

                        // Iterar sobre a lista de funcionários e gerar as opções do select
                        for (Funcionarios funcionario : funcionarios) {
                    %>
                    <option value="<%= funcionario.getId()%>"><%= funcionario.getId()%> - <%= funcionario.getNome()%></option>
                    <% }%>
                </select>

                <br/>
                <label for="cbServ"> Serviço: </label>
                <select class="form-control" name="cbServ" id="cbServ">
                    <%
                        ServicosDAO daoServ = new ServicosDAO();
                        List<Servicos> servicos = daoServ.read();

                        for (Servicos servico : servicos) {
                    %>
                    <option value="<%= servico.getId()%>"><%= servico.getNome()%></option>
                    <% }%>
                </select>

                <br/> 
                <label for="dataHora">Horario:</label>
                <input class="form-control" type="datetime-local" id="txtDataHora" name="txtDataHora">
                <br/>
                <input type="hidden" value="cad_agenda" id="acao" name="acao">
                <input class="btn btn-primary" type="submit" value="Enviar dados">
                <input class="btn btn-warning" type="reset" value="Limpar dados" >
            </form>
        </div>
    </body>
</html>
