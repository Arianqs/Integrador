<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Controller.metCine"%>
<%@ page import="Model.Pelicula"%>
<%@ page import="Controller.metPeliculas"%>
<%@ page import="Controller.metPeliculasCines"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
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

        .container {
            display: flex;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            width: 100%;
            box-shadow: 22px 23px 0 -12px #004A8C;
            align-items: center;
            justify-content: center;
            margin: 10px auto;
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
            width: 100%;
            height: 100vh;
            background-image: url('img/dulceria.jpeg');
            max-height: 440px;
            background-position: left center;
            left: 50%;
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
    </style>
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

        <!-- Imagen fija -->
        <div class="texto">
            <img   class="img-fluid">
            <div class="carousel-caption d-none d-md-block">
            </div>
        </div>
        <br><br><br>

        <h1>Escoge un Cineplanet para comprar productos de nuestra dulcería</h1>

        <div class="cont-unido-peliculas">
            <!-- Filtros Acordeón -->
            <div class="cont-filtro-acordeon">
                <div class="filtro-row">
                    <div class="filtro-column">
                        <label  class="label"  for="ciudades">Por Ciudad:</label>
                        <select id="ciudades" name="ciudades" onchange="cargarCines()">
                            <option value="">Todas las ciudades</option>
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

                    <div class="filtro-column">
                        <label for="cineSeleccionado">Seleccione un cine</label>
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
        </div>
    </div>
    <br><br><br><br><br>
    <div class="text-center mt-4">
        <a href="loginusuario_intranet.jsp" class="btn btn-custom">
            Continuar 
            <span class="arrow-icon">➔</span>
        </a>
    </div>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <footer>
        <%@ include file="fragmentos/footer.jsp" %>
    </footer>

</body>
</html>