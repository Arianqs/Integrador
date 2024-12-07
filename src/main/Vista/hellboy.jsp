<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Model.Pelicula" %>
<%@ page import="Model.Cines" %>
<%@ page import="Controller.metPeliculasCines" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cineplanet Perú I Lo mejor del cine y entretenimiento</title>
    <link rel="stylesheet" type="text/css" href="css/index.css">
      <link rel="stylesheet" type="text/css" href="css/carteleraa.css">
<link rel="stylesheet" type="text/css" href="css/index.css">
    <link rel="stylesheet" type="text/css" href="css/inicio.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
      <link rel="icon" href="img/icon.ico"  sizes="32x32"   type="image/x-icon">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <%@ include file="logicajsp/logica_combobox.jsp" %>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style type="text/css">
       body {
            margin: 0;
            padding: 0;
            overflow-x: hidden;
        }
        .navbar {
            background-color: rgba(0, 0, 0, 0.5);
            position: absolute;
            width: 100%;
            z-index: 1000;
            display: flex;
            justify-content: flex-start;
            align-items: center;
            border-bottom: 1px solid #DEDFE3;
            padding-left: 10px;
        }

        .carousel-item {
            height: 60vh;
            background-size: cover;
            background-position: center;
        }

        .carousel-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .carousel-caption {
            position: absolute;
            bottom: 20%;
            left: 10%;
            text-align: left;
        }
        .carousel-caption h1 {
            font-family: 'Montserrat', sans-serif;
            font-size: 64px;
            font-weight: 800;
            line-height: 64px;
            position: relative;
            z-index: 2;
            padding: 3px 5px;
            line-height: 1;
            display: inline-block;
            color: white;
        }

        .carousel-caption p {
            font-size: 1.2rem;
            padding: 10px;
        }

        .btn-comprar {
            background-color: #cd2906;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 25px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-decoration: none;
            display: inline-block;
        }

        .navbar-brand img {
            height: 40px;
        }

        .navbar {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .navbar-nav {
            gap: 40px;
        }
        .navbar-brand {
            gap: 40px;
        }

        .navbar-brand img {
            display: inline-block;
        }
        .navbar-nav li {
            display: inline-block;
            margin: 0 5px;
        }

        .navbar-brand {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
            gap: 17px;
            margin-left: 40px;
            justify-content: center;
            align-items: center;
            font-family: Arial, sans-serif;
            height: 50px;
        }
        .highlight {
            background-color: #e80444;
            padding: 3px 5px;
            line-height: 1;
            display: inline-block;
            color: white;
        }

        .icon {
            width: 40px;
            height: 33px;
        }

        .filter-bar {
            background-color: #f8f9fa;
            padding: 20px;
            margin-bottom: 30px;
            display: flex;
            justify-content: space-between;
        }

        .filter-bar select {
            margin-right: 10px;
            padding: 10px;
            font-size: 14px;
        }

        .movie-section {
            padding: 20px;
        }


        .movie-grid {
            display: flex;
            gap: 15px;
        }

        .movie-item {
            position: relative;
            flex: 1;
        }

        .movie-item img {
            width: 100%;
            height: auto;
            display: block;
        }

        .movie-item .label {
            position: absolute;
            top: 10px;
            left: 10px;
            background-color: red;
            color: white;
            padding: 5px 10px;
            font-size: 0.8rem;
            font-weight: bold;
            text-transform: uppercase;
        }

        .movie-options {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
            font-size: 1.2rem;
        }

        .movie-options a {
            text-decoration: none;
            color: #000;
            margin-right: 20px;
        }

        .movie-options a.active {
            color: red;
            font-weight: bold;
        }

        .more-movies {
            background-color: #ff0066;
            color: white;
            text-align: center;
            padding: 20px;
            font-size: 1.5rem;
            font-weight: bold;
        }

        .cartelera-container {
            width: 50%;
            margin: auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
        }

        .pestanas a {
            margin: 10px;
            text-decoration: none;
            font-weight: bold;
            color: #333;
            border-bottom: 2px solid transparent;
            padding: 5px;
        }

        .pestana-activa {
            border-color: #e60033;
        }
        .cartelera-grid {
            display: grid;
            grid-template-columns: 1fr 1fr 1fr;
            grid-template-rows: auto auto auto;
            gap: 10px;
        }

        .pelicula-destacada {
            grid-column: span 1;
        }

        .pelicula {
            position: relative;
        }

        .pelicula-imagen {
            width: 100%;
            height: auto;
            object-fit: cover;
        }

        .pelicula-imagen {
            width: 90%;
            height: auto;
            object-fit: cover;
        }

        .ver-mas-container {
            grid-column: 3;
            text-align: center;
        }

        .pelicula {
            text-align: center;
            border-radius: 0px;
            overflow: hidden;
        }

        .pelicula:hover {
            transform: scale(1.05);
        }

        .pelicula img {
            width: 100%;
            height: auto;
        }

        .ver-mas-container {
            text-align: center;
            margin-top: 7px;
        }
        .boton-ver-mas {
            background-color: #e60033;
            color: #fff;
            border: none;
            font-size: 30px;
            font-weight: bold;
            text-align: center;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            display: inline-block;
            width: 100%;
        }

        .boton-ver-mas:hover {
            background-color: #cc002d;
        }

        .card {
            padding: 80px;
            display: flex;
            align-items: center;
            justify-content: center;
            position: static;
            opacity: 1;
            background: none;
            border: none;
        }

        .card-image {
            width: 200px;
            height: auto;
        }

        .info {
            padding: 30px;
            background-color: #f8f8f8;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        h1 {
            color: #004A8C;
            font: 800 50px / 1.08 "Montserrat", sans-serif;
            margin: 0;
            font-size: 34px;
            margin-bottom: 15px;
            justify-content: center;
        }

        p {
            color: #333;
            font-size: 1.1em;
            margin-bottom: 20px;
            font-size: 14px;
            justify-content: center;
        }

        p a {
            color: #003c84;
            text-decoration: none;
            font-weight: bold;
        }

        p a:hover {
            text-decoration: underline;
        }

        .buttons {
            display: flex;
            gap: 15px;
        }

        .btn {
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 1em;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .btn-red {
            background-color: #d22130;
            color: white;
            border-radius: 25px;
        }

        .btn-red:hover {
            background-color: #a51725;
        }

        .btn-outline {
            background-color: transparent;
            color: #003c84;
            border: 2px solid #003c84;
            border-radius: 25px;
        }

        .btn-outline:hover {
            background-color: #003c84;
            color: white;
        }

        img-fluid {
            max-width: auto;
            height: auto;
        }
.texto {
            position: relative;
            width: 100%;
            height: 50vh;
            overflow: hidden;
            background-color: black; /* Fondo completamente negro */
               display: flex;
      align-items: center;
            justify-content: center;
            cursor: pointer;
           
        }
.video-background {
    position: absolute;
    top: 50%; /* Centrar verticalmente */
    left: 50%; /* Centrar horizontalmente */
    width: 50%; /* Ocupa el ancho completo */
    height: 10%; /* Ocupa el alto completo */
    max-width: 300px; /* Ajusta el ancho máximo que desees */
 top: 1%;
    object-fit: cover; /* Cubre el área manteniendo la proporción */
    transform: translate(-50%, -50%); /* Centra el video */
    display:none;
   
}

        .contenido {
            position: relative;
            z-index: 1; /* Asegura que el contenido esté encima del video */
            color: white; /* Cambia el color del texto según sea necesario */
            text-align: center; /* Centra el texto */
            padding: 20px;
        }

  .play-button {
            position: relative;
            background: rgba(0, 0, 0, 0.5);
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 18px;
            font-family: Arial, sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 1;
            cursor: pointer;
        }
         /* Estilo del iframe de YouTube (oculto al inicio) */
        .video-frame {
            display: none; /* Oculto hasta hacer clic */
            width: 50%;
            height: 50%;
        }

        h1 {
            color: #004A8C;
            font-size: 28px;
            font-weight: 700px;
            line-height: 1.14;
            text-align: center;
        }

        .btn-custom {
            background-color: #e60033;
            color: white;
            font-size: 18px;
            padding: 10px 30px;
            border-radius: 50px;
            border: none;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }
		.cont-filtro-acordeon {
		    width: 400px;
		    padding: 5px;
		    margin: 0;
		    border: none;
		    position: absolute;
		    top: 590px;
		    left: 50%;
		    transform: translateX(-50%);
		}
		      body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
        }
        .container {
            display: flex;
            gap: 20px;
            max-width: 900px;
            margin: auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
               box-shadow: 40px 40px 0 -20px #004A8C;
        }
        .movie-title {
           color: #004A8C;
  			  font: 800 40px / 1.0666 "Montserrat", sans-serif;
 		   text-align: left;
  			 margin-left: 30%;
        }
        .rating {
            font-size: 24px;
            color: #ff1c43;
        }
        .tagline {
            color: gray;
            font-size: 14px;
            margin-top: -10px;
        }
        .details {
            font-size: 14px;
            margin: 10px 0;
            color: #000;
            font: 0 ;
        }
        .btn-comprar {
            background-color: #e60033;
            color: white;
            padding: 10px 20px;
            border-radius: 20px;
            text-decoration: none;
            font-weight: bold;
            margin-left:230px;
        }

        /* Sección de la izquierda (póster) */
        .poster-container {
            position: relative;
            width: 40%;
        }
        .poster {
            width: 100%;
            border-radius: 0px;
        }
        .tag {
            position: absolute;
            top: 10px;
            left: 10px;
            background-color: #e60033;
            color: white;
            padding: 5px 10px;
            border-radius: 4px;
            font-size: 14px;
            font-weight: bold;
        }

        /* Sección de la derecha (sinopsis y detalles) */
        .info-container {
            width: 60%;
        }
        .synopsis-title {
            color: #004A8C;
		    font: 800 50px / 1.0666 "Montserrat", sans-serif;
		    text-align: left;
		    margin-left: 7%;
        }
        .funcion{
          color: #004A8C;
		    font: 800 50px / 1.0666 "Montserrat", sans-serif;
		    text-align: left;
		    margin-left: 30%;
		    margin-top:10%;
        }
        .synopsis-text {
           font: 16px / 1.5 "Lato", sans-serif;
            color: #333;
            margin-bottom: 20px;
             text-align: left;
		    margin-left: 7%;
		    margin-top:5%;
        }
        .info-section {
           font: 16px / 1.5 "Lato", sans-serif;
            color: #333;
            margin-bottom: 10px;
               text-align: left;
		    margin-left: 7%;
		    margin-top:5%;
        }

        .language, .available {
            display: inline-block;
            background-color: #f1f1f1;
            color: #333;
            padding: 5px 10px;
            margin: 5px 5px 5px 0;
            border-radius: 5px;
            font: 16px / 1.5 "Lato", sans-serif;
        }
		.combobox-item {
    display: flex;
    flex-direction: column;
    gap: 0px;
}
.label {
    font-weight: 800;
    font-size: 20px;
    top: 3px;
}
.filter-container {
		display: flex;
        gap: 20px;
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        align-items: center;
        justify-content: center;
        max-width:44%;
        margin-left:30%;
  
}
	select {
    width: 203px;
    height: 45px;
    padding: 5px 10px;
    font-size: 16px;
    border: rgba(255, 255, 255, 0);
    border-radius: 8px;
    cursor: pointer;
    transition: all 0.3s ease;
    margin: 0;
    transform: translateX(-10px);
}	
.btn{
background-color: #e60033;
    color: white;
    font-size: 18px;
    padding: 10px 30px;
    border-radius: 50px;
    border: none;
    cursor: pointer;
    display: inline-flex;
    align-items: center;
    margin-left:1000px;
}
    </style>
    <script>
    $(document).ready(function() {
        // Cargar los cines cuando se selecciona una ciudad
        $('#ciudad').change(function() {
            var ciudad = $(this).val();
            if (ciudad) {
                $.ajax({
                    url: 'logicajsp/get_cines.jsp',
                    type: 'GET',
                    data: { ciudad: ciudad },
                    success: function(data) {
                        $('#cine').html(data);
                    }
                });
            } else {
                $('#cine').html('<option value="">Elige tu cine favorito</option>');
                $('#sala').html('<option value="">Elige la sala</option>'); // Reinicia la sala
            }
        });

        // Cargar las salas cuando se selecciona un cine
        $('#cine').change(function() {
            var cine = $(this).val();
            if (cine) {
                $.ajax({
                    url: 'logicajsp/get_salas.jsp',
                    type: 'GET',
                    data: { cine: cine },
                    success: function(data) {
                        $('#sala').html(data);
                    }
                });
            } else {
                $('#sala').html('<option value="">Elige la sala</option>'); // Reinicia la sala
            }
        });
    });

   
    </script>
</head>
<body>
    <!-- Navbar transparente -->
        <nav class="navbar navbar-expand-lg navbar-dark">
            <div class="container-fluid d-flex justify-content-center">

                <!-- Menú centrado -->
                <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
                    <ul class="navbar-nav">
                        <!-- Logo centrado -->
                        <a class="navbar-brand" href="index.jsp">
                            <img src="img/logo_transparente.png" alt="Cineplanet Logo">
                        </a>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="cartelera.jsp">Películas</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="cine.jsp">Cines</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="promociones.jsp">Promociones</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="dulceria.jsp">Dulcería</a>
                        </li>


                        <li class="nav-item">
                            <a href="loginusuario_intranet.jsp" class="icon navbar-nav">
                                <img src="img/user.png" alt="Iniciar sesión" />
                            </a></li>
                        <li class="nav-item">
                            <a href="contactanos.jsp" class="icon navbar-nav">
                                <img src="img/iconContactoo.png" alt="Contactanos"  />
                            </a></li>
                    </ul>
                </div>
            </div>
        </nav>
<div class="texto" onclick="showVideo()">
    <img src="https://www.youtube.com/embed/0gcTY9h1QSE"" alt="Mira el trailer" class="video-background">
    <div class="play-button">▶ Mira el trailer</div>
</div>
<script>
    function showVideo() {
        const container = document.querySelector('.texto');
        container.innerHTML = `
            <iframe 
                width="50%" 
                height="85%" 
                src="https://www.youtube.com/embed/0gcTY9h1QSE" 
                frameborder="0" 
                allow="autoplay; encrypted-media" 
                allowfullscreen 
                style="margin-top: 50px;"
            ></iframe>
        `;
    }
</script>

<br><br><br>
<%
    metPeliculasCines metodos = new metPeliculasCines();
    Pelicula pelicula = metodos.getPeliculaPorNombre("Hellboy: The Crooked Man");
    String imagenPelicula = (pelicula != null) ? pelicula.getImagen() : "default.jpg"; 
    
%>


   <br><br>
   <div class="movie-title"><%= pelicula != null ? pelicula.getTitulo() : "Título no disponible" %> <span class="rating"></span> <a href="#" class="btn-comprar" onclick="scrollToSelect()">Comprar</a>
       <div class="details">Acción | 1hrs 40min | +14</div>
  </div><br><br><br><br>
<div class="container">
    <div class="poster-container">
        <img src="img/<%= imagenPelicula %>" alt="Imagen de la Película Detalle" class="poster">
       
    </div>

    <div class="info-container">
        <div class="synopsis-title">Sinopsis.</div>
        <p class="synopsis-text">
            <%= pelicula != null ? pelicula.getSinopsis() : "Sinopsis no disponible" %>
        </p>

        <div class="info-section">
            <span class="label">Director:</span> <%= pelicula != null ? pelicula.getDirector() : "Información no disponible" %>
        </div>
        <div class="info-section">
            <span class="label">Idioma:</span>
            <span class="language"><%= pelicula != null ? pelicula.getIdioma() : "Información no disponible" %></span>
        </div>
        <div class="info-section">
            <span class="label">Disponible:</span>
            <span class="available">2D</span>
            <span class="available">REGULAR</span>
            <span class="available">3D</span>
        </div>
    </div>
</div>

  <div class="funcion">La función perfecta para ti..</div><br><br>
        <div class="filter-container"  id="selectSection">

            <div class="combobox-item">
                <label for="ciudad" class="label" >Por ciudad:</label>
                <select id="ciudad" name="ciudad">
                    <option value="">Donde estás</option>
                    <%
                        List<String> listaCiudades = metodos.obtenerCiudadesPorPelicula("Hellboy: The Crooked Man");
                        for (String ciudad : listaCiudades) {
                    %>
                        <option value="<%= ciudad %>"><%= ciudad %></option>
                    <% } %>
                </select>
            </div>

           <div class="combobox-item">
			    <label for="cine" class="label"> Por cine:</label>
			    <select id="cine" name="cine">
			        <option value="">Elige tu cineplanet</option>
			        <%
			            String ciudadParam = request.getParameter("ciudad");
			            if (ciudadParam != null && !ciudadParam.isEmpty()) {
			                List<Cines> listaCines = metodos.obtenerCinesPorCiudad(ciudadParam);
			                for (Cines cine : listaCines) {
			        %>
			                    <option value="<%= cine.getNombre_cine() %>"><%= cine.getNombre_cine() %></option>
			        <%
			                }
			            } else {
			        %>
			                <option value="">No se ha seleccionado ninguna ciudad</option>
			        <%
			            }
			        %>
			    </select>
			</div>


            <div class="combobox-item">
                <label for="horario" class="label" >Por horario:</label>
                <select id="horario" name="horario">
                    <option value="">Elige tu mejor horario</option>
                    <%
                        List<String> listaHorarios = metodos.obtenerHorariosPorPelicula(5);
                        for (String horario : listaHorarios) {
                    %>
                        <option value="<%= horario %>"><%= horario %></option>
                    <% } %>
                </select>
            </div>

            <div class="combobox-item">
                <label for="sala" class="label">Por sala:</label>
                <select id="sala" name="sala">
                    <option value="">Elige la sala</option>
                </select>
            </div>
        </div>
        <input type="hidden" id="salaId" name="salaId" value=""><br><br>
    <button type="button" id="continuarButton" class="btn" onclick="continuar()">Continuar</button>

       <script>
            // Modificar la función continuar para incluir el ID de la sala
            function continuar() {
                var cine = document.getElementById('cine').value;
                var horario = document.getElementById('horario').value;
                var sala = document.getElementById('sala').value; // Obtener el valor de la sala
                var fecha = new Date().toISOString().split('T')[0];
                var pelicula = "Hellboy: The Crooked Man";
                var imagenPelicula = "<%= imagenPelicula %>";

                if (cine && horario && sala) { // Validar que se seleccionen cine, horario y sala
                    window.location.href = 'butacas.jsp?cine=' + encodeURIComponent(cine) +  
                                            '&horario=' + encodeURIComponent(horario) + 
                                            '&fecha=' + encodeURIComponent(fecha) + 
                                            '&pelicula=' + encodeURIComponent(pelicula) +
                                            '&imagen=' + encodeURIComponent(imagenPelicula) +
                                            '&sala=' + encodeURIComponent(sala); // Pasar el ID de la sala
                } else {
                    alert("Por favor, selecciona un cine, un horario y una sala.");
                }
            }
        </script>
            <script>
    function scrollToSelect() {
        document.getElementById('selectSection').scrollIntoView({ behavior: 'smooth' });
    }
</script>
    </form>
</div>
        </div><br><br>
    	<footer>
		<%@ include file="fragmentos/footer.jsp" %>
	</footer>
	
</body>
</html>
