window.addEventListener("load", cargarDependencias, false);

function cargarDependencias(dependencias) {

    var dependencias = [
        "https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js",
        "./js/jquery.watermark.min.js",
        "./js/chat.js"
    ].forEach(function (url) {
        var script = document.createElement("script");
        script.src = url;
        document.head.appendChild(script);
    });

}