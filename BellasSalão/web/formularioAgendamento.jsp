<%-- 
    Document   : formularioAgendamento
    Created on : 31/05/2023, 16:34:02
    Author     : sala303b
--%>

<%@page import="model.Funcionarios"%>
<%@page import="dao.FuncionariosDAO"%>
<%@page import="model.Servicos"%>
<%@page import="java.util.List"%>
<%@page import="dao.ServicosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="agendamento.css">
        <!-- Boxicons -->
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <!-- SIDEBAR -->
        <section id="sidebar">
            <a href="#" class="brand">
                <i class='bx bxs-calendar'></i>
                <span class="text">Agendamento</span>
            </a>
            <ul class="side-menu top">
                <li class="active">
                    <a href="formularioAgendamento.jsp">
                        <i class='bx bxs-calendar' ></i>
                        <span class="text">Agendamento</span>
                    </a>
                </li>
                <li>
                    <a href="dadosCliente.jsp">
                        <i class='bx bxs-user bx-flashing' ></i>
                        <span class="text">Meu perfil</span>
                    </a>
                </li>
                <li>
                    <a href="srvA?acao=clienteAgendamentos">
                        <i class='bx bxs-calendar' ></i>
                        <span class="text">Meus agendamentos</span>
                    </a>
                </li>
                <ul class="side-menu">
                    <li>
                        <a href="index.jsp" class="logout">
                            <i class='bx bxs-log-out-circle' ></i>
                            <span class="text">Voltar</span>
                        </a>
                    </li>
                </ul>
        </section>
        <!-- SIDEBAR -->
        <!-- CONTENT -->
        <section id="content">
            <!-- NAVBAR -->
            <nav>
                <i class='bx bx-menu' ></i>

            </nav>
            <!-- NAVBAR -->
            <main>
                <div class="head-title">
                    <div class="left">
                        <h1>Preencha o formulário para o agendamento:</h1>
                        <ul class="breadcrumb">
                            <li>
                                <a href="#">Retorna</a>
                            </li>
                            <li><i class='bx bx-chevron-right'></i></li>
                            <li>
                                <a class="active" href="index.jsp">Home</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <form action="srvA" method="POST" id="agendamentoForm">
                   <input type="hidden" value="${cliente.idCliente}" id="idCliente" name="idCliente">
                    <label for="txtNome">Nome completo:</label>
                    <input type="text" id="nome" name="txtNome" value="${cliente.nome}" required readonly>
                    <label for="txtEmail">E-mail:</label>
                    <input type="text" id="nome" name="txtEmail" value="${cliente.email}" required readonly>

                    <label for="cbFunc">Funcionário:</label>
                    <select class="form-control" name="cbFunc" id="cbFunc">
                        <% FuncionariosDAO dao = new FuncionariosDAO();
                            List<Funcionarios> funcionarios = dao.read();
                            for (Funcionarios funcionario : funcionarios) {%>
                        <option value="<%= funcionario.getId()%>"><%= funcionario.getId()%> - <%= funcionario.getNome()%></option>
                        <% } %>
                    </select>
                    <br/>
                    <label for="cbServ">Serviço:</label>
                    <select class="form-control" name="cbServ" id="cbServ">
                        <% ServicosDAO daoServ = new ServicosDAO();
                            List<Servicos> servicos = daoServ.read();
                            for (Servicos servico : servicos) {%>
                        <option value="<%= servico.getId()%>"><%= servico.getNome()%></option>
                        <% }%>
                    </select>
                    <br/>
                    <label for="dataHora">Horário:</label>
                    <input class="form-control" type="datetime-local" id="txtDataHora" name="txtDataHora">
                    <br/>
                    <input type="hidden" value="cad_agenda" id="acao" name="acao">
                    <input class="button-28" type="submit" value="Enviar dados">
                    <input class="button-28 " type="reset" value="Limpar dados">
                </form>
            </main>
            <!-- MAIN -->
        </section>
        <script src="agendamento.js"></script>
        <!-- CONTENT -->
    </body>
</html>
    