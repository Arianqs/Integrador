<%@ page import="Controller.Cifrado" %>
<%@ page import="Service.UsuarioRepository" %>
<%@ page import="Service.UsuarioRepositoryImpl" %>
<%@ page import="Controller.ValidadorUsuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Obtener los parámetros del formulario
    String nombre = request.getParameter("nombre");
    String apellidos = request.getParameter("apellidos");
    String celular = request.getParameter("celular");
    String dni = request.getParameter("numero_documento");
    String email = request.getParameter("correo");
    String password = request.getParameter("contrasena");
    String confirpassword = request.getParameter("confirmar_contrasena");

    // Validación de campos
    if (!ValidadorUsuario.validarCampos(nombre, apellidos, celular, dni, email, password, confirpassword)) {
        out.println("<script>alert('Todos los campos son obligatorios.'); window.location='registro.jsp';</script>");
        return;
    }

    // Verificar si las contraseñas coinciden
    if (!password.equals(confirpassword)) {
        out.println("<script>alert('Las contraseñas no coinciden.'); window.location='registro.jsp';</script>");
        return;
    }

    // Cifrado de contraseña
    Cifrado cifrado = new Cifrado();
    String passwordCifrada = null;

    try {
        passwordCifrada = cifrado.cifrar(password); // Cifrado de la contraseña
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('Error al cifrar la contraseña.'); window.location='registro.jsp';</script>");
        return;
    }

    // Creación del repositorio de usuario
    UsuarioRepository usuarioRepo = new UsuarioRepositoryImpl();

    // Verificación de correo electrónico existente
    if (usuarioRepo.esEmailExistente(email)) {
        out.println("<script>alert('El correo electrónico ya está registrado.'); window.location='registro.jsp';</script>");
        return;
    }

    // Registro del usuario con la contraseña cifrada
    boolean registrado = usuarioRepo.registrarUsuario(nombre, apellidos, celular, dni, email, passwordCifrada, confirpassword);

    if (registrado) {
        out.println("<script>alert('Usuario registrado exitosamente.'); window.location='/cineplanet_/index.jsp';</script>");
    } else {
        out.println("<script>alert('Error al registrar el usuario. Intenta nuevamente.'); window.location='registro.jsp';</script>");
    }
%>
