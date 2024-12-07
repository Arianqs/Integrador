package com.example; // Asegúrate de cambiarlo al nombre de tu paquete real

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class RelacionManager {
    public List<Pelicula> obtenerPeliculasConLimite(int offset, int limit) {
        List<Pelicula> peliculas = new ArrayList<>();
        
        // Código para establecer la conexión a la base de datos
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM peliculas LIMIT ? OFFSET ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, limit);
            stmt.setInt(2, offset);
            
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                Pelicula pelicula = new Pelicula();
                pelicula.setTitulo(rs.getString("titulo"));
                pelicula.setImagen(rs.getString("imagen"));
                pelicula.setGenero(rs.getString("genero"));
                peliculas.add(pelicula);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return peliculas;
    }
}
