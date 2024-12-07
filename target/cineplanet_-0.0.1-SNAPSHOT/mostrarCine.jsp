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

        String sql = "SELECT nombre_cine, direccion_cine, imagen_cine, formatos FROM cines WHERE id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, cineId);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            String nombreCine = rs.getString("nombre_cine");
            String direccionCine = rs.getString("direccion_cine");
            String imagenCine = rs.getString("imagen_cine");
            String formatos = rs.getString("formatos");

%>
<div class="cinema-grid">
    <div class="cinema-card">
        <div class="content" style="text-align: center;">
            <!-- Ruta de la imagen del cine -->
            <img src="<%= request.getContextPath() + "/img/" + imagenCine %>" 
                 alt="Imagen de <%= nombreCine %>" 
                 style="width: 340px; height: auto; display: block; margin: 0 auto;">
				<p style="font-size: 1.3em;"><strong><%= nombreCine %></strong></p>
				<p style="font-weight: 500; font-family: 'Lato', sans-serif;"><%= direccionCine %></p>
				<p style="font-weight: 500; font-family: 'Lato', sans-serif;"><%= formatos %></p>

        </div>
    </div>
</div>

<%
        } else {
%>
            <p>No se encontraron detalles para el cine seleccionado.</p>
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
