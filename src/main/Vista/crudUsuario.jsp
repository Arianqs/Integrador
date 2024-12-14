<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="Conexion.conexion" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listado de Usuarios</title>
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <link rel="stylesheet" type="text/css" href="css/crudpeliculas.css">
</head>
<body>
<jsp:include page="/fragmentos/encabezado_admin.jsp" />
    <h1>...</h1>
    <h2>Listado de Usuarios</h2>

    <%
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Conexión a la base de datos
            conn = conexion.getConnection();
            if (conn == null) {
                out.println("<script>alert('Error: No se pudo conectar a la base de datos.');</script>");
            } else {
                // Consulta SQL para obtener los datos
                String sqlSelect = "SELECT id, nombre, apellidos, celular, dni, email, password, confirpassword FROM usuarios";
                ps = conn.prepareStatement(sqlSelect);
                rs = ps.executeQuery();
    %>

    <!-- Tabla para mostrar los datos -->
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Apellidos</th>
            <th>Celular</th>
            <th>DNI</th>
            <th>Email</th>
            <th>Cifrado Contraseña</th>
            <th>Descifrar Contraseña</th>
        </tr>

        <%
            while (rs.next()) {
                int id = rs.getInt("id");
                String nombre = rs.getString("nombre");
                String apellidos = rs.getString("apellidos");
                String celular = rs.getString("celular");
                String dni = rs.getString("dni");
                String email = rs.getString("email");
                String password = rs.getString("password");
                String confirpassword = rs.getString("confirpassword");
        %>
        <tr>
            <td><%= id %></td>
            <td><%= nombre %></td>
            <td><%= apellidos %></td>
            <td><%= celular %></td>
            <td><%= dni %></td>
            <td><%= email %></td>
            <td><%= password %></td>
            <td><%= confirpassword %></td>
        </tr>
        <%
            }
        %>
    </table>

    <%
            }
        } catch (SQLException e) {
            out.println("<script>alert('Error al obtener los datos: " + e.getMessage() + "');</script>");
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { }
            if (ps != null) try { ps.close(); } catch (SQLException e) { }
            if (conn != null) try { conn.close(); } catch (SQLException e) { }
        }
    %>
</body>
</html>