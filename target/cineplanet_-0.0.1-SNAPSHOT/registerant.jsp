<%@ page import="Controller.met_registro" %>
<%@ page import="Service.DNIService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registrate</title>
    <link rel="stylesheet" type="text/css" href="css/formlogin.css">
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/registro.css">
    <script src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="icon" href="img/icon.ico" sizes="32x32" type="image/x-icon">
    <script>
        function validarDNI() {
            const dniInput = document.getElementById("numero_documento").value;
            if (dniInput.length !== 8 || isNaN(dniInput)) {
                alert("Por favor, ingresa un DNI válido de 8 dígitos.");
            }
        }

        function continuar() {
            const dni = document.getElementById("numero_documento").value;
            if (dni.length === 8) {
                document.getElementById("contactForm").submit(); // Enviar el formulario
            } else {
                alert("Por favor, ingresa un DNI válido.");
            }
        }
    </script>
    <style>
        .form-login {
            background-color: #fff;
            padding: 60px;
            border-radius: 5px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
            width: 30%;
            max-width: 670px;
            text-align: center;
            margin: 25px auto;
            font-size: 10px;
        }
        .btn-registro, .btn-confirmar {
            background-color: #cd2906;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 25px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            display: block;
            margin: 0 auto;
        }
        .btn-registro:hover, .btn-confirmar:hover {
            background-color: #cc0052;
        }
        .resultado {
            margin-top: 20px;
        }
        .form-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
        }
        .input-container {
            flex: 1;
            margin-right: 10px;
        }
        .input-container:last-child {
            margin-right: 0;
        }
        .checkbox-group {
            display: flex;
            align-items: center;
            margin: 10px 0;
        }
        label {
            font-size: 14px;
            color: #3C4A5F;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="header-line"></div>
<a href="cartelera.jsp" class="btn-atras">
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
        <path d="M15.41 7.41L14 6l-6 6 6 6 1.41-1.41L10.83 12z"/>
    </svg>
    Atrás
</a>

<div class="container-login">
	<div class="form-login" >
    <form id="contactForm" method="post">
        <fieldset>
            <h3>Únete</h3>
            <p>Completa tus datos y accede a nuestro<br>universo de beneficios</p>
            <div class="form-row">
                <div class="input-container">
                    <input type="text" id="numero_documento" name="numero_documento" placeholder="N° de Documento" required onblur="validarDNI()">
                </div>
                <div class="input-container">
                    <button type="button" class="btn-confirmar" onclick="continuar()">Continuar</button>
                </div>
            </div>
        </fieldset>
    </form>

    <% 
        String dni = request.getParameter("numero_documento");
        if (dni != null && !dni.isEmpty()) {
            String resultado = DNIService.consultarDNI(dni);
            System.out.println("Resultado de la consulta: " + resultado); // Para depuración
            if (resultado != null && !resultado.isEmpty()) {
                try {
                    String nombres = "";
                    String apellidoPaterno = "";
                    String apellidoMaterno = "";

                    // Extraer los valores del JSON manualmente
                    if (resultado.contains("nombres")) {
                        nombres = resultado.split("\"nombres\":\"")[1].split("\"")[0].trim();
                    }
                    if (resultado.contains("apellidoPaterno")) {
                        apellidoPaterno = resultado.split("\"apellidoPaterno\":\"")[1].split("\"")[0].trim();
                    }
                    if (resultado.contains("apellidoMaterno")) {
                        apellidoMaterno = resultado.split("\"apellidoMaterno\":\"")[1].split("\"")[0].trim();
                    }

                    // Establecemos los atributos para el formulario
                    request.setAttribute("nombre", nombres);
                    request.setAttribute("apellidos", apellidoPaterno + " " + apellidoMaterno);
                } catch (Exception e) {
                    out.println("<script>alert('Error al procesar la respuesta de la API: " + e.getMessage() + "');</script>");
                }
            } else {
                out.println("<script>alert('Error al consultar DNI. Verifica que el número sea correcto.');</script>");
            }
        }
    %>

    <div class="resultado">
        <form action="logicajsp/logicaregistro.jsp" method="post">
            <div class="form-row">
                <div class="input-container">
                    <input type="text" id="nombre" name="nombre" placeholder="Nombre" required value="<%= request.getAttribute("nombre") != null ? request.getAttribute("nombre") : "" %>" readonly>
                </div>
                <div class="input-container">
                    <input type="text" id="apellidos" name="apellidos" placeholder="Apellidos" required value="<%= request.getAttribute("apellidos") != null ? request.getAttribute("apellidos") : "" %>" readonly>
                </div>
            </div>
            <div class="form-row">
                <div class="input-container">
                    <input type="tel" id="celular" name="celular" placeholder="Celular" required>
                </div>
                <div class="input-container">
                    <input type="email" id="correo" name="correo" placeholder="Correo Electrónico" required>
                </div>
            </div>
            <div class="form-row">
                <div class="input-container">
                    <input type="text" id="numero_documento" name="numero_documento" placeholder="N° de Documento" required value="<%= request.getParameter("numero_documento") != null ? request.getParameter("numero_documento") : "" %>" readonly>
                </div>
                <div class="input-container">
                    <input type="password" id="contrasena" name="contrasena" placeholder="Contraseña" required>
                </div>
            </div>
            <div class="input-container form-group-center">
                <input type="password" id="confirmar_contrasena" name="confirmar_contrasena" placeholder="Confirmar Contraseña" required>
            </div>
            <div class="checkbox-group">
                <input type="checkbox" id="acepto_terminos" name="acepto_terminos" required>
                <label for="acepto_terminos">Acepto los <a href="#">Términos y Condiciones</a> y la <a href="#">Política de Privacidad</a></label>
            </div>
            <div class="checkbox-group">
                <input type="checkbox" id="finalidades" name="finalidades">
                <label for="finalidades">He leído y acepto las finalidades de tratamiento adicionales</label>
            </div>
            <button type="submit" class="btn-registro">Unirme</button>
        </form>
    </div>
    </div>
</div>
</body>
</html>
