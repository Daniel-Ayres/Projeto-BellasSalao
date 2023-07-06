<%-- 
    Document   : editarCliente
    Created on : 31/05/2023, 10:06:15
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="painelCliente.css">
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="editar-cliente.css">



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
                        <div class="head-title">
                            <div class="left">
                                <div class="title-container">
                                    <h1>Editar dados do perfil :</h1>
                                </div>
                            </div>
                        </div>
                        <ul class="breadcrumb">
                            <li>
                                <a href="#">Retorna</a>
                            </li>
                            <li><i class='bx bx-chevron-right' ></i></li>
                            <li>
                                <a class="active" href="index.jsp">Home</a>
                            </li>
                        </ul>
                        <div class="profile-form-container" >
                            <form class="profile-form" action="srvc" method="POST">

                                <div class="form-group">
                                    <input type="hidden" value="${cliente.idCliente}" id="idCliente" name="idCliente">
                                    <label for="name">Nome:</label>
                                    <input type="text" value="${cliente.nome}" id="txtNome" name="txtNome" required>
                                </div>

                                <div class="form-group">
                                    <label for="position">E-mail:</label>
                                    <input type="text" id="position" value="${cliente.email}" name="txtEmail" required>
                                </div>

                                <div class="form-group">
                                    <label for="phone">Telefone:</label>
                                    <input type="tel" id="phone" value="${cliente.telefone}" name="txtTel" required>
                                </div>

                                <div class="form-group">
                                    <label for="username">Usuário:</label>
                                    <input type="text" id="username" value="${cliente.usuario}" name="txtUsuario" required>
                                </div>

                                <div class="form-group">
                                    <label for="password">Senha:</label>
                                    <input type="password" value="${cliente.senha}" id="password" name="txtSenha" required>
                                    <span class="toggle-btn" onclick="toggleSenha()">
                                        <i id="toggleIcon" class="fas fa-eye"></i>
                                    </span>
                                </div>
                                


                                <input type="hidden" value="atualizar" id="acao" name="acao">
                                <input class="btn btn-primary" type="submit" value="Enviar dados">
                            </form>
                        </div>
                        </main>
                        </body>
                        <script src="editar-cliente.js"></script>
                        </html>
