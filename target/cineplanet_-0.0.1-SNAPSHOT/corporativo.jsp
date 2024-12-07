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
        <title>Corporativo</title>
        <%@ include file="logicajsp/logicalogin_intranet.jsp" %>
        <link rel="stylesheet" type="text/css" href="css/carteleraa.css">
        <link rel="stylesheet" type="text/css" href="css/index.css">
        <link rel="stylesheet" href="css/corporativo.css">
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
            gap: 0px;
        }

        .navbar-brand {
            gap: 10px;
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

        .texto {
            width: 100%;
            height: 100vh;
            background-image: url('https://cdnpe.cineplanet.com.pe/assets/1ef83f38-a0ce-4da4-92d7-a1deefa2f15e');
            max-height: 440px;
            background-position: left center;
            left: 100%;
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
                            <a class="nav-link" href="#">Cines</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="promociones.jsp">Promociones</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="dulceria.jsp">Dulcería</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="corporativo.jsp">Corporativo</a>
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


        <div class="texto">
            <img   class="img-fluid">
            <div class="carousel-caption d-none d-md-block">
            </div>
        </div>

        <section class="container my-5">
            <h2 class="titulo">Conoce nuestros productos</h2>
            <div class="row g-4">

                <div class="col-md-4">
                    <div class="card text-center">
                        <div class="card-body box">
                            <h5 class="card-title Titulo">Eventos</h5>
                            <p class="card-text dialogo">Vive la experiencia de alquilar una sala para juegos en línea, lanzamientos, conferencias y reuniones.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-center">
                        <div class="card-body box">
                            <h5 class="card-title Titulo">Funciones Especiales</h5>
                            <p class="card-text dialogo">Disfruta de salas exclusivas para ti y tus invitados con películas en estreno y contenido alternativo.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-center">
                        <div class="card-body box">
                            <h5 class="card-title Titulo">Entradas y Combos</h5>
                            <p class="card-text dialogo">Adquiere nuestros productos con precios diferenciados para colaboradores o clientes.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-center">
                        <div class="card-body box">
                            <h5 class="card-title Titulo">Planet Fiesta</h5>
                            <p class="card-text dialogo">Celebra tu cumpleaños de película con sala exclusiva, combos y videojuegos.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-center">
                        <div class="card-body box">
                            <h5 class="card-title Titulo">Publicidad</h5>
                            <p class="card-text dialogo">Anuncia tu marca y obtén un mayor impacto visual a nivel nacional.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-center">
                        <div class="card-body box">
                            <h5 class="card-title Titulo">At Work</h5>
                            <p class="card-text dialogo">Ofrecemos programas exclusivos para colaboradores con entradas y combos especiales.</p>
                        </div>
                    </div>
                </div>

            </div>
        </section>
    </body>
    <footer >
        <jsp:include page="fragmentos/footer.jsp" flush="true" />
    </footer>

</body>
</html>