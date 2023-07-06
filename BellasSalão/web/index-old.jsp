<%-- 
    Document   : index2
    Created on : 23/05/2023, 16:43:32
    Author     : sala303b
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bellas Salão</title>
        <link rel="shortcut icon" href="assests/img/favicon.png" type="image/x-icon">
        <!-- icon -->
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- estilo css -->
        <link rel="stylesheet" href="assests/css/style.css">
    </head>

    <body>
        <header class="l-header" id="header">
            <div class="navbar container flex">
                <div class="brand">
                    <a href="#"><img src="" alt="Bellas SalÃ£o"></a>
                </div>
                <div class="nav" id="nav">
                    <ul class="nav__menu">
                        <li class="nav__item"><a href="#" class="nav__link active-link">home</a></li>
                        <li class="nav__item"><a href="#about" class="nav__link">quem somos</a></li>
                        <li class="nav__item"><a href="#services" class="nav__link">serviÃ§os</a></li>
                        <li class="nav__item"><a href="#package" class="nav__link">pacotes</a></li>
                        <li class="nav__item"><a href="#gallery" class="nav__link">galeria</a></li>
                        <li class="nav__item"><a href="#contact" class="nav__link">contato</a></li>
                        <li class="nav__item"><a href="login.jsp" class="nav__link">login</a></li>
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
                            <h1>Realce sua beleza Ãºnica e deixe-nos<br><span>cuidar de vocÃª</span></h1>
                            <p>Agende seu horÃ¡rio conosco e permita-se um momento exclusivo de cuidado e beleza.</p>
                            <%
                                HttpSession sessao = request.getSession();
                                if (sessao.getAttribute("nome") == null) {
                                    response.sendRedirect("index.jsp");   
                            %>
                            <a id="loginBtn" href="login.jsp" class="btn btn__outline"><i class='bx bxl-whatsapp'></i>Faça o login</a>
                            <%}else{%>
                            
                            <a id="agendaBtn" href="agenda.jsp" class="btn btn__outline" style="display: none;"><i class='bx bxl-whatsapp'></i>Agende seu horário</a>
                            <%}%>
                        </div>
                    </div>
                </div>
            </section>
            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    var loginSucesso = '<%= session.getAttribute("loginSucesso")%>';

                    var agendaBtn = document.getElementById('agendaBtn');
                    var loginBtn = document.getElementById('loginBtn');

                    if (loginSucesso === 'true') {
                        agendaBtn.style.display = 'inline-block';
                        loginBtn.style.display = 'none';
                    } else {
                        agendaBtn.style.display = 'none';
                        loginBtn.style.display = 'inline-block';
                    }
                });
            </script>

            <section class="about section" id="about">
                <div class="container">
                    <div class="row">
                        <div class="section__title">
                            <h1>Nossa histÃ³ria</h1>
                            <span>Bellas SalÃ£o</span>
                        </div>
                        <div class="about__detail">
                            <div class="about__detail__content">
                                <div class="about__img">
                                    <img src="assests/img/HistoriaSalÃ£o.jpeg" alt="">
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
                            <h1>ServiÃ§os</h1>
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
                                <p>depiliaÃ§Ã£o com cera</p>
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
                            <span>Para seu dia de noiva</span>
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
                                    <p class="not">DepilaÃ§Ã£o<span>(1 area)</span></p>
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
                                <button class="btn">quero esse</button>
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
                                    <p>DepilaÃ§Ã£o<span>(1 area)</span></p>
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
                                <button class="btn">quero esse</button>
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
                                    <p>DepilaÃ§Ã£o<span>(1 area)</span></p>
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
                                <button class="btn">quero esse</button>
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
                                    <p>DepilaÃ§Ã£o<span>(1 area)</span></p>
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
                                <button class="btn">quero esse</button>
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
                    <button class="btn">ver mais</button>
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
                    <h1><a href="#"><img src="assests/img/" alt=""></a></h1>
                    <div class="footer__data-social">
                        <a href=""><i class='bx bxl-facebook social__icon'></i></a>
                        <a href=""><i class='bx bxl-instagram social__icon' ></i></a>
                        <a href=""><i class='bx bxl-whatsapp social__icon' ></i></a>
                    </div>
                </div>
                <div class="footer__data">
                    <h2>nosso endereÃ§o</h2>
                    <p>Av. Belo Horizonte, 302<br>Nova Carapina I, Serra - ES</p>
                </div>
                <div class="footer__data">
                    <h2>nosso horario</h2>
                    <p>Segunda Ã¡ SÃ¡bado<br>(ExcessÃ£o de Quarta)<br>das 07:00 as 19:00</p>
                    <br>
                    <p>Quarta<br>das 07:00 as 17:00 </p>

                </div>
                <div class="footer__data">
                    <h2>Contato</h2>
                    <p>(27) 99919-9980</p>
                    <p>(28) 99974-9702</p>
                </div>
            </div>

        </footer>
        <!-- javascript -->
        <script src="assests/js/style.js"></script>
    </body>

</html>