const sign_in_btn = document.querySelector('#sign-in-btn');
const sign_up_btn = document.querySelector('#sign-up-btn');
const container = document.querySelector('.container');

sign_up_btn.addEventListener('click', () => {
    container.classList.add("sign-up-mode")
})

sign_in_btn.addEventListener('click', () => {
    container.classList.remove("sign-up-mode")
})
function goBack() {
    window.history.back();
}
const allSideMenu = document.querySelectorAll('#sidebar .side-menu.top li a');

allSideMenu.forEach(item => {
    const li = item.parentElement;

    item.addEventListener('click', function () {
        allSideMenu.forEach(i => {
            i.parentElement.classList.remove('active');
        })
        li.classList.add('active');
    })
});

// Obtém o elemento do formulário
var form = document.getElementById('login.jsp');

// Adiciona um evento de envio ao formulário
form.addEventListener('submit', function (event) {
    // Verifica se o campo de usuário está vazio
    var usuario = document.getElementById('txtUsuario').value;
    if (usuario.trim() === '') {
        // Impede o envio do formulário
        event.preventDefault();
        // Exibe a mensagem de erro no pop-up
        var errorMessage = 'Usuário inválido!';
        document.getElementById('error-message').textContent = errorMessage;
        document.getElementById('error-popup').style.display = 'block';
        return;
    }

    // Verifica se o campo de senha está vazio
    var senha = document.getElementById('txtSenha').value;
    if (senha.trim() === '') {
        // Impede o envio do formulário
        event.preventDefault();
        // Exibe a mensagem de erro no pop-up
        var errorMessage = 'Senha inválida!';
        document.getElementById('error-message').textContent = errorMessage;
        document.getElementById('error-popup').style.display = 'block';
    }
});





// TOGGLE SIDEBAR
const menuBar = document.querySelector('#content nav .bx.bx-menu');
const sidebar = document.getElementById('sidebar');

menuBar.addEventListener('click', function () {
    sidebar.classList.toggle('hide');
})







const searchButton = document.querySelector('#content nav form .form-input button');
const searchButtonIcon = document.querySelector('#content nav form .form-input button .bx');
const searchForm = document.querySelector('#content nav form');

searchButton.addEventListener('click', function (e) {
    if (window.innerWidth < 576) {
        e.preventDefault();
        searchForm.classList.toggle('show');
        if (searchForm.classList.contains('show')) {
            searchButtonIcon.classList.replace('bx-search', 'bx-x');
        } else {
            searchButtonIcon.classList.replace('bx-x', 'bx-search');
        }
    }
})





if (window.innerWidth < 768) {
    sidebar.classList.add('hide');
} else if (window.innerWidth > 576) {
    searchButtonIcon.classList.replace('bx-x', 'bx-search');
    searchForm.classList.remove('show');
}


window.addEventListener('resize', function () {
    if (this.innerWidth > 576) {
        searchButtonIcon.classList.replace('bx-x', 'bx-search');
        searchForm.classList.remove('show');
    }
})



const switchMode = document.getElementById('switch-mode');

switchMode.addEventListener('change', function () {
    if (this.checked) {
        document.body.classList.add('dark');
    } else {
        document.body.classList.remove('dark');
    }
})

function validatePassword() {
            var passwordInput = document.getElementById("txtSenha");
            var password = passwordInput.value;
            if (password.includes(" ")) {
                showErrorMessage("A senha não pode conter espaços em branco.");
                passwordInput.value = password.replace(/\s/g, "");
            }
        }

        window.onload = function () {
            var closeButtons = document.getElementsByClassName("close");
            for (var i = 0; i < closeButtons.length; i++) {
                closeButtons[i].onclick = function () {
                    var popup = this.parentElement.parentElement;
                    popup.style.display = "none";
                }
            }
        }



