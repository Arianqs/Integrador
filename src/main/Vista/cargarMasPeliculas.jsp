<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Model.Pelicula"%>
<%@ page import="Controller.metPeliculasCines"%>
<%@ page import="java.util.List"%>

<%
    int offset = Integer.parseInt(request.getParameter("offset"));
    int limit = Integer.parseInt(request.getParameter("limit"));
    metPeliculasCines relacionManager = new metPeliculasCines();
    List<Pelicula> peliculas = relacionManager.obtenerPeliculasConLimite(offset, limit);

    for (Pelicula pelicula : peliculas) {
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
%>
