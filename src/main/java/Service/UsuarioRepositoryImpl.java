package Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Conexion.conexion;

public class UsuarioRepositoryImpl implements UsuarioRepository {
    @Override
    public boolean esEmailExistente(String email) {
        try (Connection conn = conexion.getConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT COUNT(*) FROM usuarios WHERE email = ?")) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean registrarUsuario(String nombre, String apellidos, String celular, String dni, String email, String password, String confirpassword) {
        // Adjust the query to reflect the correct column for confirpassword
        String sql = "INSERT INTO usuarios (nombre, apellidos, celular, dni, email, rol, password, confirpassword, fecha_creacion) VALUES (?, ?, ?, ?, ?, 'usuario', ?, ?, NOW())";
        try (Connection conn = conexion.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, nombre);
            stmt.setString(2, apellidos);
            stmt.setString(3, celular);
            stmt.setString(4, dni);
            stmt.setString(5, email);
            stmt.setString(6, password);
            stmt.setString(7, confirpassword); // Corrected: now setting at position 7
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // Returns false if there's an error
    }
}
