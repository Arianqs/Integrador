<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Controller.metCine"%>
<%@ page import="Model.Pelicula"%>
<%@ page import="Controller.metPeliculas"%>
<%@ page import="Controller.metPeliculasCines"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registrate</title>
    <%@ include file="logicajsp/logicalogin_intranet.jsp" %>
<link rel="stylesheet" type="text/css" href="css/carteleraa.css">
<link rel="stylesheet" type="text/css" href="css/index.css">
    <link rel="stylesheet" type="text/css" href="css/inicio.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
      <link rel="icon" href="img/icon.ico"  sizes="32x32"   type="image/x-icon">
</head>
   <style>
    body {
      margin: 0;
      padding: 0;
          background-color: #F6F6F6;
    }
/* Hacer que el navbar sea transparente y ajustarlo a la derecha */
.navbar {
  background-color: rgba(0, 0, 0, 0.5); /* Fondo semi-transparente */
  position: absolute;
  width: 100%;
  z-index: 1000; /* Para que siempre esté sobre el carrusel */
  display: flex;
  justify-content: center;
  align-items: center;
  border-bottom: 1px solid #DEDFE3;
  padding-left: 100px; /* Ajusta este valor según la cantidad que quieras mover */
}
.carousel-item {
  height: 65vh; /* Mantén esto si deseas que las imágenes ocupen el 60% de la pantalla */
  background-size: cover;
  background-position: center;
}

.carousel-item img {
  width: 100%; /* Asegura que las imágenes ocupen el ancho completo */
  height: 100%; /* Asegura que las imágenes llenen la altura del contenedor */
  object-fit: cover; /* Ajusta las imágenes para que cubran el área sin distorsión */
}


    /* Estilo para el contenido del carrusel */
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
    padding: 3px 5px; /* Espacio alrededor de la letra */
    line-height: 1; /* Reduce la altura de la línea para que el fondo quede ajustado */
    display: inline-block; /* Asegura que el fondo se ajuste solo a la letra */
    color: white; /* Cambia el color de la letra si es necesario */
	}

    .carousel-caption p {
      font-size: 1.2rem;

      padding: 10px;
    }

    .btn-comprar {
      background-color: #cd2906; /* Color de fondo */
    color: white;              /* Color del texto */
    border: none;              /* Sin borde */
    padding: 10px 20px;       /* Espaciado interno */
    font-size: 16px;          /* Tamaño de fuente */
    border-radius: 25px;      /* Bordes redondeados */
    cursor: pointer;           /* Cambia el cursor a puntero */
    transition: background-color 0.3s ease; /* Efecto de transición */
    text-decoration: none;     /* Quita el subrayado */
    display: inline-block;     /* Hace que el botón se comporte como un bloque */
    }

    .navbar-brand img {
      height: 40px;
    }

    /* Centrando el navbar, incluyendo el logo */
    .navbar {
      display: flex;
      justify-content: center; /* Centramos todos los elementos horizontalmente */
      align-items: center;     /* Alineamos verticalmente los elementos */
    }


    .navbar-nav {
    gap: 40px; /* Reducir o eliminar el espacio entre los elementos del menú */
}
.navbar-brand {
    gap: 10px; /* Disminuir el espacio entre el logo y otros elementos */
}

    }
.navbar-brand img {
    display: inline-block; /* Mantener el logo alineado con los otros elementos */
}
.navbar-nav li {
    display: inline-block; /* Alinear los ítems del menú */
    margin: 0 5px; /* Ajusta el margen entre los elementos */
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
    background-color: #e80444; /* Fondo rojo semi-transparente */
    padding: 3px 5px; /* Espacio alrededor de la letra */
    line-height: 1; /* Reduce la altura de la línea para que el fondo quede ajustado */
    display: inline-block; /* Asegura que el fondo se ajuste solo a la letra */
    color: white; /* Cambia el color de la letra si es necesario */
    
}
		.icon{
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

        .movie-title {
            font-size: 2.5rem;
            font-weight: bold;
            color: #cccccc;
            margin-bottom: 20px;
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
    grid-column: span 1; /* La película destacada ocupa una sola columna */
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
    grid-column: 3; /* El botón ocupa las tres columnas al final */
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
    font-weight: bold; /* Hace el texto grueso */
    text-align: center; /* Centra el texto */
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    display: inline-block; /* Asegura que el botón sea tratable como bloque */
    width: 100%; /* Asegura que el texto esté centrado dentro del botón */
}

.boton-ver-mas:hover {
    background-color: #cc002d;
}


.container {
    display: flex;
    background-color: white;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    max-width: 800px; /* Ancho máximo del contenedor */
    width: 100%; /* Ancho del contenedor */
    box-shadow: 22px 23px 0 -12px #004A8C; /* Sombra */
    align-items: center; /* Alineación vertical */
    justify-content: center; /* Alineación horizontal */
    margin: 10px auto; /* Centra el contenedor horizontalmente */
}


.card {
    padding: 80px;
    display: flex;
    align-items: center;
    justify-content: center;
    position: static;
    opacity: 1;
    background: none; /* O usa background-color: transparent; */

    border: none; /* Elimina el borde de la tarjeta */


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
 color:#D6D7DA;
    font: 900 60px / 1.0666 "Montserrat", sans-serif;

 
}

p {
    color: ##FFFFFF;
    font-size: 1.1em;
    margin-bottom: 20px;
}

p a {
    color: #FFFFFF;
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
}

.btn-red:hover {
    background-color: #a51725;
}

.btn-outline {
    background-color: transparent;
    color: #003c84;
    border: 2px solid #003c84;
}

.btn-outline:hover {
    background-color: #003c84;
    color: white;
}

.filter-container {
    display: flex; /* Elementos en fila */
    align-items: center; /* Alineación vertical */
    justify-content: space-between; /* Espacio entre selectores */
    max-width: 50%; /* Ancho máximo del contenedor */
    margin: 0 auto; /* Centrado horizontal */
    padding: 10px; /* Espaciado interno */
    border: 1px solid rgba(160, 166, 171, 0.5); /* Borde semi-transparente */
    background-color: rgba(255, 255, 255, 0.6); /* Fondo semi-transparente */
    border-radius: 0; /* Bordes cuadrados */
    box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1); /* Sombra sutil */
    position: relative; /* Posición relativa */
    backdrop-filter: blur(8px); /* Desenfoque de fondo */
    background-color: #FFFFFF;
        box-shadow: 0 0 25px 3px rgba(0, 0, 0, 0.166);
}


filter-container select {
    flex: 1; /* Todos los selectores ocupan el mismo espacio */
    padding: 10px; /* Espaciado interno */
    border: none; /* Sin bordes individuales */
    text-align: center; /* Texto centrado */
    font-size: 16px; /* Tamaño del texto */
    background: transparent; /* Fondo transparente */
    color: #000; /* Texto en negro */
    outline: none; /* Sin contorno al enfocar */
}

.filter-container select:not(:last-child) {
    border-right: 1px solid rgba(160, 166, 171, 0.5); /* Línea de separación entre selects */
}

        /* Elementos de los filtros */
        .combobox-item {
            display: flex;
            flex-direction: column;
            gap: 0px;
        }

      /* Select personalizado */
select {
    width: 203px;
    height: 45px;
    padding: 5px 10px;
    font-size: 16px;
    border: rgba(255, 255, 255, 0);
    border-radius: 8px;

    cursor: pointer;
    transition: all 0.3s ease;
    margin: 0; /* Quita cualquier margen */
    transform: translateX(-10px); /* Ajusta este valor según sea necesario */
}



        /* Opciones de vista: Lista / Mapa */
        .view-options {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .view-btn {
            background: none;
            border: none;
            font-weight: bold;
            cursor: pointer;
            padding: 10px;
            font-size: 14px;
        }

        .view-btn.active {
            color: #1a1a1a;
        }

        .view-btn.disabled {
            color: lightgray;
            cursor: not-allowed;
        }

        /* Línea divisoria entre selectores */
        .divider {
            width: 1px;
            height: 40px;
            background-color: #d3d3d3;
        }
.label {
    font-weight: 800; 
    font-size: 20px; 
    top: 3px;
}

  </style>
<body>

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
            url: './logicajsp/filtropeliculas.jsp',  // Aquí llamamos a una página JSP que maneje la lógica de filtrado
            type: 'POST',
            data: {
                cineSeleccionado: cineSeleccionado,
                generoSeleccionado: generoSeleccionado
            },
            success: function(response) {
                $('#contenedorPeliculas').html(response);  // Actualizamos la sección de películas
            },
            error: function() {
                alert('Error al cargar las películas.');
            }
        });
    }

    // Función para mostrar todas las películas
    function mostrarTodasLasPeliculas() {
        $('#cineSeleccionado').val(''); // Limpiar el filtro de cine
        $('#generoSeleccionado').val(''); // Limpiar el filtro de género
        filtrarPeliculas(); // Llamar a la función para actualizar la lista sin filtros
    }

    // Escuchar cambios en los selectores
    $(document).ready(function() {
        $('#cineSeleccionado, #generoSeleccionado').change(function() {
            filtrarPeliculas();
        });

        // Escuchar el botón para mostrar todas las películas
        $('#btnMostrarTodas').click(function() {
            mostrarTodasLasPeliculas();
        });
    });
</script>


<!-- Navbar transparente -->
<nav class="navbar navbar-expand-lg navbar-dark">
  <div class="container-fluid d-flex justify-content-center">

    
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    
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

<!-- Carrusel -->
<div id="movieCarousel" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <!-- Slide 1: My Hero Academia -->
    <div class="carousel-item active" style="background-image: url('https://cdnpe.cineplanet.com.pe/assets/3cade792-18fe-48dc-91dc-2ad566b4c632');">
    <div class="carousel-caption d-none d-md-block">
        <h1>
            <span class="highlight">My her</span>o  <br>academia:<br> Ahora es tu<br> turno
        </h1>
        <p>Izuku Midoriya aspira a ser el mejor héroe posible y se enfrenta <br>al villano que imita al héroe que una vez admiró.</p>
        <a href="#" class="btn-comprar">Comprar</a>
    </div>
</div>

    
     <div class="carousel-item" style="background-image: url('https://cdnpe.cineplanet.com.pe/assets/43dff962-e51f-44c9-a41b-6d534937f9c1');">
      <div class="carousel-caption d-none d-md-block">
     <h1> 
     <span class="highlight">Hellbo</span>y: The<br> Crooked Man
     
      </h1>
        <p>Hellboy y un agente novato del BPRD se quedan varados en los<br> Apalaches rurales de los años cincuenta.</p>
        <a href="#" class="btn-comprar">Comprar</a>
      </div>
    </div>
    
    <!-- Slide 2: Otra Película -->
    <div class="carousel-item" style="background-image: url('https://cdnpe.cineplanet.com.pe/assets/fa25e6a0-ec84-4c38-bbc7-c9ec8763f9c3');">
      <div class="carousel-caption d-none d-md-block">
        <h1>
        <span class="highlight"> Robot</span> Salvaje
        </h1>
        <p>Tras un naufragio, un robot inteligente llamado Roz queda<br> varado en una isla deshabitada. </p>
        <a href="#" class="btn-comprar">Comprar</a>
      </div>
    </div>
    <!-- Slide 3: Película 3 -->
    <div class="carousel-item" style="background-image: url('https://cdnpe.cineplanet.com.pe/assets/ac0c40ef-4d4e-4219-8781-a7b8db9ebf38');">
      <div class="carousel-caption d-none d-md-block">
        <h1>
        <span class="highlight">  El plan</span> del<br> asesino
        </h1>
        <p>John Knox, un asesino ha sido diagnosticado con demencia <br>progresiva intentará redimirse de su obscuro pasado.</p>
        <a href="#" class="btn-comprar">Comprar</a>
      </div>
    </div>
    <!-- Slide 4: Película 4 -->
    <div class="carousel-item" style="background-image: url('https://cdnpe.cineplanet.com.pe/assets/791498b4-a674-49f8-b354-a2c610bbeb55');">
      <div class="carousel-caption d-none d-md-block">
        <h1>
         <span class="highlight"> La Chi </span>ca del<br> Alquiler 
        </h1>
        <p>Después de que Lorena le deja plantado ante el altar, Sebastián<br> decide buscarla en la casa de playa que alquilaron para su luna de miel.</p>
        <a href="#" class="btn-comprar">Comprar</a>
      </div>
    </div>
    <!-- Slide 5: Película 5 -->
    <div class="carousel-item" style="background-image: url('https://cdnpe.cineplanet.com.pe/assets/c2d34bd1-7c7e-46c0-8028-044edd804139');">
      <div class="carousel-caption d-none d-md-block">
        <h1>
        <span class="highlight">  Look B</span> ack:<br> Continúa<br> Dibujando
        </h1>
        
        <p>Basado en el famoso MANGA, dos chicas con personalidades <br>contrastantes encuentran un lazo inesperado.</p>
        <a href="#" class="btn-comprar">Comprar</a>
      </div>
    </div>
  </div>
  
  
  <!-- Controles del carrusel -->
  <button class="carousel-control-prev" type="button" data-bs-target="#movieCarousel" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Anterior</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#movieCarousel" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Siguiente</span>
  </button>
</div>



<div class="cont-unido-peliculas">



<div class="filter-container">

<div class="combobox-item">
    <label class="label" for="peliculaSeleccionada">Por película:</label>
    <select name="peliculaSeleccionada" id="peliculaSeleccionada">
        <option value="">Elige tu película</option>
        <%
            String nombrePelicula = request.getParameter("nombrePelicula");
            metPeliculas peliculaManager = new metPeliculas(); // Usar el nombre correcto de la clase
            List<Pelicula> peliculas = peliculaManager.obtenerPeliculas();
            String peliculaSeleccionada = request.getParameter("peliculaSeleccionada");
            
            for (Pelicula pelicula : peliculas) {
        %>
            <option value="<%=pelicula.getId()%>" <%=peliculaSeleccionada != null && peliculaSeleccionada.equals(String.valueOf(pelicula.getId())) ? "selected" : ""%>>
                <%=pelicula.getTitulo()%>
            </option>
        <%
            }
        %>
    </select>
</div>
 

            <div class="combobox-item">
                <label  class="label"  for="ciudades">Por ciudad:</label>
                <select id="ciudades" name="ciudades" onchange="cargarCines()">
                    <option value="">Donde estas</option>
                    <%
                    Connection conn = null;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;

                    try {
                    Class.forName("com.mysql.cj.jdbc.Driver"); 
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cineplanet", "root", "");

                    String sql = "SELECT id, nombre_ciudad FROM ciudades";
                    pstmt = conn.prepareStatement(sql);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                    int id = rs.getInt("id");
                    String nombreCiudad = rs.getString("nombre_ciudad");
                    %>
                    <option value="<%= id %>"><%= nombreCiudad %></option>
                    <%
                    }
                    } catch (Exception e) {
                    e.printStackTrace();
                    } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException e) {}
                    if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
                    if (conn != null) try { conn.close(); } catch (SQLException e) {}
                    }
                    %>
                </select>
            </div>
          <div class="combobox-item">
                        <label class="label"  for="cineSeleccionado">Por cine:</label>
                        <select name="cineSeleccionado" id="cineSeleccionado">
                            <option value="">Elige tu cineplanet</option>
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

<div class="combobox-item">
    <label class="label" for="fechaSeleccionada">Por fecha:</label>
    <select name="fechaSeleccionada" id="fechaSeleccionada">
        <option value="">Elige una fecha</option>
        <%
        metPeliculasCines peliculasManager = new metPeliculasCines();
        List<String> fechas = peliculasManager.obtenerFechasDisponibles();
        String fechaSeleccionada = request.getParameter("fechaSeleccionada");

        // Comprueba si la lista de fechas no está vacía
        if (fechas.isEmpty()) {
            out.println("<option value=''>No hay fechas disponibles</option>");
        } else {
            // Crear un formateador de fechas
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

            for (String fechaStr : fechas) {
        %>
                <option value="<%= fechaStr %>" <%= fechaSeleccionada != null && fechaSeleccionada.equals(fechaStr) ? "selected" : "" %>>
                    <%= fechaStr %>
                </option>
        <%
            }
        }
        %>
    </select>
</div>

    <!-- Botón de Filtrar -->
    <div class="filtro-row filtrar-button">
        <button type="submit" class="btn-filtrar">Filtrar</button>
    </div>
</div>
</div>
<script>
function toggleAcordeon(id) {
    const content = document.getElementById(id);
    content.style.display = content.style.display === 'block' ? 'none' : 'block';
}
</script>
<br><br><br><br><br>

<!-- Contenedor de Cartelera -->
<div class="cartelera-container">
    <h1 class="titulo-cartelera">Películas</h1>

    <!-- Sección de las pestañas -->
    <div class="pestanas">
        <a href="#" class="pestana-activa">En cartelera</a>
        <a href="#">Próximos estrenos</a>
    </div>

    <!-- Grid de las películas -->
    <div class="cartelera-grid">
        <%
        // Capturando los parámetros enviados (cine o género)

        metPeliculasCines relacionManager = new metPeliculasCines(); // Clase para gestionar las películas
        List<Pelicula> peliculass = new ArrayList<>();

        try {
            // Lógica para obtener las películas según filtros aplicados
            if (cineSeleccionado != null && !cineSeleccionado.isEmpty()) {
                int cineId = Integer.parseInt(cineSeleccionado);
                peliculas = relacionManager.obtenerPeliculasPorCine(cineId);
        
            } else {
                peliculas = relacionManager.obtenerTodasLasPeliculas();
            }

            if (!peliculas.isEmpty()) {
                // Mostrar la primera película como destacada (ocupa 2 columnas)
                Pelicula peliculaDestacada = peliculas.get(0);
        %>
        <div class="pelicula pelicula-destacada">
            <img src="img/<%= peliculaDestacada.getImagen() != null && !peliculaDestacada.getImagen().isEmpty() ? peliculaDestacada.getImagen() : "default.jpg" %>" 
                 alt="<%= peliculaDestacada.getTitulo() %>" class="pelicula-imagen">
            <!-- Elimina el título de la película destacada -->
        </div>

        <!-- Mostrar las siguientes películas (máximo 4 más) -->
        <%
                for (int i = 1; i < peliculas.size() && i < 5; i++) {
                    Pelicula pelicula = peliculas.get(i);
        %>
        <div class="pelicula">
            <img src="img/<%= pelicula.getImagen() != null && !pelicula.getImagen().isEmpty() ? pelicula.getImagen() : "default.jpg" %>" 
                 alt="<%= pelicula.getTitulo() %>" class="pelicula-imagen">
            <!-- Elimina el título y el género de la película -->
            
            
            
        </div>

        <%
                }
            } else {
        %>
        <p>No hay películas disponibles para la selección actual.</p>
        <%
            }
        } catch (Exception e) {
            out.println("<p>Error al cargar las películas: " + e.getMessage() + "</p>");
        }
        %>
             <button class="cartelera-grid boton-ver-mas">Ver más<br>películas</button>    
        
        
    </div>

    <!-- Botón Ver más películas -->
    <div class="ver-mas-container">
       
    </div>
</div>
</div>
 <div class="container">
        <div class="card">
            <img src="img/tarjeta.png" alt="Tarjeta Socio Cineplanet" class="card-image">
        </div>
        <div class="info">
            <h1>Bienvenido<br>Socio Cineplanet</h1>
            <p>¿Estás listo para vivir la más grande experiencia y disfrutar los mejores beneficios? 
            <a href="#">Socio Cineplanet</a> es el programa que esperabas.</p>
            <div class="buttons">
                <a href="#" class="btn btn-red">Únete</a>
                <a href="#" class="btn btn-outline">Ver más</a>
            </div>
        </div>
    </div><br>
<script>
    // Función para alternar contenido (puede usarse en otros apartados)
    function toggleAcordeon(id) {
        const content = document.getElementById(id);
        content.style.display = content.style.display === "none" ? "block" : "none";
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
 <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
	<footer>
		<%@ include file="fragmentos/footer.jsp" %>
	</footer>
	
	</body>
</html>