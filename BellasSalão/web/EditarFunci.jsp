<%-- 
    Document   : EditarFunci
    Created on : 31/05/2023, 20:50:17
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="Adms.css">
        <!-- Montserrat Font -->
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
        <!-- Material Icons -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">
        <style>
            .main-container {
                padding: 20px;
            }

            .main-title {
                text-align: center;
                margin-bottom: 20px;
            }

            form {
                max-width: 400px;
                margin: 0 auto;
            }

            label {
                display: block;
                margin-bottom: 10px;
                font-weight: bold;
            }

            input[type="text"],
            input[type="tel"],
            input[type="password"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 20px;
                border: 1px solid #001aff;
                border-radius: 4px;
            }

            input[type="submit"] {
                display: block;
                width: 425px;
                padding: 10px;
                background-color: #7d74ff;
                color: #fff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background-color: #00ee77;
            }
            

        </style>
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
                <main class="main-container">
                    <div class="main-title">
                        <h2>EDIÇÃO DE FUNCIONÁRIOS :</h2>
                    </div>

                    <form class="profile-form" action="srvf" method="POST">
                        <input type="hidden" name="idFunc" value="${funcionario.id}">
                        <label for="txtNome">Nome:</label>
                        <input type="text" id="nome" name="txtNome" value="${funcionario.nome}" required>
                        <label for="txtCargo">Cargo:</label>
                        <input type="text" id="cargo" name="txtCargo" value="${funcionario.cargo}" required>
                        <label for="txtTel">Telefone:</label>
                        <input type="tel" id="telefone" name="txtTel" value="${funcionario.telefone}" required>
                        <label for="txtUsuario">Usuário:</label>
                        <input type="text" id="usuario" name="txtUsuario" value="${funcionario.usuario}" required>

                        <label for="txtSenha">Senha:</label>
                        <input type="password" id="senha" name="txtSenha" value="${funcionario.senha}" required>

                        

                        <input type="hidden" value="atualizar" id="acao" name="acao">
                        <input class="button-28" type="submit" value="Editar">
                        </div>
                    </form>
                </main>          
            </main>

            <!-- End Main -->
        </div>
        <!-- Scripts -->
        <!-- ApexCharts -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.35.5/apexcharts.min.js"></script>
        <!-- Custom JS -->
        <script src="ADM.js"></script>
    </body>
</html>
