package Conexion;

import Conexion.conexion;
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class validar extends JFrame {

    private JTextField txtNombrePelicula;
    private JLabel lblImagen;
    private String imagenPath;

    public validar() {
        setTitle("Subir Imagen de Película");
        setSize(400, 300);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        setLayout(new BorderLayout());

        // Panel de campos de entrada
        JPanel panelInputs = new JPanel(new GridLayout(3, 2, 10, 10));
        panelInputs.setBorder(BorderFactory.createEmptyBorder(20, 20, 20, 20));

        JLabel lblNombre = new JLabel("Nombre de la película:");
        txtNombrePelicula = new JTextField();

        lblImagen = new JLabel("Seleccionar imagen:");

        JButton btnSeleccionarImagen = new JButton("Seleccionar");
        btnSeleccionarImagen.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                seleccionarImagen();
            }
        });

        panelInputs.add(lblNombre);
        panelInputs.add(txtNombrePelicula);
        panelInputs.add(lblImagen);
        panelInputs.add(btnSeleccionarImagen);

        // Botón para guardar
        JButton btnGuardar = new JButton("Guardar");
        btnGuardar.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                guardarPelicula();
            }
        });

        // Agregar componentes al frame
        add(panelInputs, BorderLayout.CENTER);
        add(btnGuardar, BorderLayout.SOUTH);
    }

    private void seleccionarImagen() {
        JFileChooser fileChooser = new JFileChooser();
        fileChooser.setFileSelectionMode(JFileChooser.FILES_ONLY);
        int result = fileChooser.showOpenDialog(this);

        if (result == JFileChooser.APPROVE_OPTION) {
            File selectedFile = fileChooser.getSelectedFile();
            imagenPath = selectedFile.getAbsolutePath();
            lblImagen.setText("Imagen seleccionada: " + selectedFile.getName());
        }
    }

    private void guardarPelicula() {
        String nombrePelicula = txtNombrePelicula.getText();

        if (nombrePelicula.isEmpty() || imagenPath == null) {
            JOptionPane.showMessageDialog(this, "Debe ingresar un nombre de película y seleccionar una imagen.", "Error", JOptionPane.ERROR_MESSAGE);
            return;
        }

        // Definir la carpeta donde se guardarán las imágenes (cambia la ruta según tu sistema)
        String carpetaImagenes = "C:/imagenes_peliculas/";
        File carpeta = new File(carpetaImagenes);
        if (!carpeta.exists()) {
            carpeta.mkdirs(); // Crea la carpeta si no existe
        }

        // Copiar la imagen a la carpeta especificada
        String nuevoPathImagen = carpetaImagenes + new File(imagenPath).getName();
        try {
            Files.copy(Paths.get(imagenPath), Paths.get(nuevoPathImagen), StandardCopyOption.REPLACE_EXISTING);

            // Guardar la película en la base de datos
            insertarPeliculaEnBD(nombrePelicula, nuevoPathImagen);
            JOptionPane.showMessageDialog(this, "Película e imagen guardadas correctamente.");

        } catch (Exception ex) {
            ex.printStackTrace();
            JOptionPane.showMessageDialog(this, "Error al guardar la película.", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    private void insertarPeliculaEnBD(String nombre, String imagen) {
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = conexion.getConnection();
            String sql = "INSERT INTO pelicula (nombre_pelicula, imagen) VALUES (?, ?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, nombre);
            pstmt.setString(2, imagen);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
                new validar().setVisible(true);
            }
        });
    }
}

