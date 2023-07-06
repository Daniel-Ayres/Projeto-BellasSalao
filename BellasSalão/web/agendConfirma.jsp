<%@page contentType="text/html" pageEncoding="UTF-8" import="model.Agendamentos"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>

        <!-- Montserrat Font -->
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
        <!-- Material Icons -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="Adms.css">
        <title>JSP Page</title>
    </head>
    <style>
        .btn {
            display: inline-block;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
            text-transform: uppercase;
            transition: background-color 0.3s ease;
        }

        .button-28 {
            appearance: none;
            background-color: transparent;
            border: 2px solid #fff;
            border-radius: 10px;
            box-sizing: border-box;
            color: #fff;
            cursor: pointer;
            display: inline-block;
            font-family: Roobert,-apple-system,BlinkMacSystemFont,"Segoe UI",Helvetica,Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol";
            font-size: 14px;
            font-weight: 600;
            line-height: normal;
            margin: 0;
            min-height: 40px;
            min-width: 0;
            outline: none;
            padding: 10px 16px;
            text-align: center;
            text-decoration: none;
            transition: all 300ms cubic-bezier(.23, 1, 0.32, 1);
            user-select: none;
            -webkit-user-select: none;
            touch-action: manipulation;
            width: auto;
            will-change: transform;
        }

        .button-28:disabled {
            pointer-events: none;
        }

        .button-28:hover {
            color: #fff;
            background-color: #003AFF ;
            box-shadow: rgba(0, 0, 0, 0.25) 0 8px 15px;
            transform: translateY(-2px);
        }

        .button-28:active {
            box-shadow: none;
            transform: translateY(0);
        }
    </style>
    <body>
        <div class="grid-container">
            <!-- Header -->
            <header class="header">
                <div class="menu-icon" onclick="openSidebar()">
                    <span class="material-icons-outlined">menu</span>
                </div>
            </header>
            <!-- End Header -->
            <!-- Sidebar -->
            <aside id="sidebar">
                <div class="sidebar-title">
                    <div class="sidebar-brand">
                        <span class=""></span> PAINEL DE ADMINISTRADOR
                    </div>
                    <span class="material-icons-outlined" onclick="closeSidebar()">close</span>
                </div>
                <ul class="sidebar-list">
                    <li class="sidebar-list-item">
                        <a href="PainelAdm.jsp">
                            <span class=""></span> DADOS DO SISTEMA
                        </a>
                    </li>
                    <li class="sidebar-list-item">
                        <a href="srvA?acao=agendConfirma">
                            <span class=""></span> AGENDAMENTOS CONFIRMADOS
                        </a>
                    </li>   
                    <li class="sidebar-list-item">
                        <a href="srvA?acao=agendEspera">
                            <span class=""></span> AGENDAMENTOS EM ESPERA
                        </a>
                    </li>
                    <li class="sidebar-list-item">
                        <a href="srvA?acao=listar_agendamentos" >
                            <span class=""></span>TODOS OS AGENDAMENTOS
                        </a>
                    </li>
                    <li class="sidebar-list-item">
                        <a href="CadFunci.jsp" >
                            <span class=""></span> CADASTRAR FUNCIONARIOS
                        </a>
                    </li>
                    <li class="sidebar-list-item">
                        <a href="srvf?acao=listar_funcionarios" >
                            <span class=""></span>DADOS FUNCIONARIOS
                        </a>
                    </li>
                    <li class="sidebar-list-item">
                        <a href="srvc?acao=listar_clientes" >
                            <span class=""></span>DADOS CLIENTES
                        </a>
                    </li>

                    <li class="sidebar-list-item">
                        <a href="index.jsp">
                            <span class=""></span> SAIR
                        </a>
                    </li>
                </ul>
            </aside>
            <!-- End Sidebar -->
            <!-- Main -->
            <main class="main-container">
                <div class="main-title">
                    <h2>CONFIRMAÇÃO DE AGENDAMENTOS :</h2>
                </div>
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nome</th>
                            <th>Funcionário</th>
                            <th>Serviço</th>
                            <th>Horário</th>
                            <th>Status</th>
                            <th>Botão</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${agendamentoConfirmado}" var="agendamento">
                            <c:if test="${agendamento.status eq 'confirmado'}">
                                <tr>
                                    <td>${agendamento.idAgendamento}</td>
                                    <td>${agendamento.nome_cliente}</td>
                                    <td>${agendamento.funcionario}</td>
                                    <td>${agendamento.servico}</td>
                                    <td>${agendamento.data_agendamento}</td>
                                    <td>${agendamento.status}</td>
                                    <td>     
                                        <form action="srvA" method="post">
                                            <input type="hidden" name="acao" value="agendamentoRealizado">
                                            <input type="hidden" name="idAgendamento" value="${agendamento.idAgendamento}">
                                            <button class="button-28" role="button" type="submit">Realizado!</button> 
                                        </form>
                                    </td>
                                </c:if>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

            </main>
            <!-- End Main -->
        </div>
        <!-- Scripts -->
        <!-- ApexCharts -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.35.5/apexcharts.min.js"></script>
        <!-- Custom JS -->
        <script src="ADM.js">

        </script>
    </body>
</html>
