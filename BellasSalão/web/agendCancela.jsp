<%-- 
    Document   : agendCancela
    Created on : 31/05/2023, 10:19:02
    Author     : User
--%>

<%@page import="model.Agendamento"%>
<%@page import="dao.AgendamentoDAO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="painelCliente.css">
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <title>JSP Page</title>
        <style>
            .button-28 {
  appearance: none;
  background-color: transparent;
  border: 2px solid #1A1A1A;
  border-radius: 10px;
  box-sizing: border-box;
  color: #3B3B3B;
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
    </head>
    <body>
        <!-- SIDEBAR -->
        <section id="sidebar">
            <a href="#" class="brand">
                <span class="text">Opções</span>
            </a>
            <ul class="side-menu top">
                <li class="active">
                    <a href="srvA?acao=clienteAgendamentos">
                        <i class='bx bxs-dashboard' ></i>
                        <span class="text">Meus Agendamentos</span>
                    </a>
                </li>
                <li>
                    <a href="editarCliente.jsp">
                        <i class='bx bxs-group' ></i>
                        <span class="text">Editar Perfil</span>
                    </a>
                </li>
                <li>
                    <a href="dadosCliente.jsp">
                        <i class='bx bxs-group' ></i>
                        <span class="text">Meus dados de Perfil</span>
                    </a>
                </li>
                <li>
                    <a href="srvA?acao=agendCancela">
                        <i class='bx bxs-group' ></i>
                        <span class="text">Agendamentos cancelados</span>
                    </a>
                </li>
            </ul>   
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

            <!-- MAIN -->
            <main>
                <div class="head-title">
                    <div class="left">
                        <h1>Agendamentos cancelados</h1>
                        <ul class="breadcrumb">
                            <li>
                                <a href="#">Retorna</a>
                            </li>
                            <li><i class='bx bx-chevron-right' ></i></li>
                            <li>
                                <a class="active" href="index.jsp">Home</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="table-data">
                    <div class="order">
                        <div class="head">
                            <h3>Agendamentos cancelados :</h3>
                        </div>
                        <table>
                            <thead>
                                <tr>
                                   
                                    <th>Nome</th>
                                    <th>Data e hora</th>
                                    <th>Serviço</th>
                                    <th>Funcionario responsavel</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${agendamentosCancel}" var="agendamento">
                                <tr>
                                 <input type="hidden" name="idAgendamento" value="${agendamento.idAgendamento}">
                                    <td>${agendamento.nome_cliente}</td>
                                    <td>${agendamento.data_agendamento}</td>
                                    <td>${agendamento.servico}</td>
                                    <td>${agendamento.funcionario}</td>
                                    <td>${agendamento.status}</td>
                                    <td>
                                        <form action="srvA" method="post">  
                                            <input type="hidden" name="acao" value="retomarAgendamento">
                                            <input type="hidden" name="idAgendamento" value="${agendamento.idAgendamento}">
                                            <button class="button-28" role="button" type="submit">Retomar</button>
                                            
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
            </main>
            <!-- MAIN -->
    </body>
    <script>
        const allSideMenu = document.querySelectorAll('#sidebar .side-menu.top li a');

        allSideMenu.forEach(item => {
            const li = item.parentElement;

            item.addEventListener('click', function () {
                allSideMenu.forEach(i => {
                    i.parentElement.classList.remove('active');
                })
                li.classList.add('active');
            })
        });

        // TOGGLE SIDEBAR
        const menuBar = document.querySelector('#content nav .bx.bx-menu');
        const sidebar = document.getElementById('sidebar');

        menuBar.addEventListener('click', function () {
            sidebar.classList.toggle('hide');
        })

        const searchButton = document.querySelector('#content nav form .form-input button');
        const searchButtonIcon = document.querySelector('#content nav form .form-input button .bx');
        const searchForm = document.querySelector('#content nav form');

        searchButton.addEventListener('click', function (e) {
            if (window.innerWidth < 576) {
                e.preventDefault();
                searchForm.classList.toggle('show');
                if (searchForm.classList.contains('show')) {
                    searchButtonIcon.classList.replace('bx-search', 'bx-x');
                } else {
                    searchButtonIcon.classList.replace('bx-x', 'bx-search');
                }
            }
        })

        if (window.innerWidth < 768) {
            sidebar.classList.add('hide');
        } else if (window.innerWidth > 576) {
            searchButtonIcon.classList.replace('bx-x', 'bx-search');
            searchForm.classList.remove('show');
        }

        window.addEventListener('resize', function () {
            if (this.innerWidth > 576) {
                searchButtonIcon.classList.replace('bx-x', 'bx-search');
                searchForm.classList.remove('show');
            }
        })

        const switchMode = document.getElementById('switch-mode');

        switchMode.addEventListener('change', function () {
            if (this.checked) {
                document.body.classList.add('dark');
            } else {
                document.body.classList.remove('dark');
            }
        })
    </script>
</html>
