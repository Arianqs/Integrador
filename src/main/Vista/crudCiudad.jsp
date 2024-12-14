<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="Conexion.conexion" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CRUD de Ciudades</title>
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <link rel="stylesheet" type="text/css" href="css/crudpeliculas.css">
    
    <script>
        function mostrarDatos(id, nombre_ciudad) {
            document.getElementById('id').value = id; // Agregar el ID
            document.getElementById('nombre_ciudad').value = nombre_ciudad; // Asignar el nombre de la ciudad
        }
    </script>
</head>
<body>
<jsp:include page="/fragmentos/encabezado_admin.jsp" />
    <h1>Gestión de Ciudades</h1>

    <h2>Agregar o Editar Ciudad</h2>
    <form action="crudCiudad.jsp" method="post">
        <label for="id">ID de la Ciudad:</label>
        <input type="number" id="id" name="id" required><br>
        
        <label for="nombre_ciudad">Nombre de la Ciudad:</label>
        <input type="text" id="nombre_ciudad" name="nombre_ciudad" required><br>

        <input type="submit" name="action" value="save">
    </form>

    <%
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Conexión a la base de datos
            conn = conexion.getConnection();
            if (conn == null) {
                out.println("<script>alert('Error: No se pudo conectar a la base de datos.');</script>");
            }

            // Insertar nueva ciudad o actualizar existente
            if ("save".equals(request.getParameter("action"))) {
                try {
                    String nombre_ciudad = request.getParameter("nombre_ciudad");
                    String idParam = request.getParameter("id");

                    // Verificar si el ID es único
                    String sqlCheck = "SELECT COUNT(*) FROM ciudades WHERE id = ?";
                    ps = conn.prepareStatement(sqlCheck);
                    ps.setInt(1, Integer.parseInt(idParam));
                    ResultSet rsCheck = ps.executeQuery();
                    rsCheck.next();
                    int count = rsCheck.getInt(1);
                    rsCheck.close();

                    if (count > 0) {
                        // Actualización de la ciudad existente
                        String sqlUpdate = "UPDATE ciudades SET nombre_ciudad = ? WHERE id = ?";
                        ps = conn.prepareStatement(sqlUpdate);
                        ps.setString(1, nombre_ciudad);
                        ps.setInt(2, Integer.parseInt(idParam));

                        int rowsUpdated = ps.executeUpdate();
                        if (rowsUpdated > 0) {
                            out.println("<script>alert('Ciudad actualizada exitosamente.');</script>");
                        } else {
                            out.println("<script>alert('Error: No se pudo actualizar la ciudad.');</script>");
                        }
                    } else {
                        // Inserción en la base de datos
                        String sqlInsert = "INSERT INTO ciudades (id, nombre_ciudad) VALUES (?, ?)";
                        ps = conn.prepareStatement(sqlInsert);
                        ps.setInt(1, Integer.parseInt(idParam)); // Establecer el ID
                        ps.setString(2, nombre_ciudad); // Establecer el nombre de la ciudad

                        int rowsInserted = ps.executeUpdate();
                        if (rowsInserted > 0) {
                            out.println("<script>alert('Ciudad agregada exitosamente.');</script>");
                        } else {
                            out.println("<script>alert('Error: No se pudo agregar la ciudad.');</script>");
                        }
                    }
                } catch (SQLException e) {
                    out.println("<script>alert('Error al guardar la ciudad: " + e.getMessage() + "');</script>");
                    e.printStackTrace();
                }
            }

            // Eliminar ciudad
            if ("Eliminar".equals(request.getParameter("actionDelete"))) {
                try {
                    int id = Integer.parseInt(request.getParameter("id"));

                    String sqlDelete = "DELETE FROM ciudades WHERE id = ?";
                    ps = conn.prepareStatement(sqlDelete);
                    ps.setInt(1, id);

                    int rowsDeleted = ps.executeUpdate();
                    if (rowsDeleted > 0) {
                        out.println("<script>alert('Ciudad eliminada exitosamente.');</script>");
                    } else {
                        out.println("<script>alert('Error: No se pudo eliminar la ciudad.');</script>");
                    }
                } catch (SQLException e) {
                    out.println("<script>alert('Error al eliminar la ciudad: " + e.getMessage() + "');</script>");
                    e.printStackTrace();
                } catch (NumberFormatException e) {
                    out.println("<script>alert('Error en el ID de la ciudad: " + e.getMessage() + "');</script>");
                    e.printStackTrace();
                }
            }

            // Listar ciudades
            try {
                String sqlSelect = "SELECT * FROM ciudades";
                ps = conn.prepareStatement(sqlSelect);
                rs = ps.executeQuery();
    %>
    <h2>Listado de Ciudades</h2>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Nombre Ciudad</th>
            <th>Acciones</th>
        </tr>

    <%
    while (rs.next()) {
        int id = rs.getInt("id");
        String nombre_ciudad = rs.getString("nombre_ciudad");
    %>
    <tr onclick="mostrarDatos('<%= id %>', '<%= nombre_ciudad %>');">
        <td><%= id %></td>
        <td><%= nombre_ciudad %></td>
        <td>
            <form action="crudCiudad.jsp" method="post" style="display:inline;">
                <input type="hidden" name="id" value="<%= id %>">
                <input type="submit" name="actionDelete" value="Eliminar" 
                       onclick="return confirm('¿Está seguro de que desea eliminar esta ciudad?');">
            </form>
        </td>
    </tr>
    <%
    }
    %>
    </table>
    <%
            } catch (SQLException e) {
                out.println("<script>alert('Error al listar las ciudades: " + e.getMessage() + "');</script>");
                e.printStackTrace();
            }
        } catch (SQLException e) {
            out.println("<script>alert('Error de conexión: " + e.getMessage() + "');</script>");
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { }
            if (ps != null) try { ps.close(); } catch (SQLException e) { }
            if (conn != null) try { conn.close(); } catch (SQLException e) { }
        }
    %>
</body>
</html>