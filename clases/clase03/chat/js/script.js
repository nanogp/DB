window.addEventListener("load", cargarDependencias, false);

function cargarDependencias(dependencias) {

    var dependencias = [
        "https://code.jquery.com/jquery-3.4.1.min.js",
        "./js/jquery.watermark.min.js",
        "https://www.gstatic.com/firebasejs/6.5.0/firebase-app.js",
        "https://www.gstatic.com/firebasejs/6.5.0/firebase-firestore.js",
        "./js/firebase.js",
        "./js/chat.js"
    ].forEach(function (url) {
        var script = document.createElement("script");
        script.src = url;
        document.head.appendChild(script);
    });

}