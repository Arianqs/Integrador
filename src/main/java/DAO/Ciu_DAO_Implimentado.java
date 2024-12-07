package DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import Model.Ciudades;

public class Ciu_DAO_Implimentado implements CiudadDAO {
	private Connection con;

    public Ciu_DAO_Implimentado(Connection con) {
        this.con = con;
    }

	@Override
	public List<Ciudades> obt_Ciudades() {
		List<Ciudades> ciudades= new ArrayList<>();
		String sql="Select id, nombre_ciudad FROM ciudades";
		
		try (PreparedStatement stmt = con.prepareStatement(sql);
				ResultSet rs = stmt.executeQuery()){
			while(rs.next()) {
				int id=rs.getInt("id");
				String nombre=rs.getString("nombre_ciudad");
				ciudades.add(new Ciudades(id,nombre));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return ciudades;
	}

	@Override
	public Ciudades id_ciudad(int id) {
		Ciudades ciudad=null;
		String sql="Select id, nombre_ciudad from ciudades where id = ?";
		try(PreparedStatement pstmt= con.prepareStatement(sql)){
			pstmt.setInt(1, id);
			try(ResultSet set=pstmt.executeQuery()){
				if(set.next()) {
					String nombre=set.getString("nombre_ciudad");
					ciudad= new Ciudades(id, nombre);
				}
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return ciudad;
	}

	@Override
	public void agregar(Ciudades ciudad) {
		String sql= "Insert into ciudades (nombre_ciudad) values (?)";
		try(PreparedStatement pstmt= con.prepareStatement(sql)){
			pstmt.setString(1, ciudad.getNombreCiudad());
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void modificiar(Ciudades ciudad) {
		String sql= "Update ciudades set nombre_ciudad = (?) where id = (?)";
		try(PreparedStatement pstmt= con.prepareStatement(sql)){
			pstmt.setString(1, ciudad.getNombreCiudad());
			pstmt.setInt(2, ciudad.getId());
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void eliminar(int id) {
		String sql= "Insert into ciudades (nombre_ciudad) values (?)";
		try(PreparedStatement pstmt= con.prepareStatement(sql)){
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
	}
	
}
