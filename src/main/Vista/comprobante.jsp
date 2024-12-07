<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.nio.charset.StandardCharsets" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Comprobante de Pago</title>
    <link rel="stylesheet" type="text/css" href="css/comprobante.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <script>
        function imprimirComprobante() {
            window.print(); 
        }
    </script>
   <style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

body {
    background-color: #f4f4f9;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
}

/* Contenedor principal */
.container {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}

/* Caja del comprobante */
.comprobante-box {
    background-color: #ffffff;
    padding: 40px;
    border-radius: 12px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    width: 90%;
    max-width: 700px;
    animation: fadeIn 1s ease-in-out;
    border-top: 5px solid #e50914; /* Rojo Cineplanet */
}

/* Cabecera con el logo y título */
.header {
    text-align: center;
    margin-bottom: 30px;
}

.header img {
    width: 150px;
    margin-bottom: 15px;
}

h1 {
    font-size: 32px;
    color: #e50914; /* Rojo Cineplanet */
    font-weight: 600;
    margin-bottom: 20px;
}

/* Detalles del comprobante */
.comprobante {
    font-size: 16px;
    color: #333;
    margin-bottom: 30px;
}

.comprobante p {
    margin-bottom: 12px;
}

/* Formulario */
.formulario {
    margin-top: 20px;
    padding: 20px;
    background-color: #f9f9f9;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.formulario h3 {
    text-align: center;
    color: #333;
    margin-bottom: 15px;
}

/* Campos de formulario */
form {
    display: flex;
    flex-direction: column;
    align-items: center;
}

input[type="email"] {
    padding: 10px;
    width: 80%;
    margin-bottom: 20px;
    border-radius: 8px;
    border: 1px solid #ddd;
    font-size: 16px;
    outline: none;
}

input[type="email"]:focus {
    border: 1px solid #e50914;
    box-shadow: 0 0 5px rgba(229, 9, 20, 0.4);
}

button {
    padding: 10px 20px;
    background-color: #e50914; /* Rojo Cineplanet */
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s;
}

button:hover {
    background-color: #d40712; /* Un tono más oscuro de rojo */
}

/* Estilo de impresión */
.imprimir {
    margin-top: 20px;
    padding: 10px 20px;
    background-color: #ff4081; /* Color atractivo para llamar la atención */
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s;
}

.imprimir:hover {
    background-color: #e91e63;
}


@keyframes fadeIn {
    0% {
        opacity: 0;
        transform: translateY(-30px);
    }
    100% {
        opacity: 1;
        transform: translateY(0);
    }
}

/* Estilos para asegurar la responsividad */
@media (max-width: 768px) {
    .comprobante-box {
        width: 90%;
    }

    .header img {
        width: 120px;
    }

    h1 {
        font-size: 28px;
    }

    input[type="email"], button {
        width: 90%;
    }
}
 
   
   </style>
</head>
<body>
    <div class="container">
        <h1>Comprobante de Compra</h1>

        <!-- Mostrar detalles de la compra -->
        <div class="comprobante">
            <p><strong>Nombre:</strong> ${param.fullName}</p>
            <p><strong>Película:</strong> ${param.pelicula}</p>
            <p><strong>Cine:</strong> ${param.cine}</p>
            <p><strong>Sala:</strong> ${param.sala}</p>
            <p><strong>Asientos:</strong> ${param.asientos}</p>
            <p><strong>Fecha:</strong> ${param.fecha}</p>
            <p><strong>Horario:</strong> ${param.horario}</p>
            <p><strong>Forma de Pago:</strong> ${param.forma_pago}</p>
            <p><strong>Total:</strong> S/. ${param.total}</p>
        </div>

        <!-- Formulario para enviar el comprobante por correo -->
        <div class="formulario">
            <h3>Enviar Comprobante por Correo Electrónico</h3>
            <form action="EnviarComprobanteServlet" method="post">
                <input type="hidden" name="full-name" value="${param.fullName}">
                <input type="hidden" name="pelicula" value="${param.pelicula}">
                <input type="hidden" name="cine" value="${param.cine}">
                <input type="hidden" name="sala" value="${param.sala}">
                <input type="hidden" name="asientos" value="${param.asientos}">
                <input type="hidden" name="forma_pago" value="${param.forma_pago}">
                <input type="hidden" name="fecha" value="${param.fecha}">
                <input type="hidden" name="horario" value="${param.horario}">
                <input type="hidden" name="total" value="${param.total}">

                <label for="email">Correo Electrónico:</label>
                <input type="email" id="email" name="email" required placeholder="Ingrese su correo electrónico">

                <button type="submit">Enviar Comprobante</button>
            </form>
        </div>
    </div>
</body>
</html>
