<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Page Title</title>

        <link rel='stylesheet' type='text/css' media='screen' href='main.css'>
        <link rel="stylesheet" href="style.css">
        <script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/inputmask/5.0.6/jquery.inputmask.min.js"></script>

        
    </head>
    <body>
        <div class="container">
            <div class="forms-container">
                <div class="signin-signup">
                    <form action="srvc" class="sign-in-form" method="POST">
                        <h2 class="title">login</h2>
                        <div class="input-field">
                            <i class="fas fa-user"></i>
                            <input type="text" placeholder="Usuario" name="usuario" id="usuario">
                        </div>
                        <div class="input-field">
                            <i class="fas fa-lock"></i>
                            <input type="password" placeholder="Password" name="senha" id="senha">
                        </div>

                        <input type="submit" value="logar" class="btn solid" name="acao" id="acao">
                        <p class="social-text">Login para funcionários</p>
                        <div class="social-media">
                            <a href="loginTest.jsp" class="social-icon">
                                <i class="fas fa-user"></i>
                            </a>
                        </div>
                    </form>


                    <form action="srvc" method="POST" name="frm_cad_clientes" id="frm_cad_clientes" class="sign-up-form">
                        <h2 class="title">Cadastro</h2>
                        
                        <div class="input-field">
                            <i class="fas fa-user"></i>
                            <input type="text" placeholder="Nome Completo" id="txtNome" name="txtNome">
                        </div>
                        <div class="input-field">
                            <i class="fas fa-user"></i>
                            <input type="text" placeholder="Usuário" id="txtUsuario" name="txtUsuario">
                        </div>
                        <div class="input-field">
                            <i class="fas fa-lock"></i> 
                            <input type="tel" id="txtTel" name="txtTel"  placeholder="Telefone" required>
                        </div>
                        <div class="input-field">
                            <i class="fas fa-envelope"></i>
                            <input type="text" placeholder="Email" id="txtEmail" name="txtEmail">
                        </div>
                        <div class="input-field">
                            <i class="fas fa-lock"></i>
                            <input type="password" placeholder="Senha" id="txtSenha" name="txtSenha">
                        </div>
                        <input type="hidden" value="cad_clientes" id="acao" name="acao">
                        <input class="btn btn-primary" type="submit" value="Cadastrar">
                        <p class="social-text">Redes sociais</p>
                        <div class="social-media">
                            <a href="#" class="social-icon">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                            <a href="#" class="social-icon">
                                <i class="fab fa-twitter"></i>
                            </a>
                            <a href="#" class="social-icon">
                                <i class="fab fa-google"></i>
                            </a>
                            <a href="#" class="social-icon">
                                <i class="fab fa-linkedin-in"></i>
                            </a>
                        </div>
                    </form>
                </div>
            </div>

            <div class="panels-container">
                <div class="panel left-panel">
                    <div class="content">
                        <h3>Novo por aqui ?</h3>
                        <p>Faça o cadastro em nosso sistema para realizar o seu agendamento.</p>
                        <button class="btn transparent" id="sign-up-btn">Cadastra-se</button>
                    </div>
                    <img src="image/hair.svg" class="image" alt="">
                </div>
                <div class="panel right-panel">
                    <div class="content">
                        <h3>Já tem uma conta aqui ?</h3>
                        <p>Acesse a sua conta para fazer o seu agendamento. </p>
                        <button class="btn transparent" id="sign-in-btn">Login</button>
                    </div>
                    <img src="image/bu.svg" class="image" alt="">
                </div>
            </div>
        </div>
<div id="error-popup" class="popup">
        <div class="popup-content">
            <span class="close">&times;</span>
            <p id="error-message"></p>
        </div>
    </div>
            
        <script src="script.js"></script>
    </body>
</html>
