window.addEventListener("load", manejador, false);

var dependencias = [
    "https://code.jquery.com/jquery-3.4.1.min.js",
    "https://cdn.jsdelivr.net/npm/image-watermark@0.0.7/watermark.min.js"
    // "https://www.gstatic.com/firebasejs/6.5.0/firebase-app.js",
    // "https://www.gstatic.com/firebasejs/6.5.0/firebase-firestore.js"
].forEach(function (url) {
    var script = document.createElement("script");
    script.src = url;
    document.head.appendChild(script);
});

function manejador() {
    console.info("deps");

    console.info("listeners");
    let imagen = document.getElementById('inputImagen');
    let water = document.getElementById('inputWater');
    let mostrar = document.getElementById('btnMostrar');

    imagen.onchange = guardarImagen;
    water.onchange = guardarWater;
    mostrar.onclick = mostrarImagen;

} function guardarImagen(evento) {
    console.info("guardar");

    var input = evento.target.files;
    if (input && input[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            if (e.target != null) {
                localStorage.imagen = e.target.result;
            }
        };
        reader.readAsDataURL(input[0]);
    }
}


function newImagen(valor) {
    console.info("newImage");

    var img = document.createElement('img');
    img.setAttribute('id', 'imagen');
    img.setAttribute('width', '200');
    img.setAttribute('height', '200');
    img.setAttribute('alt', 'imagen vacia');
    if (valor.match("^data*")) {
        img.setAttribute('src', valor);
    }
    return img;
}

function guardarWater(evento) {
    console.info("water");

    var input = evento.target.files;
    if (input && input[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            if (e.target != null) {
                localStorage.water = e.target.result;
            }
        };
        reader.readAsDataURL(input[0]);
    }
}

function mostrarImagen() {
    console.info("mostrarImagen");
    let div = document.getElementById("imagenProcesada");
    div.innerHTML = "";
    div.appendChild(newImagen(localStorage.imagen));
    div.appendChild(newImagen(localStorage.water));
    // marcaAgua();
}

function marcaAgua() {

}