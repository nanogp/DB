
function guardarImagen(evento) {
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

function guardarWater(evento) {
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

function newImagen(valor) {
    var img = document.createElement('img');
    img.setAttribute('id', 'imagen');
    img.setAttribute('width', '100');
    img.setAttribute('height', '100');
    img.setAttribute('alt', 'imagen vacia');
    if (valor.match("^data*")) {
        img.setAttribute('src', valor);
    }
    return img;
}

function mostrarImagen() {
    $('#imagenProcesada').createElement(newImagen(localStorage.water));
}