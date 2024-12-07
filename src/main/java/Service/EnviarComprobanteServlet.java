package Service;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

@WebServlet("/EnviarComprobanteServlet")
public class EnviarComprobanteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener el correo desde el formulario
        String email = request.getParameter("email");

        if (email != null && !email.isEmpty()) {
            // Recoger los demás datos del formulario
            String fullName = request.getParameter("full-name");
            String pelicula = request.getParameter("pelicula");
            String cine = request.getParameter("cine");
            String sala = request.getParameter("sala");
            String asientos = request.getParameter("asientos");
            String formaPago = request.getParameter("forma_pago");
            String fecha = request.getParameter("fecha");
            String horario = request.getParameter("horario");
            String total = request.getParameter("total");

            // Configuración del correo
            String host = "smtp.gmail.com";
            final String fromEmail = "sherlinzelada@gmail.com"; 
            final String password = "dtgcuktkaxeipaba"; 

            Properties properties = new Properties();
            properties.put("mail.smtp.host", host);
            properties.put("mail.smtp.port", "587");
            properties.put("mail.smtp.auth", "true");
            properties.put("mail.smtp.starttls.enable", "true");

            Session mailSession = Session.getInstance(properties, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });

            try {
                // Crear mensaje de correo
                MimeMessage message = new MimeMessage(mailSession);
                message.setFrom(new InternetAddress(fromEmail));
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(email)); // Enviar al email del usuario
                message.setSubject("Comprobante de Compra - Cineplanet");

                // Cuerpo del correo
                String emailBody = "BOLETA ELECTRÓNICA\n\n" +
                        "Usuario: " + fullName + "\n" +
                        "Película: " + pelicula + "\n" +
                        "Cine: " + cine + "\n" +
                        "Sala: " + sala + "\n" +
                        "Asientos: " + asientos + "\n" +
                        "Fecha: " + fecha + "\n" +
                        "Horario: " + horario + "\n" +
                        "Forma de Pago: " + formaPago + "\n" +
                        "Monto Total: S/. " + total;

                message.setText(emailBody);

                // Enviar el correo
                Transport.send(message);
                System.out.println("Comprobante enviado exitosamente a " + email);

                // Redirigir a la página de confirmación
                response.sendRedirect("index.jsp");

            } catch (MessagingException e) {
                e.printStackTrace();
                response.getWriter().write("Error al enviar el comprobante. " + e.getMessage());
            }
        } else {
            response.getWriter().write("Correo no válido.");
        }
    }
}
