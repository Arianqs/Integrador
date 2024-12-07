<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Iniciar Sesión</title>
    <%@ include file="logicajsp/logicalogin.jsp" %>
    <link rel="stylesheet" type="text/css" href="css/formlogin.css">
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <script src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<style>
   .form-login {
    background-color: #fff;
    padding: 60px;
    border-radius: 5px;
    box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
    width: 60%;
    max-width: 400px;
    text-align: center;
    font-size: 10px;
    margin: 5px;
    height:400px;
      margin-bottom: 0; 
       margin: 5px 0 0 0; 
           margin-bottom: 0;
             margin-top: 25px;
}
.btn-registro {
    background-color: #cd2906;
    color: white; 
    border: none;
    padding: 10px 20px;
    font-size: 16px;
    border-radius: 25px; 
    cursor: pointer; 
    border: none;
    transition: background-color 0.3s ease;
} 

.btn-registro:hover {
    background-color: #cc0052; 
}
.icono-registro {
    width: 30px; 
    height: 20px;
}
</style>
<body>
<div class="header-line"></div>
   <a href="cartelera.jsp" class="btn-atras">
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
        <path d="M15.41 7.41L14 6l-6 6 6 6 1.41-1.41L10.83 12z"/>
    </svg>
    Atrás
</a>

    <div class="container-login">
        <form class="form-login" action="loginusuario.jsp" method="POST">
            <fieldset>
                <h3>Iniciar sesión</h3>
                <p>Ingresa a tu cuenta para disfrutar de tus beneficios, acumular <br>puntos y vivir al máximo la experiencia Cineplanet.</p><br><br><br>
                
               <div class="input-container">
                    <label for="usuario"></label>
                    
                    <input type="text" id="usuario" name="email" placeholder="N° de Socio Cineplanet" required>
                    
                    </div> <small style="font-size: 13px;">CORREO</small>

                    <br><br><br><br>
                    
                <div class="input-container">
                    <label for="contraseña"></label>
                    <input type="password" id="contraseña" name="pass" placeholder="Contraseña">
                </div>

                <%
                    // Mostrar el mensaje de error si existe
                    String error = (String) request.getAttribute("error");
                    if (error != null) {
                %>
                    <p class="error-message"><%= error %></p>
                <%
                    }
                %>
<br><br>
      
                <div class="remember-me">
                    <a href="#" class="forgot-link">¿Olvidaste tu contraseña?</a>
                </div>
                
                <div class="boton-envia">
                    <input type="submit" value="Ingresar" class="login-btn">
                </div>
                
                <!-- Parámetros ocultos -->
                <!-- Parámetros ocultos -->
<input type="hidden" name="cine" value="<%= request.getParameter("cine") != null ? request.getParameter("cine") : "" %>">
<input type="hidden" name="horario" value="<%= request.getParameter("horario") != null ? request.getParameter("horario") : "" %>">
<input type="hidden" name="fecha" value="<%= request.getParameter("fecha") != null ? request.getParameter("fecha") : "" %>">
<input type="hidden" name="pelicula" value="<%= request.getParameter("pelicula") != null ? request.getParameter("pelicula") : "" %>">
<input type="hidden" name="asientos" value="<%= request.getParameter("asientos") != null ? request.getParameter("asientos") : "" %>">
<input type="hidden" name="imagen" value="<%= request.getParameter("imagen") != null ? request.getParameter("imagen") : "" %>">
<input type="hidden" name="sala" value="<%= request.getParameter("sala") != null ? request.getParameter("sala") : "" %>"> <!-- Campo oculto para sala -->

<div class="registro-cineplanet">
   <p class="no-socio">¿No eres socio?</p>

   <p class="socio-cineplanet">Registrándote en nuestro programa Socio Cineplanet podrás acumular <br>puntos en cada visita que realices y gozar de grandes beneficios.</p><br>

    <div class="boton-registro">
        <form action="registerant.jsp" method="post">
            <button type="submit" class="btn-registro">
                <img src="img/iconUser.png" alt="Icono de socio" class="icono-registro">
                Únete
            </button>
        </form>
    </div>
</div>
<script>
    document.querySelectorAll("input").forEach(function(input) {
        input.addEventListener("focus", function() {
            this.dataset.placeholder = this.placeholder; // Guarda el placeholder original
            this.placeholder = ""; // Elimina el placeholder
        });

        input.addEventListener("blur", function() {
            this.placeholder = this.dataset.placeholder; // Restaura el placeholder si el input queda vacío
        });
    });
</script>
            </fieldset>
        </form>
    </div>
</body>
</html>

