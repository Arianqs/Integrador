<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Controller.metCine"%>
<%@ page import="Model.Pelicula"%>
<%@ page import="Controller.metPeliculas"%>
<%@ page import="Controller.metPeliculasCines"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
  <link rel="icon" href="img/icon.ico"  sizes="32x32"   type="image/x-icon">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" type="text/css" href="css/carteleraa.css">
<link rel="stylesheet" type="text/css" href="css/index.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Cineplanet Perú I Lo mejor del cine y entretenimiento</title>

<style >
.logo-estreno {
    display: inline-block;
    width: 20px; 
    height: 20px; 
    background-image: url('img/logo_estreno.png'); 
    background-size: contain;
    background-repeat: no-repeat;
    margin-left: 5px; 
}

</style>




<script>
    // Función para redirigir según la película
    function checkLogin(tituloPelicula) {
        switch (tituloPelicula) {
            case 'El Plan Del Asesino':
                window.location.href = 'elasesino.jsp';
                break;
            case 'Hellboy: The Crooked Man':
                window.location.href = 'hellboy.jsp';
                break;
            case 'Infierno en Altamar':
                window.location.href = 'infierno.jsp';
                break;
            case 'La Chica del Alquiler':
                window.location.href = 'alquiler.jsp';
                break;
            case 'My Hero Academia: Ahora es tu Turno':
                window.location.href = 'academia.jsp';
                break;
            case 'Beetlejuice Beetlejuice':
                window.location.href = 'Beetlejuice.jsp';
                break;
            case 'Guasón 2: Folie À Deux':
                window.location.href = 'Guasón.jsp';
                break;
            case 'La Sustancia':
                window.location.href = 'sustancia.jsp';
                break;
            case 'No Hables con Extraños':
                window.location.href = 'extraños.jsp';
                break;
            case 'Sube a mi nube':
                window.location.href = 'nube.jsp';
                break;
            case 'Robot Salvaje':
                window.location.href = 'robot.jsp';
                break;
            default:
                alert('No hay página disponible para esta película.');
                break;
        }
    }

    // Función AJAX para obtener las películas filtradas
    function filtrarPeliculas() {
        const cineSeleccionado = $('#cineSeleccionado').val();
        const generoSeleccionado = $('#generoSeleccionado').val();
        
        $.ajax({
            url: './logicajsp/filtropeliculas.jsp',  
            type: 'POST',
            data: {
                cineSeleccionado: cineSeleccionado,
                generoSeleccionado: generoSeleccionado
            },
            success: function(response) {
                $('#contenedorPeliculas').html(response);  
            },
            error: function() {
                alert('Error al cargar las películas.');
            }
        });
    }


    function mostrarTodasLasPeliculas() {
        $('#cineSeleccionado').val(''); 
        $('#generoSeleccionado').val('');
        filtrarPeliculas(); 
    }

    $(document).ready(function() {
        $('#cineSeleccionado, #generoSeleccionado').change(function() {
            filtrarPeliculas();
        });

        $('#btnMostrarTodas').click(function() {
            mostrarTodasLasPeliculas();
        });
    });
</script>



</head>
<body>
	<jsp:include page="/fragmentos/encabezado.jsp" />
<main><br><br>
    <div class="cont-todo-cartelera">
        <div class="header-container">
            <h1 class="nav-title">Películas</h1>
            <ul class="navigation">
                <li><a href="#" class="nav-item active">En cartelera</a></li>
                <li><a href="#" class="nav-item">Próximos estrenos</a></li>
                <li><a href="#" class="nav-item"></a></li>
            </ul>
        </div>
    </div>
</main>

<div class="cont-unido-peliculas">

    <!-- Filtros Acordeón -->
    <div class="cont-filtro-acordeon" style="position: sticky; top: 0;">
        <h3>≡ Filtrar Por:</h3>

        <div class="acordeon-item">
            <button class="acordeon-button" type="button" onclick="toggleAcordeon('acordeonCine')">
                Cine <span>+</span>
            </button>
            <div class="acordeon-content" id="acordeonCine">
                <select name="cineSeleccionado" id="cineSeleccionado">
                    <option value="">Todos los cines</option>
                    <%
                    metCine cineManager = new metCine();
                    List<String> cines = cineManager.obtenerCines();
                    String cineSeleccionado = request.getParameter("cineSeleccionado");
                    for (String cine : cines) {
                        String[] cineData = cine.split(",");
                        String cineId = cineData[0];
                        String cineNombre = cineData[1];
                    %>
                    <option value="<%=cineId%>" <%=cineSeleccionado != null && cineSeleccionado.equals(cineId) ? "selected" : ""%>>
                        <%=cineNombre%>
                    </option>
                    <%
                    }
                    %>
                </select>
            </div>
        </div>

        <div class="acordeon-item">
            <button class="acordeon-button" type="button" onclick="toggleAcordeon('acordeonGenero')">
                Género <span>+</span>
            </button>
            <div class="acordeon-content" id="acordeonGenero">
                <select name="generoSeleccionado" id="generoSeleccionado">
                    <option value="">Todos los géneros</option>
                    <%
                    metPeliculas peliculaManager = new metPeliculas();
                    List<String> generos = peliculaManager.obtenerGeneros();
                    String generoSeleccionado = request.getParameter("generoSeleccionado");
                    for (String genero : generos) {
                    %>
                    <option value="<%=genero%>" <%=generoSeleccionado != null && generoSeleccionado.equals(genero) ? "selected" : ""%>>
                        <%=genero%>
                    </option>
                    <%
                    }
                    %>
                    
                </select>
            </div>
        </div>
    </div>
<br><br>

<div class="cont-cartelera-peli" id="contenedorPeliculas">
    <!-- Aquí se cargarán las películas -->
    <%
     cineSeleccionado = request.getParameter("cineSeleccionado");
     generoSeleccionado = request.getParameter("generoSeleccionado");
     metPeliculasCines relacionManager = new metPeliculasCines();
     List<Pelicula> peliculas = new ArrayList<>();
     List<Pelicula> peliculasEstreno = relacionManager.obtenerPeliculasEnEstreno();
     List<Pelicula> peliculasNormales = new ArrayList<>();

    // Determinar qué películas cargar según el cine o género seleccionado
    try {
        if (cineSeleccionado != null && !cineSeleccionado.isEmpty()) {
            int cineId = Integer.parseInt(cineSeleccionado);
            peliculas = relacionManager.obtenerPeliculasPorCine(cineId);
        } else if (generoSeleccionado != null && !generoSeleccionado.isEmpty()) {
            peliculas = relacionManager.obtenerPeliculasPorGenero(generoSeleccionado);
        } else {
            peliculas = relacionManager.obtenerTodasLasPeliculas();
        }

        // Agregar las películas normales a la lista
        for (Pelicula pelicula : peliculas) {
            if (!peliculasEstreno.contains(pelicula)) {
                peliculasNormales.add(pelicula);
            }
        }

        // Verificar si hay películas en estreno o normales para mostrar
        if (peliculasEstreno.isEmpty() && peliculasNormales.isEmpty()) {
    %>
            <p>No hay películas disponibles para la selección actual.</p>
    <%
        } else {
            // Mostrar películas en estreno
            for (Pelicula pelicula : peliculasEstreno) {
                String tituloPelicula = pelicula.getTitulo();
                String imagenPelicula = pelicula.getImagen();
    %>
                <div class="cont-pelicula">
                    <a href="#" onclick="checkLogin('<%=tituloPelicula%>')">
                        <img src="img/ <%= imagenPelicula != null && !imagenPelicula.isEmpty() ? imagenPelicula : "default.jpg" %>" 
                             alt="Imagen de la Película Detalle" id="vertical-image">
                    </a>
                    <h2>
                        <%=tituloPelicula%>
                        <span class="logo-estreno"></span> <!-- Usar clase para logo de estreno -->
                    </h2>
                    <p>Género: <%=pelicula.getGenero()%></p>
                </div>
    <%
            }

            // Mostrar películas normales
            for (Pelicula pelicula : peliculasNormales) {
                String tituloPelicula = pelicula.getTitulo();
                String imagenPelicula = pelicula.getImagen();
    %>
                <div class="cont-pelicula">
                    <a href="#" onclick="checkLogin('<%=tituloPelicula%>')">
                        <img src="img/<%= imagenPelicula != null && !imagenPelicula.isEmpty() ? imagenPelicula : "default.jpg" %>" 
                             alt="Imagen de la Película Detalle" id="vertical-image">
                    </a>
                    <h2><%=tituloPelicula%></h2>
                    <p>Género: <%=pelicula.getGenero()%></p>
                </div>
    <%
            }
        }
    } catch (Exception e) {
        out.println("<p>Error al cargar las películas: " + e.getMessage() + "</p>");
    }
    %>
</div>
</div>

<div class="movie-container">


    <div class="distributor-restriction-container"><br>
        <p class="distributor-restriction">( R ) Película con restricción del distribuidor:</p>
        <p class="distributor-restrictionn">No válida para promociones, boletos corporativos, ni pases libres.</p>
    </div>
</div>



<script>
function toggleAcordeon(id) {
    const content = document.getElementById(id);
    content.style.display = content.style.display === "none" ? "block" : "none";
}



</script>



	<footer>
		<%@ include file="fragmentos/footer.jsp" %>
	</footer>
	
</body>
</html>