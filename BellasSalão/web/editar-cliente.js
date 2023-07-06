const allSideMenu = document.querySelectorAll('#sidebar .side-menu.top li a');

allSideMenu.forEach(item=> {
	const li = item.parentElement;

	item.addEventListener('click', function () {
		allSideMenu.forEach(i=> {
			i.parentElement.classList.remove('active');
		})
		li.classList.add('active');
	})
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
	if(window.innerWidth < 576) {
		e.preventDefault();
		searchForm.classList.toggle('show');
		if(searchForm.classList.contains('show')) {
			searchButtonIcon.classList.replace('bx-search', 'bx-x');
		} else {
			searchButtonIcon.classList.replace('bx-x', 'bx-search');
		}
	}
})





if(window.innerWidth < 768) {
	sidebar.classList.add('hide');
} else if(window.innerWidth > 576) {
	searchButtonIcon.classList.replace('bx-x', 'bx-search');
	searchForm.classList.remove('show');
}


window.addEventListener('resize', function () {
	if(this.innerWidth > 576) {
		searchButtonIcon.classList.replace('bx-x', 'bx-search');
		searchForm.classList.remove('show');
	}
})



const switchMode = document.getElementById('switch-mode');

switchMode.addEventListener('change', function () {
	if(this.checked) {
		document.body.classList.add('dark');
	} else {
		document.body.classList.remove('dark');
	}
})

function toggleSenha() {
    var senhaInput = document.getElementById("password");
    var toggleIcon = document.getElementById("toggleIcon");

    if (senhaInput.type === "password") {
      senhaInput.type = "text";
      toggleIcon.classList.remove("fa-eye");
      toggleIcon.classList.add("fa-eye-slash");
    } else {
      senhaInput.type = "password";
      toggleIcon.classList.remove("fa-eye-slash");
      toggleIcon.classList.add("fa-eye");
    }
  }
  function exibirErro(mensagem) {
  // Cria o elemento do pop-up
  var popup = document.createElement("div");
  popup.className = "popup";
  
  // Define o conteúdo do pop-up
  popup.innerHTML = "<span class='close' onclick='fecharPopup()'>×</span>" +
                    "<p>" + mensagem + "</p>";
  
  // Adiciona o pop-up ao corpo do documento
  document.body.appendChild(popup);
  
  // Define o tempo para fechar o pop-up após 3 segundos
  setTimeout(function() {
    fecharPopup();
  }, 3000);
}

function fecharPopup() {
  // Remove o pop-up do corpo do documento
  var popup = document.querySelector(".popup");
  if (popup) {
    popup.remove();
  }
}