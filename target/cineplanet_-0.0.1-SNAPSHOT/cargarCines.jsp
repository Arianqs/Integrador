<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ciudadId = request.getParameter("ciudadId");
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver"); 
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cineplanet", "root", "");

        String sql = "SELECT id, nombre_cine FROM cines WHERE id_ciudad = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, ciudadId);
        rs = pstmt.executeQuery();
%>
        <option value="nadaxd">-- Seleccionar --</option>
<%
        while (rs.next()) {
            int id = rs.getInt("id");
            String nombreCine = rs.getString("nombre_cine");
%>
            <option value="<%= id %>"><%= nombreCine %></option>
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
