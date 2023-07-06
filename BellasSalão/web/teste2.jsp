<%-- 
    Document   : teste2
    Created on : 29/05/2023, 23:52:17
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <style>
    body {
      font-family: Arial, sans-serif;
    }
  
    .container {
      max-width: 400px;
      margin: 0 auto;
    }
  
    .form-group {
      margin-bottom: 15px;
    }
  
    .form-group label {
      display: block;
      font-weight: bold;
    }
  
    .form-group input[type="text"],
    .form-group input[type="email"],
    .form-group input[type="date"],
    .form-group input[type="time"] {
      width: 100%;
      padding: 5px;
      font-size: 16px;
    }
  
    .form-group button {
      padding: 10px 20px;
      background-color: #4CAF50;
      color: white;
      border: none;
      cursor: pointer;
    }
  
    .form-group button:hover {
      background-color: #45a049;
    }
  
    .message {
      margin-top: 15px;
      padding: 10px;
      font-weight: bold;
    }
  
    .success {
      background-color: #dff0d8;
      color: #3c763d;
    }
  
    .error {
      background-color: #f2dede;
      color: #a94442;
    }
  </style>
    </head>
    <body>
       <div class="container">
    <h2>Formulário de Agendamento</h2>
    <form action="srva" method="post">
      <div class="form-group">
        <label for="txtNome">Nome:</label>
        <input type="text" id="txtNome" name="txtNome" required>
      </div>
      <div class="form-group">
        <label for="txtSobre">Sobrenome:</label>
        <input type="text" id="txtSobre" name="txtSobre" required>
      </div>
      <div class="form-group">
        <label for="txtEmail">Email:</label>
        <input type="email" id="txtEmail" name="txtEmail" required>
      </div>
      <div class="form-group">
        <label for="txtFunci">ID do Funcionário:</label>
        <input type="text" id="txtFunci" name="txtFunci" required>
      </div>
      <div class="form-group">
        <label for="txtServico">ID do Serviço:</label>
        <input type="text" id="txtServico" name="txtServico" required>
      </div>
      <div class="form-group">
        <label for="txtData">Data do Agendamento:</label>
        <input type="date" id="txtData" name="txtData" required>
      </div>
      <div class="form-group">
        <label for="txtHora">Horário do Agendamento:</label>
        <input type="time" id="txtHora" name="txtHora" required>
      </div>
         <div class="form-group">
        <label for="txtClienteId">ID do Cliente:</label>
        <input type="text" id="txtClienteId" name="txtClienteId" required>
      </div>
      <div class="form-group">
        <button type="submit">Agendar</button>
      </div>
    </form>
  </div>
</body>
</html>

    </body>
</html>
