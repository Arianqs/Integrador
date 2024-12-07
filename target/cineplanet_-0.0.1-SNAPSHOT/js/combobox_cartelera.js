function cargarPeliculas() {
    console.log("Cargar películas...");
    filtrarPeliculas();  // Llama a la función AJAX para filtrar películas
}

document.addEventListener("DOMContentLoaded", function() {
    const cineSelect = document.getElementById("cineSeleccionado");
    const generoSelect = document.getElementById("generoSeleccionado");

    cineSelect.addEventListener("change", cargarPeliculas);
    generoSelect.addEventListener("change", cargarPeliculas);
});
