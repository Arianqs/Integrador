package Service;

public interface UsuarioRepository {
    boolean esEmailExistente(String email);
    boolean registrarUsuario(String nombre, String apellidos, String celular, String dni, String email, String password);
}
