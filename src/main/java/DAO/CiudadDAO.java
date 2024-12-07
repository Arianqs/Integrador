package DAO;

import java.util.List;

import Model.Ciudades;

public interface CiudadDAO {
	List<Ciudades> obt_Ciudades();
	Ciudades id_ciudad(int id);
	void agregar(Ciudades ciudad);
	void modificiar(Ciudades ciudad);
	void eliminar(int id);
}
