<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>SISEC - LOADING</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        /* Estilos CSS para a tela de loading */
        body {
            background: pink;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            padding: 0;
            margin: 0;
        }

        .loading-bar {
            width: 100%;
            height: 4px;
            background-color: #e0e0e0;
            position: fixed;
            top: 0;
            left: 0;
        }

        .loading-progress {
            height: 100%;
            background-color: #ff3d00;
            transition: width 1s ease-in-out;
            position: relative;
        }

        .loading-progress::after {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(to right, rgba(255, 255, 255, 0.5) 0%, rgba(255, 255, 255, 0) 100%);
            animation: shine 1.5s linear infinite;
        }

        @keyframes shine {
            0% {
                left: -100%;
            }
            100% {
                left: 100%;
            }
        }

        .loading-text {
            font-family: "Poppins", sans-serif;
            font-size: 24px;
            font-weight: 500;
            color: #333333;
            margin-top: 20px;
        }

        .loading-spinner {
            width: 40px;
            height: 40px;
            border: 4px solid #ffffff;
            border-top: 4px solid #ff3d00;
            border-radius: 50%;
            animation: spin 1s linear infinite;
            margin-top: 20px;
        }

        @keyframes spin {
            0% {
                transform: rotate(0deg);
            }
            100% {
                transform: rotate(360deg);
            }
        }
    </style>
</head>
<body>
<div class="loading-bar">
    <div class="loading-progress"></div>
</div>
<h1 class="loading-text">Carregando...</h1>
<div class="loading-spinner"></div>

<script>
    // Mostrar a notificação após o carregamento da página
    document.addEventListener('DOMContentLoaded', function () {
        var loadingProgress = document.querySelector('.loading-progress');
        var loadingText = document.querySelector('.loading-text');
        showNotification();

        // Atualizar a barra de progresso a cada 10ms (100 vezes em 1 segundo)
        var width = 0;
        var interval = setInterval(function () {
            width++;
            loadingProgress.style.width = width + '%';

            // Quando a barra de progresso estiver completa (100%)
            if (width >= 100) {
                clearInterval(interval);
                loadingText.textContent = 'Concluído!';
                setTimeout(function () {
                    window.location.href = '${target}';
                }, 1000); // Alterado para 1 segundo
            }
        }, 10); // Alterado para 10ms
    });

    function showNotification() {
        if (!('Notification' in window)) {
            alert('Seu navegador não suporta notificações.');
        } else if (Notification.permission === 'granted') {
            displayNotification();
        } else if (Notification.permission !== 'denied') {
            Notification.requestPermission(function (permission) {
                if (permission === 'granted') {
                    displayNotification();
                }
            });
        }
    }

    function displayNotification() {
        var messages = [
            'Bem-vindo!',
            'Aguarde um momento...',
            'Carregando seus dados...',
            'Quase lá!',
            'Prepare-se para uma incrível experiência!',
            'Aguarde enquanto preparamos tudo para você.',
            'Aproveite o tempo para relaxar.',
            'Carregando... Por favor, tenha paciência.'
        ];

        var randomIndex = Math.floor(Math.random() * messages.length);
        var randomMessage = messages[randomIndex];

        var notification = new Notification('Sucesso', {
            body: randomMessage,
            icon: 'img/baseline_done_black_24dp.png' // Substitua pelo URL do ícone desejado
        });

        notification.onclick = function () {
            window.focus();
            this.close();
        };
    }
</script>

</body>
</html>
