<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.logging.log4j.LogManager" %>
<%@ page import="org.apache.logging.log4j.Logger" %>
<%@ page import="Controller.LogConfig" %>
<!DOCTYPE html>
<html>
<head>
    <title>Prueba de Log4j en JSP</title>
</head>
<body>
    <h1>Prueba de Log4j en JSP</h1>
    <%
        // Inicializa el logger si aún no está configurado
        LogConfig.initializeLogger();

        // Crea un logger para la página JSP
        Logger logger = LogManager.getLogger("JSPTestLogger");

        // Escribe logs de prueba
        logger.info("Log de nivel INFO desde JSP");
        logger.warn("Log de nivel WARN desde JSP");
        logger.error("Log de nivel ERROR desde JSP");

        out.println("<p>Logs registrados. Verifica la consola y el archivo logs/cineplanet.log</p>");
    %>
</body>
</html>
