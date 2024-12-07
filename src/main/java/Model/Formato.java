package Model;

public class Formato {
    private int id;
    private String nombre;

    // Constructor
    public Formato(int idFormato, String nombreFormato) {
        this.id = idFormato;
        this.nombre = nombreFormato;
    }

    // Getters y Setters
    public int getIdFormato() {
        return id;
    }

    public void setIdFormato(int idFormato) {
        this.id = idFormato;
    }

    public String getNombreFormato() {
        return nombre;
    }

    public void setNombreFormato(String nombreFormato) {
        this.nombre = nombreFormato;
    }

    @Override
    public String toString() {
        return nombre;
    }
}
