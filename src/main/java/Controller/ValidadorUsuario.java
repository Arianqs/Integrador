package Controller;

public class ValidadorUsuario {
    public static boolean validarCampos(String nombre, String apellidos, String celular, String dni, String email, String password) {
    	//retorna falso si algun campo este vacio
        return !(nombre == null || nombre.isEmpty() ||
                 apellidos == null || apellidos.isEmpty() ||
                 celular == null || celular.isEmpty() ||
                 dni == null || dni.isEmpty() ||
                 email == null || email.isEmpty() ||
                 password == null || password.isEmpty());
    }
}
