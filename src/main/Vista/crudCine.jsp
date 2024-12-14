<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="Conexion.conexion" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CRUD de Cines</title>
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <link rel="stylesheet" type="text/css" href="css/crudpeliculas.css">
    
    <script>
        function mostrarDatos(id, nombre_cine, direccion_cine, telefono_cine, correo_cine, id_ciudad, imagen_cine) {
            document.getElementById('id').value = id; // Agregar el ID
            document.getElementById('nombre_cine').value = nombre_cine;
            document.getElementById('direccion_cine').value = direccion_cine;
            document.getElementById('telefono_cine').value = telefono_cine;
            document.getElementById('correo_cine').value = correo_cine;
            document.getElementById('id_ciudad').value = id_ciudad;
            document.getElementById('imagen_cine').value = imagen_cine;
        }
    </script>
</head>
<body>
    <jsp:include page="/fragmentos/encabezado_admin.jsp" />
    <h1>Gestión de Cines</h1>

    <h2>Agregar o Editar Cine</h2>
    <form action="crudCine.jsp" method="post">
        <label for="id">ID:</label>
        <input type="number" id="id" name="id" required><br>
        
        <label for="nombre_cine">Nombre del Cine:</label>
        <input type="text" id="nombre_cine" name="nombre_cine" required><br>

        <label for="direccion_cine">Dirección:</label>
        <input type="text" id="direccion_cine" name="direccion_cine" required><br>

        <label for="telefono_cine">Teléfono:</label>
        <input type="text" id="telefono_cine" name="telefono_cine" required><br>

        <label for="correo_cine">Correo:</label>
        <input type="email" id="correo_cine" name="correo_cine" required><br>

        <label for="id_ciudad">ID Ciudad:</label>
        <input type="number" id="id_ciudad" name="id_ciudad" required><br>

        <label for="imagen_cine">Ruta de Imagen:</label>
        <input type="text" id="imagen_cine" name="imagen_cine" required placeholder="Ej: nombre_imagen.jpg"><br>

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

            // Insertar nueva película o actualizar existente
            if ("save".equals(request.getParameter("action"))) {
                try {
                    String nombre_cine = request.getParameter("nombre_cine");
                    String direccion_cine = request.getParameter("direccion_cine");
                    String telefono_cine = request.getParameter("telefono_cine");
                    String correo_cine = request.getParameter("correo_cine");
                    String id_ciudad = request.getParameter("id_ciudad");
                    String imagen_cine = request.getParameter("imagen_cine");
                    String idParam = request.getParameter("id");

                    // Validación de campos requeridos
                    if (nombre_cine.isEmpty() || direccion_cine.isEmpty() || id_ciudad.isEmpty() || imagen_cine.isEmpty()) {
                        out.println("<script>alert('Error: Todos los campos obligatorios deben ser completados.');</script>");
                        return;
                    }

                    // Verificar si el ID es único
                    String sqlCheck = "SELECT COUNT(*) FROM cines WHERE id = ?";
                    ps = conn.prepareStatement(sqlCheck);
                    ps.setInt(1, Integer.parseInt(idParam));
                    ResultSet rsCheck = ps.executeQuery();
                    rsCheck.next();
                    int count = rsCheck.getInt(1);
                    rsCheck.close();

                    if (count > 0) {
                        // Actualización de la cine existente
                        String sqlUpdate = "UPDATE cines SET nombre_cine = ?, direccion_cine = ?, telefono_cine = ?, correo_cine = ?, imagen_cine = ?, id_ciudad = ? WHERE id = ?";
                        ps = conn.prepareStatement(sqlUpdate);
                        ps.setString(1, nombre_cine);
                        ps.setString(2, direccion_cine);
                        ps.setString(3, telefono_cine); // Cambiado a String
                        ps.setString(4, correo_cine);
                        ps.setString(5, "../img/" + imagen_cine);
                        ps.setString(6, id_ciudad);
                        ps.setInt(7, Integer.parseInt(idParam));

                        int rowsUpdated = ps.executeUpdate();
                        if (rowsUpdated > 0) {
                            out.println("<script>alert('Cine actualizado exitosamente.');</script>");
                        } else {
                            out.println("<script>alert('Error: No se pudo actualizar el cine.');</script>");
                        }
                    } else {
                        // Inserción en la base de datos
                        String sqlInsert = "INSERT INTO cines (id, nombre_cine, direccion_cine, telefono_cine, correo_cine, id_ciudad, imagen_cine) VALUES (?, ?, ?, ?, ?, ?, ?)";
                        ps = conn.prepareStatement(sqlInsert);
                        ps.setInt(1, Integer.parseInt(idParam)); // Establecer el ID
                        ps.setString(2, nombre_cine);
                        ps.setString(3, direccion_cine);
                        ps.setString(4, telefono_cine); // Cambiado a String
                        ps.setString(5, correo_cine);
                        ps.setString(6, id_ciudad);
                        ps.setString(7, "../img/" + imagen_cine);

                        int rowsInserted = ps.executeUpdate();
                        if (rowsInserted > 0) {
                            out.println("<script>alert('Cine agregado exitosamente.');</script>");
                        } else {
                            out.println("<script>alert('Error: No se pudo agregar el cine.');</script>");
                        }
                    }
                } catch (SQLException e) {
                    out.println("<script>alert('Error al guardar el cine: " + e.getMessage() + "');</script>");
                    e.printStackTrace();
                } catch (NumberFormatException e) {
                    out.println("<script>alert('Error en el ID o teléfono: " + e.getMessage() + "');</script>");
                }
            }

            // Eliminar cine
            if ("Eliminar".equals(request.getParameter("actionDelete"))) {
                try {
                    int id = Integer.parseInt(request.getParameter("id"));
                    String sqlDelete = "DELETE FROM cines WHERE id = ?";
                    ps = conn.prepareStatement(sqlDelete);
                    ps.setInt(1, id);
                    
                    int rowsDeleted = ps.executeUpdate();
                    if (rowsDeleted > 0) {
                        out.println("<script>alert('Cine eliminado exitosamente.');</script>");
                    } else {
                        out.println("<script>alert('Error: No se pudo eliminar el cine.');</script>");
                    }
                } catch (SQLException e) {
                    out.println("<script>alert('Error al eliminar el cine: " + e.getMessage() + "');</script>");
                    e.printStackTrace();
                } catch (NumberFormatException e) {
                    out.println("<script>alert('Error en el ID del cine: " + e.getMessage() + "');</script>");
                }
            }

            // Listar cines
            try {
                String sqlSelect = "SELECT * FROM cines";
                ps = conn.prepareStatement(sqlSelect);
                rs = ps.executeQuery();
    %>
    <h2>Listado de Cines</h2>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Dirección</th>
            <th>Teléfono</th>
            <th>Correo</th>
            <th>ID Ciudad</th>
            <th>Imagen</th>
            <th>Acciones</th>
        </tr>

    <%
    while (rs.next()) {
        int id = rs.getInt("id");
        String nombre = rs.getString("nombre_cine");
        String direccion = rs.getString("direccion_cine");
        String telefono = rs.getString("telefono_cine");
        String correo = rs.getString("correo_cine");
        String idciudad = rs.getString("id_ciudad");
        String imagenPath = rs.getString("imagen_cine");
        
    %>
    <tr onclick="mostrarDatos('<%= id %>', '<%= nombre %>', '<%= direccion %>', '<%= telefono %>', '<%= correo %>', '<%= idciudad %>', '<%= imagenPath %>');">
        <td><%= id %></td>
        <td><%= nombre %></td>
        <td><%= direccion %></td>
        <td><%= telefono %></td>
        <td><%= correo %></td>
        <td><%= idciudad %></td>
        <td>
            <img src="<%= request.getContextPath() + "/img/" + imagenPath %>" alt="<%= nombre %>" width="100" />
            <br>
            <small>Ruta: <%= request.getContextPath() + "/img/" + imagenPath %></small>
        </td>

        <td>
            <form action="crudCine.jsp" method="post">
                <input type="hidden" name="id" value="<%= id %>">
                <input type="submit" name="actionDelete" value="Eliminar">
            </form>
        </td>
    </tr>
    <%
    }
    %>
    </table>

    <%
            } catch (SQLException e) {
                out.println("<script>alert('Error al listar cines: " + e.getMessage() + "');</script>");
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                if (ps != null) try { ps.close(); } catch (SQLException ignore) {}
                if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
            }
        } catch (SQLException e) {
            out.println("<script>alert('Error de conexión: " + e.getMessage() + "');</script>");
            e.printStackTrace();
        }
    %>
</body>
</html>