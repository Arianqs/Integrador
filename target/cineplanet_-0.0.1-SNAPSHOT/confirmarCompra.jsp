<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Conexion.conexion" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.json.*" %>
<%
    Connection conn = null;
    PreparedStatement pstmtCheck = null;
    PreparedStatement pstmtInsert = null;
    PreparedStatement pstmtUpdate = null;

    try {
        // Obtener los datos enviados
        String datosString = request.getParameter("datos");
        if (datosString != null && !datosString.isEmpty()) {
            // Decodificar los datos
            datosString = java.net.URLDecoder.decode(datosString, "UTF-8");
            
            // Parsear el JSON usando org.json
            JSONObject datosCompra = new JSONObject(datosString);
            double total = datosCompra.getDouble("total");
            JSONArray productos = datosCompra.getJSONArray("productos");

            conn = conexion.getConnection();
            conn.setAutoCommit(false); // Iniciar transacción

            // Preparar statements
            String checkQuery = "SELECT id_producto, stock FROM dulceria WHERE id_producto = ?";
            String updateQuery = "UPDATE dulceria SET stock = stock + ? WHERE id_producto = ?";
            String insertQuery = "INSERT INTO dulceria (id_producto, nombre_producto, precio, stock, categoria, fecha_agregado) VALUES (?, ?, ?, ?, ?, NOW())";

            pstmtCheck = conn.prepareStatement(checkQuery);
            pstmtUpdate = conn.prepareStatement(updateQuery);
            pstmtInsert = conn.prepareStatement(insertQuery);

            // Iterar sobre los productos seleccionados
            for (int i = 0; i < productos.length(); i++) {
                JSONObject producto = productos.getJSONObject(i);
                int id_producto = producto.getInt("id");
                int cantidad = producto.getInt("cantidad");

                // Verificar si el producto ya existe
                pstmtCheck.setInt(1, id_producto);
                ResultSet rs = pstmtCheck.executeQuery();

                if (rs.next()) {
                    // El producto existe, actualizar stock
                    pstmtUpdate.setInt(1, cantidad);
                    pstmtUpdate.setInt(2, id_producto);
                    pstmtUpdate.executeUpdate();
                } else {
                    // El producto no existe, insertar nuevo
                    pstmtInsert.setInt(1, id_producto);
                    pstmtInsert.setString(2, producto.getString("nombre"));
                    pstmtInsert.setDouble(3, producto.getDouble("precio"));
                    pstmtInsert.setInt(4, cantidad);
                    pstmtInsert.setString(5, producto.has("categoria") ? producto.getString("categoria") : "");
                    pstmtInsert.executeUpdate();
                }
                rs.close();
            }

            // Confirmar la transacción
            conn.commit();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Confirmación de Compra</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f0f0f0;
        }
        .container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            max-width: 600px;
            margin: 0 auto;
        }
        h1 {
            color: #2c3e50;
            text-align: center;
        }
        .success-message {
            color: #27ae60;
            text-align: center;
            margin-bottom: 20px;
        }
        .product-list {
            list-style: none;
            padding: 0;
        }
        .product-item {
            padding: 10px;
            border-bottom: 1px solid #eee;
        }
        .total {
            font-weight: bold;
            text-align: right;
            margin-top: 20px;
            font-size: 1.2em;
        }
        .button-container {
            text-align: center;
            margin-top: 20px;
        }
        .button {
            background-color: #3498db;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
        }
        .button:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Confirmación de Compra</h1>
        <div class="success-message">¡Compra realizada con éxito!</div>
        
        <h2>Detalle de la compra:</h2>
        <ul class="product-list">
            <%
                for (int i = 0; i < productos.length(); i++) {
                    JSONObject producto = productos.getJSONObject(i);
                    out.println("<li class='product-item'>" + 
                               producto.getString("nombre") + 
                               " - Cantidad: " + producto.getInt("cantidad") +
                               " - Precio unitario: S/" + producto.getDouble("precio") +
                               "</li>");
                }
            %>
        </ul>
        
        <div class="total">
            Total: S/<%= String.format("%.2f", total) %>
        </div>
        
        <div class="button-container">
            <a href="productos.jsp" class="button">Volver a la tienda</a>
        </div>
    </div>
</body>
</html>
<%
        } else {
            response.sendRedirect("error.jsp?mensaje=No se recibieron datos de la compra");
        }
    } catch (SQLException e) {
        if (conn != null) {
            try { conn.rollback(); } catch (SQLException ex) { ex.printStackTrace(); }
        }
        e.printStackTrace();
        out.println("<h1>Error al procesar la compra: " + e.getMessage() + "</h1>");
    } catch (JSONException e) {
        if (conn != null) {
            try { conn.rollback(); } catch (SQLException ex) { ex.printStackTrace(); }
        }
        out.println("<h1>Error al procesar el JSON: " + e.getMessage() + "</h1>");
    } catch (Exception e) {
        if (conn != null) {
            try { conn.rollback(); } catch (SQLException ex) { ex.printStackTrace(); }
        }
        e.printStackTrace();
        response.sendRedirect("error.jsp?mensaje=" + java.net.URLEncoder.encode(e.getMessage(), "UTF-8"));
    } finally {
        // Cerrar todos los recursos
        if (pstmtCheck != null) try { pstmtCheck.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (pstmtInsert != null) try { pstmtInsert.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (pstmtUpdate != null) try { pstmtUpdate.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) {
            try { 
                conn.setAutoCommit(true); // Restaurar autocommit
                conn.close(); 
            } catch (SQLException e) { 
                e.printStackTrace(); 
            }
        }
    }
%>