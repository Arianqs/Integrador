package Service;

import java.io.*;
import java.util.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import javax.mail.*;
import javax.mail.internet.*;
import com.itextpdf.kernel.pdf.*;
import com.itextpdf.layout.*;
import com.itextpdf.layout.element.*;
import com.itextpdf.io.font.constants.*;
import com.itextpdf.kernel.font.*;
import javax.activation.FileDataSource;
import javax.activation.DataHandler;

@WebServlet("/EnviarComprobanteServlet")
public class EnviarComprobanteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");

        if (email != null && !email.isEmpty()) {
            String fullName = request.getParameter("full-name");
            String pelicula = request.getParameter("pelicula");
            String cine = request.getParameter("cine");
            String sala = request.getParameter("sala");
            String asientos = request.getParameter("asientos");
            String formaPago = request.getParameter("forma_pago");
            String fecha = request.getParameter("fecha");
            String horario = request.getParameter("horario");
            String total = request.getParameter("total");

            // Ruta temporal para el archivo PDF
            String pdfPath = getServletContext().getRealPath("/") + "comprobante.pdf";

            try (PdfWriter writer = new PdfWriter(pdfPath)) {
                PdfDocument pdf = new PdfDocument(writer);
                Document document = new Document(pdf);

                // Crear fuente en negrita
                PdfFont boldFont = PdfFontFactory.createFont(StandardFonts.HELVETICA_BOLD);

                // Contenido del PDF con texto en negrita para el título
                document.add(new Paragraph("BOLETA ELECTRÓNICA").setFont(boldFont).setFontSize(18));

                // Agregar los detalles de la compra
                document.add(new Paragraph("Usuario: " + fullName));
                document.add(new Paragraph("Película: " + pelicula));
                document.add(new Paragraph("Cine: " + cine));
                document.add(new Paragraph("Sala: " + sala));
                document.add(new Paragraph("Asientos: " + asientos));
                document.add(new Paragraph("Fecha: " + fecha));
                document.add(new Paragraph("Horario: " + horario));
                document.add(new Paragraph("Forma de Pago: " + formaPago));
                document.add(new Paragraph("Monto Total: S/. " + total));

                document.close();
            } catch (Exception e) {
                e.printStackTrace();
            }

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
                MimeMessage message = new MimeMessage(mailSession);
                message.setFrom(new InternetAddress(fromEmail));
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
                message.setSubject("Comprobante de Compra - Cineplanet");

                // Cuerpo del mensaje
                MimeBodyPart textPart = new MimeBodyPart();
                textPart.setText("Adjunto encontrarás el comprobante de tu compra.");

                // Archivo adjunto
                MimeBodyPart attachmentPart = new MimeBodyPart();
                FileDataSource fileDataSource = new FileDataSource(pdfPath); // Ruta del archivo PDF
                attachmentPart.setDataHandler(new DataHandler(fileDataSource)); // Usando DataHandler con FileDataSource
                attachmentPart.setFileName("comprobante.pdf");
                attachmentPart.setHeader("Content-Type", "application/pdf");

                // Crear multipart para enviar el cuerpo y el adjunto
                Multipart multipart = new MimeMultipart();
                multipart.addBodyPart(textPart);
                multipart.addBodyPart(attachmentPart);

                message.setContent(multipart);

                // Enviar el mensaje
                Transport.send(message);
                System.out.println("Comprobante enviado exitosamente a " + email);

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
