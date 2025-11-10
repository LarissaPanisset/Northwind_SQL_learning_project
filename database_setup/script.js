let amigos = []; 
let sorteados = []; 

function adicionarAmigo() {
    let nome = document.querySelector('input').value.trim(); 
    
    if (nome === "") {
        alert("Por favor, digite um nome!"); 
    } else {
        if (amigos.includes(nome)) {  
            alert("Esse nome já existe na lista, digite outro nome!"); 
            
            limparCampo(); 
            
            return;  
        } else {
            amigos.push(nome); 
            
            exibirAmigos();  
            
            limparCampo(); 
        }
    }
}

function limparCampo() {
    let nomeInput = document.querySelector('input');  
    
    nomeInput.value = '';  
}

function exibirAmigos() {
    let listaAmigos = document.getElementById("listaAmigos");  
    
    listaAmigos.innerHTML = "";  
    
    for (let i = 0; i < amigos.length; i++) { 
        listaAmigos.innerHTML += "<li>" + amigos[i] + "</li>";  
    }
}

function sortearAmigo() {
    if (amigos.length < 3) {  
        alert("Adicione pelo menos 3 amigos para sortear!"); 
        
        return;  
    }

    if (sorteados.length === amigos.length) {
        document.getElementById('resultado').innerHTML = 
            "<p>Todos os nomes já foram sorteados!</p>";

        resultado.style.display = "block"; 

        document.getElementById('btnOcultar').disabled = true;
        document.getElementById('btnAdicionar').disabled = true;

        return;
}   

    let indiceSorteado;
    let amigoSorteado;
    
    do {
        indiceSorteado = Math.floor(Math.random() * amigos.length); 
        
        amigoSorteado = amigos[indiceSorteado]; 
        
    } while (sorteados.includes(amigoSorteado)); 
    
    sorteados.push(amigoSorteado); 
    
    document.getElementById('resultado').innerHTML = 
        "<p>O amigo sorteado é: <strong>" + amigoSorteado + "</strong></p>";
    
    resultado.style.display = "block"; 

    let botao = document.getElementById('btnOcultar'); 
    botao.disabled = false;           
    botao.innerText = "Ocultar Resultado";
}

function botaoocultar() { 
    let resultado = document.getElementById('resultado'); 
    let botao = document.getElementById('btnOcultar');  
    
    if (resultado.style.display === "none") {   
        resultado.style.display = "block"; 
        botao.innerText = "Ocultar Resultado"; 
    } else {
        resultado.style.display = "none"; 
        botao.innerText = "Mostrar Resultado"; 
    }
}

function reiniciarSorteio() {
    amigos = []; 
    sorteados = []; 

    document.getElementById('resultado').innerHTML = "";
    document.getElementById('listaAmigos').innerHTML = "";

    document.querySelector('input').value = "";

    document.getElementById('btnAdicionar').disabled = false;
    document.getElementById('btnOcultar').disabled = true;

    alert("Sorteio reiniciado! Adicione amigos para sortear.");
}