<!DOCTYPE html>
<html lang="pt-br">
<head>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Agende</title>

  <!DOCTYPE html>
  <html lang="pt-br">
  <head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agende seu horario</title>
  
    <link rel="stylesheet" href="agende-mentoria.css">
  
    <link rel="shortcut icon" href="images/schedule.png" type="image/x-icon">
  
    <link href="https://fonts.googleapis.com/css2?family=Staatliches:wght@400;600;700&family=Poppins&display=swap" rel="stylesheet">
  </head>
  <body>
    <div class="page">
      <header>
        <h1>Agendamento</h1>
        <p>Preencha o formulário abaixo para agendar o seu horario</p>
      </header>
  
      <div class="go-home">
        <a 
        href="/explorer_stage03_formulario_mentoria/index.html">
          <img 
          src="images/home.png" 
          alt="">
        </a>
      </div>
  
      <form id="my-form">
  
        <fieldset>
          <div class="fieldset-wrapper">
  
            <legend>Informações Pessoais</legend>
  
            <div class="col-2">
              <div class="input-wrapper">
                <label for="given-name">Nome</label>
                <input 
                  type="text" 
                  id="given-name"
                  required/>
              </div>
              <div class="input-wrapper">
                <label for="given-name">Sobrenome</label>
                <input 
                  type="text" 
                  id="given-name"
                  required/>
              </div>

            </div>
    
            <div class="input-wrapper">
              <label for="event-email">Email <span>(digite um email válido)</span></label>
              <input type="email" id="event-email" />
            </div>
  
  
          </div>
        </fieldset>
  
  
        <fieldset>
          <div class="fieldset-wrapper">
            <legend>Informações do Agendamento</legend>
  
            <div class="input-wrapper">
              <label for="mentor-name">Nome do funcionario</label>
              <input 
                type="text" 
                id="mentor-name"
                required/>
            </div>

            <div class="input-wrapper">
              <label for="mentor-name">Serviço a ser realizado</label>
              <input 
                type="text" 
                id="mentor-name"
                required/>
            </div>
          </div>
        </fieldset>
        <fieldset>
          <div class="fieldset-wrapper">
            <legend>Verificar horários disponíveis</legend>
  
            <div class="session-1">
              <h2>Primeira opcão de horario</h2>
  
              <div class="col-3">
                <div class="input-wrapper">
                  <label for="event-date">Data <span>(DD/MM/AAAA)</span></label>
                  <input type="date" id="event-date" />
                </div>
      
                <div class="input-wrapper">
                  <label for="event-begin">Horario</label>
                  <input type="time" id="event-begin" />
                </div>
  
  
            </div>
  
            <div class="session-2">
              <h2>Segunda opção de horario</h2>
              
              <div class="col-3">
                <div class="input-wrapper">
                  <label for="event-date">Data <span>(DD/MM/AAAA)</span></label>
                  <input type="date" id="event-date" />
                </div>
      
                <div class="input-wrapper">
                  <label for="event-begin">Horario</label>
                  <input type="time" id="event-begin" />
                </div>
  

            </div>
  
          </div>
        </fieldset>
  
  
      </form>
      <footer>
        <button 
          class="button" 
          form="my-form">
          Verificar disponipilidades de horarios e agendar
        </button>
  
        
      </footer>
      
  
    </div>
  </body>
  </html>