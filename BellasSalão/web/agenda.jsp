<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Boxicons -->
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- My CSS -->
        <link rel="stylesheet" href="agenda.css">
        <!-- Latest compiled and minified CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

        <title>AdminHub</title>
    </head>
    <body>


        <!-- SIDEBAR -->
        <section id="sidebar">
            <a href="#" class="brand">
                <span class="text">Painel de administrador</span>
            </a>
            <ul class="side-menu top">
                <li class="active">
                    <a href="#">
                        <i class='bx bxs-dashboard' ></i>
                        <span class="text">Agendamentos</span>
                    </a>
                </li>
                <li>
                    <a href="cadastro.jsp">
                        <i class='bx bxs-group' ></i>
                        <span class="text">Funcionários</span>
                    </a>
                </li>
            </ul>
            <ul class="side-menu">
                <li>
                    <a href="#" class="logout">
                        <i class='bx bxs-log-out-circle' ></i>
                        <span class="text" >Logout</span>
                    </a>
                </li>
            </ul>
        </section>
        <!-- SIDEBAR -->



        <!-- CONTENT -->
        <section id="content">
            <!-- NAVBAR -->
            <nav>

            </nav>
            <!-- NAVBAR -->

            <!-- MAIN -->
            <main>
                <div class="head-title">
                    <div class="left">
                        <h1>Agendamentos</h1>
                        <ul class="breadcrumb">
                            <li>
                                <a href="#" style="text-decoration: none;">Retorna</a>
                            </li>
                            <li><i class='bx bx-chevron-right' ></i></li>
                            <li>
                                <a class="active" href="#" style="text-decoration: none;">Home</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="table-data">
                    <div class="order">
                        <div class="head">
                            <h3>Agendamentos recentes</h3>
                        </div>
                        <table>
                            <thead>
                                <tr>
                                    <th style="text-align: center;">Cliente</th>
                                    <th style="text-align: center;">Data do Agendamentos</th>
                                    <th style="text-align: center;">Serviço</th>
                                    <th style="text-align: center;">Horario</th>
                                    <th style="text-align: center;">Funcionário responsável</th>
                                    <th style="text-align: center;">Excluir</th>
                                    <th style="text-align: center;">Atualizar</th>
                                </tr>
                            </thead>						
                            <tbody>
                                <tr>
                                    <td>

                                        <p>John Doe</p>
                                    </td>
                                    <td>01-10-2021</td>
                                    <td><span class="status completed">Completed</span></td>
                                    <td>oi</td>
                                    <td>faz</td>
                                    <td><button type="button" class="btn btn-danger">Danger</button></td>
                                    <td><button type="button" class="btn btn-primary">Atualizar</button></td>
                                </tr>
                                <tr>
                                    <td>

                                        <p>John Doe</p>
                                    </td>
                                    <td>01-10-2021</td>
                                    <td><span class="status completed">Completed</span></td>
                                    <td>oi</td>
                                    <td>faz</td>
                                    <td><button type="button" class="btn btn-danger">Danger</button></td>
                                    <td><button type="button" class="btn btn-primary">Atualizar</button></td>
                                </tr>
                                <tr>
                                    <td>
                                        <p>John Doe</p>
                                    </td>
                                    <td>01-10-2021</td>
                                    <td><span class="status completed">Completed</span></td>
                                    <td>oi</td>
                                    <td>faz</td>
                                    <td><button type="button" class="btn btn-danger">Danger</button></td>
                                    <td><button type="button" class="btn btn-primary">Atualizar</button></td>
                                </tr>
                                <tr>
                                    <td>

                                        <p>John Doe</p>
                                    </td>
                                    <td>01-10-2021</td>
                                    <td><span class="status completed">Completed</span></td>
                                    <td>oi</td>
                                    <td>faz</td>
                                    <td><button type="button" class="btn btn-danger">Danger</button></td>
                                    <td><button type="button" class="btn btn-primary">Atualizar</button></td>
                                </tr>
                                <tr>
                                    <td>

                                        <p>John Doe</p>
                                    </td>
                                    <td>01-10-2021</td>
                                    <td><span class="status completed">Completed</span></td>
                                    <td>oi</td>
                                    <td>faz</td>
                                    <td><button type="button" class="btn btn-danger">Danger</button></td>
                                    <td><button type="button" class="btn btn-primary">Atualizar</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </main>
            <!-- MAIN -->
        </section>
        <!-- CONTENT -->


    </body>
</html>