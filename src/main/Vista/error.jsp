<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
</head>
<body>
    <h1>Error al Enviar el Correo</h1>
    <p><%= request.getAttribute("errorMessage") %></p>
</body>
</html>
