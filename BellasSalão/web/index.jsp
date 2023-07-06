<%-- 
    Document   : index2
    Created on : 23/05/2023, 16:43:32
    Author     : sala303b
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bellas Salão</title>
        <link rel="shortcut icon" href="assests/img/favicon.png" type="image/x-icon">
        <!-- icon -->
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- estilo css -->
        <link rel="stylesheet" href="assests/css/style.css">
        <%@ page import="model.Clientes" %>
    </head>
    <body>
        
        <header class="l-header" id="header">
            <div class="navbar container flex">
                <div class="brand">
                    <a href="login.jsp"><img src="assests/img/Logo.png" alt="Imagem do usuário" class="user-image" style="width: 80px; height: auto;"></a>
                </div>
                <div class="nav" id="nav">
                    <ul class="nav__menu">
                        <li class="nav__item"><a href="#" class="nav__link active-link">home</a></li>
                        <li class="nav__item"><a href="#about" class="nav__link">quem somos</a></li>
                        <li class="nav__item"><a href="#services" class="nav__link">serviços</a></li>
                        <li class="nav__item"><a href="#package" class="nav__link">pacotes</a></li>
                        <li class="nav__item"><a href="#gallery" class="nav__link">galeria</a></li>
                        <li class="nav__item"><a href="#contact" class="nav__link">contato</a></li>
                            <%-- Verifica se existe uma sessão ativa e o atributo "nome" está definido --%>
                            <%
                                HttpSession sessao2 = request.getSession();
                                if (sessao2.getAttribute("cliente") != null) {
                            %>
                        <li class="nav__item"><a href="index.jsp?logout=true" class="nav__link">Sair</a></li>
                            <%
                            } else {
                            %>
                        <li class="nav__item"><a href="login.jsp" class="nav__link">Login</a></li>
                            <%
                                }
                            %>
                            <%
                                String logoutParam = request.getParameter("logout");

                                // Verifica se o parâmetro "logout" está presente e igual a "true"
                                if (logoutParam != null && logoutParam.equals("true")) {
                                    HttpSession sessao = request.getSession();
                                    sessao.invalidate();
                                    response.sendRedirect("index.jsp");
                                    return;
                                }
                            %>
                        
                        <a href="srvA?acao=clienteAgendamentos" class="nav__link">
                            <% HttpSession sessao3 = request.getSession();
                                if (sessao3.getAttribute("cliente") != null) { %>
                            <img src="assests/img/check.png" alt="Imagem do usuário" class="user-image" style="width: 30px; height: auto;">
                            <% } %> 
                        </a>

                    </ul>
                </div>
                <div class="nav__toggle" id="nav-toggle">
                    <i class='bx bx-menu'></i>
                </div>
            </div>
        </header>
        <main>
            <section class="hero">
                <div class="container">
                    <div class="row">
                        <div class="hero__img">
                            <img src="assests/img/home-img.png" alt="">
                        </div>
                        <div class="hero__content">
                            <h1>Realce sua beleza unica e deixe-nos<br><span>cuidar de voce</span></h1>
                            <p>Agende seu horario conosco e permita-se um momento exclusivo de cuidado e beleza.</p>
                            <%
                                HttpSession sessao = request.getSession();
                                if (sessao.getAttribute("cliente") == null) {
                            %>
                            <a href="login.jsp" class="btn btn__outline"><i class='bx bxl-whatsapp'></i>Faça o login</a>
                            <%} else {%>
                            <a href="formularioAgendamento.jsp" class="btn btn__outline"><i class='bx bxl-whatsapp'></i>Agende seu horário</a>
                            <%}%>
                        </div>
                    </div>
                </div>
            </section>
            <section class="about section" id="about">
                <div class="container">
                    <div class="row">
                        <div class="section__title">
                            <h1>Nossa história</h1>
                            <span>Bellas Salão</span>
                        </div>
                        <div class="about__detail">
                            <div class="about__detail__content">
                                <div class="about__img">
                                    <img src="assests/img/historiasalao.jpeg" alt="">
                                </div>
                                <div class="about__descripion">
                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
                                        Velit possimus a sint.</p>
                                    <p>Obcaecati porro accusamus iusto rem aperiam. Lorem ipsum dolor sit amet consectetur adipisicing elit.
                                        Velit possimus a sint.</p>
                                    <p>Eligendi nostrum architecto 
                                        quibusdam. Neque odio enim quasi ad culpa similique 
                                        quas.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="services section" id="services">
                <div class="services__content" style="margin-top: -5px;;">
                    <div class="row">
                        <div class="section__title">
                            <h1>Serviços</h1>
                            <span>Que realziamos</span>
                        </div>
                    </div>
                    <div class="services__content__descripion grid container">
                        <div class="box">
                            <div class="inner">
                                <img src="assests/img/servicos/manicure.png" alt="">
                                <p>manicure</p>
                            </div>
                        </div>
                        <div class="box">
                            <div class="inner">
                                <img src="assests/img/servicos/pedicure.png" alt="">
                                <p>pedicure</p>
                            </div>
                        </div>
                        <div class="box">
                            <div class="inner">
                                <img src="assests/img/servicos/maquiagem.png" alt="">
                                <p>maquiagem</p>
                            </div>
                        </div>
                        <div class="box">
                            <div class="inner">
                                <img src="assests/img/servicos/pentado.png" alt="">
                                <p>penteado</p>
                            </div>
                        </div>
                        <div class="box">
                            <div class="inner">
                                <img src="assests/img/servicos/corte.png" alt="">
                                <p>corte de cabelo</p>
                            </div>
                        </div>
                        <div class="box">
                            <div class="inner">
                                <img src="assests/img/servicos/sobrancelha.png" alt="">
                                <p>design de sobrancelha</p>
                            </div>
                        </div>
                        <div class="box">
                            <div class="inner">
                                <img src="assests/img/servicos/depilacao.png" alt="">
                                <p>depilação com cera</p>
                            </div>
                        </div>
                        <div class="box">
                            <div class="inner">
                                <img src="assests/img/servicos/limpeza.png" alt="">
                                <p>limpeza de pele</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="package section" id="package">
                <div class="package_-content">
                    <div class="row">
                        <div class="section__title">
                            <h1>Pacotes promocionais</h1>
                            <span>Fechamentos de pacotes somente no local</span>
                        </div>
                    </div>
                    <div class="package__cards row container">
                        <div class="card">
                            <div class="card__title">
                                <h1>Bronze</h1>
                            </div>
                            <div class="card__items">
                                <div class="item">
                                    <i class='bx bx-message-square-check check__icon' ></i>
                                    <p>Penteado</p>
                                </div>
                                <div class="item">
                                    <i class='bx bx-message-square-check check__icon' ></i>
                                    <p>Maquiagem</p>
                                </div>
                                <div class="item">
                                    <i class='bx bx-message-square-check check__icon' ></i>
                                    <p>Unhas<span>(tradicional francesa)</span></p>
                                </div>
                                <div class="item">
                                    <i class='bx bx-message-square-x x__icon' ></i>
                                    <p class="not">Depilação<span>(1 area)</span></p>
                                </div>
                                <div class="item">
                                    <i class='bx bx-message-square-x x__icon' ></i>
                                    <p class="not">Design de sobrancelha</p>
                                </div>
                                <div class="item">
                                    <i class='bx bx-message-square-x x__icon' ></i>
                                    <p class="not">Limpeza de pele</p>
                                </div>
                                <div class="item">
                                    <i class='bx bx-message-square-x x__icon' ></i>
                                    <p class="not">Sala de noiva reservada</p>
                                </div>
                                <div class="item">
                                    <i class='bx bx-message-square-x x__icon' ></i>
                                    <p class="not">Mesa de frutas</p>
                                </div>
                            </div>
                        </div>

                        <div class="card">
                            <div class="card__title">
                                <h1>Prata</h1>
                            </div>
                            <div class="card__items">
                                <div class="item">
                                    <i class='bx bx-message-square-check check__icon' ></i>
                                    <p>Penteado</p>
                                </div>
                                <div class="item">
                                    <i class='bx bx-message-square-check check__icon' ></i>
                                    <p>Maquiagem</p>
                                </div>
                                <div class="item">
                                    <i class='bx bx-message-square-check check__icon' ></i>
                                    <p>Unhas<span>(tradicional francesa)</span></p>
                                </div>
                                <div class="item">
                                    <i class='bx bx-message-square-check check__icon' ></i>
                                    <p>Depilação<span>(1 area)</span></p>
                                </div>
                                <div class="item">
                                    <i class='bx bx-message-square-check check__icon' ></i>
                                    <p>Design de sobrancelha</p>
                                </div>
                                <div class="item">
                                    <i class='bx bx-message-square-check check__icon' ></i>
                                    <p>Limpeza de pele</p>
                                </div>
                                <div class="item">
                                    <i class='bx bx-message-square-x x__icon' ></i>
                                    <p class="not">Sala de noiva reservada</p>
                                </div>
                                <div class="item">
                                    <i class='bx bx-message-square-x x__icon' ></i>
                                    <p class="not">Mesa de frutas</p>
                                </div>
                            </div>
                        </div>

                        <div class="card">
                            <div class="card__title">
                                <h1>Ouro</h1>
                            </div>
                            <div class="card__items">
                                <div class="item">
                                    <i class='bx bx-message-square-check check__icon' ></i>
                                    <p>Penteado</p>
                                </div>
                                <div class="item">
                                    <i class='bx bx-message-square-check check__icon' ></i>
                                    <p>Maquiagem</p>
                                </div>
                                <div class="item">
                                    <i class='bx bx-message-square-check check__icon' ></i>
                                    <p>Unhas<span>(tradicional francesa)</span></p>
                                </div>
                                <div class="item">
                                    <i class='bx bx-message-square-check check__icon' ></i>
                                    <p>Depilação<span>(1 area)</span></p>
                                </div>
                                <div class="item">
                                    <i class='bx bx-message-square-check check__icon' ></i>
                                    <p>Design de sobrancelha</p>
                                </div>
                                <div class="item">
                                    <i class='bx bx-message-square-x x__icon' ></i>
                                    <p class="not">Limpeza de pele</p>
                                </div>
                                <div class="item">
                                    <i class='bx bx-message-square-check check__icon' ></i>
                                    <p>Sala de noiva reservada</p>
                                </div>
                                <div class="item">
                                    <i class='bx bx-message-square-x x__icon' ></i>
                                    <p class="not">Mesa de frutas</p>
                                </div>
                            </div>
                        </div>

                        <div class="card">
                            <div class="card__title">
                                <h1>Diamante</h1>
                            </div>
                            <div class="card__items">
                                <div class="item">
                                    <i class='bx bx-message-square-check check__icon' ></i>
                                    <p>Penteado</p>
                                </div>
                                <div class="item">
                                    <i class='bx bx-message-square-check check__icon' ></i>
                                    <p>Maquiagem</p>
                                </div>
                                <div class="item">
                                    <i class='bx bx-message-square-check check__icon' ></i>
                                    <p>Unhas<span>(tradicional francesa)</span></p>
                                </div>
                                <div class="item">
                                    <i class='bx bx-message-square-check check__icon' ></i>
                                    <p>Depilação<span>(1 area)</span></p>
                                </div>
                                <div class="item">
                                    <i class='bx bx-message-square-check check__icon' ></i>
                                    <p>Design de sobrancelha</p>
                                </div>
                                <div class="item">
                                    <i class='bx bx-message-square-check check__icon' ></i>
                                    <p>Limpeza de pele</p>
                                </div>
                                <div class="item">
                                    <i class='bx bx-message-square-check check__icon' ></i>
                                    <p>Sala de noiva reservada</p>
                                </div>
                                <div class="item">
                                    <i class='bx bx-message-square-check check__icon' ></i>
                                    <p>Mesa de frutas</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="gallery section" id="gallery">
                <div class="gallery__content">
                    <div class="row">
                        <div class="section__title">
                            <h1>Galeria</h1>
                            <span>As princesas do nosso instragram</span>
                        </div>
                    </div>
                    <div class="gallery__list__img row container">
                        <div class="gallery__img">
                            <img src="assests/img/img-insta/Foto1.JPG" alt="">
                        </div>
                        <div class="gallery__img">
                            <img src="assests/img/img-insta/Foto2.JPG" alt="">
                        </div>
                        <div class="gallery__img">
                            <img src="assests/img/img-insta/Foto3.JPG" alt="">
                        </div>
                        <div class="gallery__img">
                            <img src="assests/img/img-insta/Foto4.JPG" alt="">
                        </div>
                        <div class="gallery__img">
                            <img src="assests/img/img-insta/Foto5.JPG" alt="">
                        </div>
                        <div class="gallery__img">
                            <img src="assests/img/img-insta/Foto6.JPG" alt="">
                        </div>
                        <div class="gallery__img">
                            <img src="assests/img/img-insta/Foto7.JPG" alt="">
                        </div>
                        <div class="gallery__img">
                            <img src="assests/img/img-insta/Foto8.JPG" alt="">
                        </div>
                    </div>
                    <button class="btn" onclick="window.location.href = 'https://www.instagram.com/bellasallao/'">ver mais</button>
                </div>
            </section>
            <section class="testimonials section">
                <div class="testimonials__content">
                    <div class="row">
                        <div class="section__title">
                            <h1>Depoimentos</h1>
                            <span>Veja o que nossos clientes tem a dizer</span>
                        </div>
                    </div>
                    <div class="testimonials__card container grid">
                        <div class="testimonials__item flex">
                            <div class="testimonials__img">
                                <img src="assests/img/depoimentos/depoimento-1.png" alt="">
                            </div>
                            <div class="testimonials__box">
                                <div class="testimonials__name">
                                    <h1>Celaena</h1>
                                    <i class='bx bxs-star star__icon' ></i>
                                    <i class='bx bxs-star star__icon' ></i>
                                    <i class='bx bxs-star star__icon' ></i>
                                    <i class='bx bxs-star star__icon' ></i>
                                    <i class='bx bxs-star star__icon' ></i>
                                </div>
                                <div class="testimonials__descripition">
                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. 
                                        Quidem quo saepe quibusdam nobis quas minima!</p>
                                </div>
                            </div>
                        </div>
                        <div class="testimonials__item flex">
                            <div class="testimonials__img">
                                <img src="assests/img/depoimentos/depoimento-2.png" alt="">
                            </div>
                            <div class="testimonials__box">
                                <div class="testimonials__name">
                                    <h1>Aelin</h1>
                                    <i class='bx bxs-star star__icon' ></i>
                                    <i class='bx bxs-star star__icon' ></i>
                                    <i class='bx bxs-star star__icon' ></i>
                                    <i class='bx bxs-star star__icon' ></i>
                                    <i class='bx bxs-star star__icon' ></i>
                                </div>
                                <div class="testimonials__descripition">
                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. 
                                        Quidem quo saepe quibusdam nobis quas minima!</p>
                                </div>
                            </div>
                        </div>
                        <div class="testimonials__item flex">
                            <div class="testimonials__img">
                                <img src="assests/img/depoimentos/depoimento-1.png" alt="">
                            </div>
                            <div class="testimonials__box">
                                <div class="testimonials__name">
                                    <h1>Luciana</h1>
                                    <i class='bx bxs-star star__icon' ></i>
                                    <i class='bx bxs-star star__icon' ></i>
                                    <i class='bx bxs-star star__icon' ></i>
                                    <i class='bx bxs-star star__icon' ></i>
                                    <i class='bx bxs-star star__icon' ></i>
                                </div>
                                <div class="testimonials__descripition">
                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. 
                                        Quidem quo saepe quibusdam nobis quas minima!</p>
                                </div>
                            </div>
                        </div>
                        <div class="testimonials__item flex">
                            <div class="testimonials__img">
                                <img src="assests/img/depoimentos/depoimento-2.png" alt="">
                            </div>
                            <div class="testimonials__box">
                                <div class="testimonials__name">
                                    <h1>Patricia</h1>
                                    <i class='bx bxs-star star__icon' ></i>
                                    <i class='bx bxs-star star__icon' ></i>
                                    <i class='bx bxs-star star__icon' ></i>
                                    <i class='bx bxs-star star__icon' ></i>
                                    <i class='bx bxs-star star__icon' ></i>
                                </div>
                                <div class="testimonials__descripition">
                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. 
                                        Quidem quo saepe quibusdam nobis quas minima!</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
        <footer class="footer" id="contact">
            <div class="footer__list section container grid">
                <div class="footer__data">
                    <h1><a href="#"></a><img src="assests/img/Logo.png" alt="Imagem do usuário" class="user-image" style="width: 200px; height: auto;"></h1>
                    <div class="footer__data-social">

                    </div>
                </div>
                <div class="footer__data">
                    <h2>nosso endereço</h2>
                    <p>Av. Belo Horizonte, 302<br>Nova Carapina I, Serra - ES</p>
                </div>
                <div class="footer__data">
                    <h2>nosso horario</h2>
                    <p>Segunda a Sabado<br>(Excessção de Quarta)<br>das 07:00 as 19:00</p>
                    <br>
                    <p>Quarta<br>das 07:00 as 17:00 </p>

                </div>
                <div class="footer__data">
                    <h2>Contato</h2>
                    <p>(27) 99999-9999</p>
                    <p>(28) 99999-9999</p>
                </div>
            </div>
            <script src="./assests/js/style.js"></script>
        </footer>
        <!-- javascript -->
        
    </body>
</html>
