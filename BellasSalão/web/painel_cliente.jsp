<%-- 
    Document   : painel_cliente
    Created on : 25/05/2023, 16:10:44
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <!-- Open Sans Font -->
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <!-- Material Icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

    <!-- Custom CSS -->
   <link rel="stylesheet" href="painelclien.css">

    <!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
    <div class="grid-container">

      <!-- Header -->
      <header class="header">
        <div class="menu-icon" onclick="openSidebar()">
          <span class="material-icons-outlined">menu</span>
        </div>
        <div class="header-left">
        </div>
        <div class="header-right">

          <span class="material-icons-outlined">account_circle</span>
        </div>
      </header>
      <!-- End Header -->

      <!-- Sidebar -->
      <aside id="sidebar">
        <div class="sidebar-title">
          <div class="sidebar-brand">
            <span class="material-icons-outlined"></span>Painel do cliente
          </div>
          <span class="material-icons-outlined" onclick="closeSidebar()">close</span>
        </div>

        <ul class="sidebar-list">
          <li class="sidebar-list-item">
            <a href="painel_cliente.jsp">
              <span class="material-icons-outlined"></span> Agendamentos
            </a>
          </li>
          <li class="sidebar-list-item">
            <a href="editarCliente.jsp">
              <span class="material-icons-outlined"></span> Editar perfil
            </a>
          </li>
          <li class="sidebar-list-item">
            <a href="#">
              <span class="material-icons-outlined"></span> Sair do perfil
            </a>
          </li>
        </ul>
      </aside>
      <!-- End Sidebar -->

      <!-- Main -->
      <main class="main-container">
        <div class="main-title">
          <h2>Agendamentos feitos:</h2>
        </div>
        <br>
        <br>
        <div class="table-responsive">
          <table class="table table-dark">
            <thead>
              <tr>
                <th scope="col" class="text-center">Id</th>
                <th scope="col" class="text-center">Funcionário responsável</th>
                <th scope="col" class="text-center">Serviço a ser realizado</th>
                <th scope="col" class="text-center">Dia agendado</th>
                <th scope="col" class="text-center">Hora agendada</th>
                <th scope="col" class="text-center">Cancelar Agendamentos</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <th scope="row" class="text-center">1</th>
                <td class="text-center">Mark</td>
                <td class="text-center">Otto</td>
                <td class="text-center">@mdo</td>
                <td class="text-center">@mdo</td>
                <td class="text-center"><button type="button" class="btn btn-danger">Cancelar</button></td>
              </tr>
              <tr>
                <th scope="row" class="text-center">2</th>
                <td class="text-center">Jacob</td>
                <td class="text-center">Thornton</td>
                <td class="text-center">@fat</td>
                <td class="text-center">@fat</td>   
                <td class="text-center"><button type="button" class="btn btn-danger">Cancelar</button></td>
              </tr>
              <tr>
                <th scope="row" class="text-center">3</th>
                <td class="text-center">Larry</td>
                <td class="text-center">the Bird</td>
                <td class="text-center">@twitter</td>
                <td class="text-center">@fat</td>
                <td class="text-center"><button type="button" class="btn btn-danger">Cancelar</button></td>
              </tr>
            </tbody>
          </table>
        </div>
      </main>
      
      
      <!-- End Main -->

    </div>

    <!-- Scripts -->
    <!-- Custom JS -->
    <script src="js/scripts.js"></script>
  </body>
</html>
