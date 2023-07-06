<%-- 
    Document   : PainelAdm
    Created on : 31/05/2023, 20:25:41
    Author     : User
--%>

<%@page import="dao.ClientesDAO"%>
<%@page import="dao.AgendamentoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Instanciar o DAO para acessar os métodos de consulta
    AgendamentoDAO daoAgendamento = new AgendamentoDAO();

    // Obter a contagem de agendamentos cancelados
    int quantidadeCancelados = daoAgendamento.getQuantidadeAgendamentosCancelados();

    // Obter a contagem de agendamentos em espera
    int quantidadeEmEspera = daoAgendamento.getQuantidadeAgendamentosEmEspera();
    
    int quantidadeConfirmado = daoAgendamento.getQuantidadeAgendamentosConfirmado();

    // Obter o total de clientes
    ClientesDAO daoClientes = new ClientesDAO();
    int totalClientes = daoClientes.getTotalClientes();
%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Montserrat Font -->
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

        <!-- Material Icons -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">
        <link rel="stylesheet" href="Adms.css">
        <!-- ApexCharts -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.35.5/apexcharts.min.js"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
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
                    <h2>INFORMAÇÕES DO SISTEMA :</h2>
                </div>
                <div class="main-cards">
                    <div class="card">
                        <div class="card-inner">
                            <h3>AGENDAMENTOS CONFIRMADOS</h3>

                        </div>
                        <h1><%= quantidadeConfirmado%></h1>
                    </div>

                    <div class="card">
                        <div class="card-inner">
                            <h3>AGENDAMENTOS EM ESPERA</h3>
                        </div>
                        <h1><%= quantidadeEmEspera%></h1>
                    </div>

                    <div class="card">
                        <div class="card-inner">
                            <h3>TOTAL DE CLIENTES</h3>
                        </div>
                        <h1><%= totalClientes%></h1>
                    </div>

                    <div class="card">
                        <div class="card-inner">
                            <h3>AGENDAMENTOS CANCELADOS (USUÁRIO)</h3>
                        </div>
                        <h1><%= quantidadeCancelados%></h1>
                    </div>

                </div>
                    <div id="meuGrafico"></div>


            </main>
            <!-- End Main -->

        </div>

        <!-- Scripts -->
        <!-- ApexCharts -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.35.5/apexcharts.min.js"></script>
        <!-- Custom JS -->
        <script>
             var dados = {
    series: [<%= quantidadeConfirmado %>, <%= quantidadeEmEspera %>, <%= totalClientes %>, <%= quantidadeCancelados %>],
    labels: ['Confirmados', 'Em Espera', 'Total de Clientes', 'Cancelados']
  };

  // Opções do gráfico
  var opcoes = {
    chart: {
      type: 'pie',
      width: '500px',
      height: '500px'
    },
    labels: dados.labels,
    series: dados.series,
    colors: ['#4e85b7', '#FA4C00', '#39a88a', '#e5483d'],
    tooltip: {
      y: {
        formatter: function(value) {
          return value + ' agendamentos';
        }
      }
    }
  };

  // Renderizar o gráfico
  var chart = new ApexCharts(document.querySelector("#meuGrafico"), opcoes);
  chart.render();
  
        </script>
        <script src="ADM.js"></script>
    </body>
</html>
