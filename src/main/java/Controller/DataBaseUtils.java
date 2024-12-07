package Controller;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DataBaseUtils {
    public static List<String[]> obtenerCiudades() {
        List<String[]> ciudades = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cineproyect", "root", "");
            String sql = "SELECT id, nombre_ciudad FROM ciudades";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                ciudades.add(new String[] { String.valueOf(rs.getInt("id")), rs.getString("nombre_ciudad") });
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources(rs, pstmt, conn);
        }
        return ciudades;
    }

    public static List<String> obtenerFormatos() {
        List<String> formatos = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cineproyect", "root", "");
            String sql = "SELECT DISTINCT nombre FROM formato"; 
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                formatos.add(rs.getString("nombre"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources(rs, pstmt, conn);
        }
        return formatos;
    }

    private static void closeResources(ResultSet rs, PreparedStatement pstmt, Connection conn) {
        try { if (rs != null) rs.close(); } catch (SQLException e) {}
        try { if (pstmt != null) pstmt.close(); } catch (SQLException e) {}
        try { if (conn != null) conn.close(); } catch (SQLException e) {}
    }
}
