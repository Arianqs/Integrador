<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String cineId = request.getParameter("cineId");
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cineplanet", "root", "");

        String sql = "SELECT nombre_cine, direccion_cine, telefono_cine, correo_cine, formatos , imagen_url FROM cines WHERE id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, cineId);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            String nombreCine = rs.getString("nombre_cine");
            String direccionCine = rs.getString("direccion_cine");
            String telefonoCine = rs.getString("telefono_cine");
            String correoCine = rs.getString("correo_cine");
            String imagenCine = rs.getString("imagen_url"); 

%>
<div class="cinema-grid">
    <div class="cinema-card">
        <div class="content" style="text-align: center;">
            <img src="<%= request.getContextPath() + "/img/" + imagenCine %>" alt="Imagen de <%= nombreCine %>" style="width: 400px; height: auto; display: block; margin: 0 auto;">
            <p><strong>Nombre:</strong> <%= nombreCine %></p>
            <p><strong>Dirección:</strong> <%= direccionCine %></p>
            <p><strong>Teléfono:</strong> <%= telefonoCine %></p>
            <p><strong>Correo:</strong> <%= correoCine %></p>
              <p><strong>Correo:</strong> <%= correoCine %></p>
        </div>
    </div>
</div>

<%
        } else {
%>
            <p>No se encontraron detalles para el cine seleccionado.</p>
        </div>
    </div>
</div>

<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) {}
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
        if (conn != null) try { conn.close(); } catch (SQLException e) {}
    }
%>
