<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Conexion.conexion" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dulcería</title>
    <link rel="stylesheet" href="styles.css">
    
</head>

	<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    try {
        conn = conexion.getConnection();
        stmt = conn.createStatement();
        String query = "SELECT * FROM dulceria";
        rs = stmt.executeQuery(query);
	%>
<style>
/* General Reset */

html {
    box-sizing: border-box;
    cursor: default;
    font-family: sans-serif;
    line-height: 1.5;
    -ms-text-size-adjust: 100%;
    -webkit-text-size-adjust: 100%;
}
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    color: #333;
}

/* Header */
.header {
    background-color: #004A8C;
    font-size 16px;
    line-height: 32px;
    box-shadow: none;
    color: #0D1F40;
    line-height: 2em;
    height: 42px;
    width 935px; 
    max-width: 100%;
    padding: 5px 0 5px 0;
    text-align: center;
}
.heder-contenedor{
	font-size: 16px;
	line-height: 32px;
	text-align: center;
	word-spacing: 0px;
	height: 32px;
	width: 935px;
	display: block;
	



}
.contenedor-button{
	height: 33.5px;
	width: 37px;
	color: #FFFFFF;
    float: left;
    margin: 0 0 0 40px;
    position: relative;
    top: 0px;
    bottom: 0px;
    right: 0px;
    left: 0px;
    float: left;
    display: block;

}
.retroceser{
	background-color: transparent;
    border-style: none;
    color: inherit;
    font-size: 1em;
    margin: 0;
	
	

}
.salir{
	font-family: Arial;
	font-size: 18px;
	line-height: 24px;
	text-align: center;
	display: inline-block;
    font-size: 18px;
    line-height: 24px;
    position: absolute;
    height: 24px;
    width: 41px;
    top: 3.5px;
    bottom: 6px;
    right: 350px;
    left: 1450px;
    display: block;
    color: #FFFFFF;
}

.back-button {
    background-color: transparent;
    border-style: none;
    color: inherit;
    font-size: 1em;
    margin: 0;
}

.descripcion{
	font-family: Arial;
	font-size: 18px;
	line-height: 24px;
	text-align: center;
	display: inline-block;
    font-size: 18px;
    line-height: 24px;
    position: absolute;
    height: 24px;
    width: 41px;
    top: 3.5px;
    bottom: 6px;
    right: -35px;
    left: 31px;
    display: block;

}

h1 {
    color: #FFFFFF;
    display: inline-block;
    font-size: 24px;
    font-weight: 800;
    text-align: center;
    line-height: 32px;
    word-spacing: 0px;
    height: auto;
    width: auto;
    display: inline;
}

/* Container */
.container {
	font-size: 16px;
	line-height: 24px;
    display: flex;
    height: 1555.06px;
    width: 1897px;
    justify-content: center;
    padding: 20px;
    font-family: Arial, sans-serif;
    
}

.main-content {
    font-family: Lato, sans-serif;
	font-size: 16px;
	line-height: 24px;
	text-decoration: none solid rgb(0, 0, 0);
	word-spacing: 0px;
	background-color:  #E7ECF0;
	background-position: 0% 0%;
	color:  #000000;
	height: 1534px;
	width: 780px;
	min-height: auto;
	min-width: auto;
	position: relative;
	top: 0px;
	bottom: 0px;
	right: 0px;
	left: 0px;
	display: block;
}

.location-bar {
	font-family: Lato, sans-serif;
	font-size: 16px;
	line-height: 24px;
	text-decoration: none solid rgb(0, 0, 0);
	word-spacing: 0px;
	background-color:  #F6F6F6;
	background-position: 0% 0%;
	color:  #000000;
	height: 1534px;
	width: 290px;
	min-height: auto;
	min-width: auto;
	display: flex;
}

.location {
    font-family: Lato, sans-serif;
font-size: 16px;
line-height: 24px;
text-decoration: none solid rgb(13, 31, 64);
word-spacing: 0px;
background-color:  #F6F6F6;
background-position: 0% 0%;
color:  #0D1F40;
height: 384px;
width: 290px;
padding: 33px 45px 33px 45px;
display: block;
transform: none
box-sizing: border-box;
}

.location-img {
    width: 80px;
    height: 80px;
    border-radius: 50%;
    margin-bottom: 10px;
}

.location-name {
    font-size: 1.2em;
    font-weight: bold;
    color: #0073e6;
}
.total-section {
    font-family: Lato, sans-serif;
    font-size: 16px;
    line-height: 24px;
    color: #0d1f40;
    height: 24px;
    width: 200px;
    margin: 0 0 7px 0;
    display: block;
    
}

.total-section p {
	color: #E50246;
	height: 36px;
	width: 200px;
    margin: 5px 0;
    display: block;
}
.contenedor-producto{
	height: 769.094px;
width: 780px;
padding: 15px 25px 0 25px;
display: block;

}
.change-cinema {
    color: red;
    text-decoration: none;
    font-size: 0.9em;
}

.category-nav {
	font-size: 16px;
	font-weight: 700;
	line-height: 24px;
	text-align: left;
	text-decoration: none solid rgb(0, 74, 140);
	text-align: left;
	word-spacing: 0px;
	background-color:  ##E7ECF0;
	background-position: 0% 0%;
	background-repeat: no-repeat;
	color:  #004A8C;
	height: 48pxpx;
	width: 755px;
	margin: 16px 0 16px 0;
    display: block;
    list-style-type: outside;
    list-style-position: outside;
    
}

.category-nav a {
    text-decoration: none;
    color: #666;
    font-weight: bold;
    padding: 10px;
    transition: color 0.3s;
}

.category-nav a.active {
    color: #0073e6;
    border-bottom: 2px solid #e50914;
}

.category-nav a:hover {
    color: #0073e6;
}

.productos-contenedor {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
}

/* Grid de productos */
.products-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 20px;
}

/* Tarjeta de producto individual */
.product-card {
    background: white;
    border-radius: 8px;
    padding: 15px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    display: flex;
    flex-direction: column;
    align-items: center;
    transition: transform 0.3s ease;
}

.product-card img {
    max-width: 100%;
    height: auto;
}

.product-card h3 {
    font-size: 1.1em;
    color: #0033a0;
    font-weight: bold;
}


.product-card p {
    text-align: center;
    margin: 5px 0;
}
.quantity-price {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-top: 15px;
}

.btn-minus,
.btn-plus {
    background-color: #0033a0;
    color: #fff;
    border: none;
    padding: 5px 10px;
    cursor: pointer;
}

.product-card h2 {
    font-size: 1.2rem;
    margin: 10px 0;
    text-align: center;
}


.price {
    font-weight: bold;
    color: #2c3e50;
    font-size: 1.1rem;
}

.contenedor-btn-continuar{
	height: 85.7969px;
	width: 730px;
	border-top: 1px solid #dedfe3;
	margin: 37px 25px 0 25px;
	padding: 25px 0 16px 0;
	position: block;
		


}
.contenedor-btn{
	height: 43.7969px;
	width: 730px;
	display: block;
	


}
.btn-continuar {
    position: fixed;
    bottom: 20px;
    right: 20px;
    z-index: 1000;
}

#continuar-btn {
    padding: 12px 24px;
    font-size: 16px;
    border-radius: 8px;
    border: none;
    cursor: not-allowed;
    transition: all 0.3s ease;
    background-color: #cccccc; /* Color cuando está deshabilitado */
    color: #666666;
}

#continuar-btn.active {
    background-color: #007bff; /* Color cuando está activo */
    color: white;
    cursor: pointer;
}

#continuar-btn:hover.active {
    background-color: #0056b3; /* Color más oscuro al hover cuando está activo */
}

/* Estilo para el botón deshabilitado */
#continuar-btn:disabled {
    opacity: 0.7;
}

/* Asegurarse que el botón siempre sea visible sobre otros elementos */
.btn-continuar {
    box-shadow: 0 2px 5px rgba(0,0,0,0.2);
}

.quantity-selector {
    background-color: #FFFFFF;
    background-position: 0% 0%;
    background-repeat: no-repeat;
    color: #004a8c; 
}

.quantity-selector button {
    background: #3498db;
    color: white;
    border: none;
    border-radius: 4px;
    padding: 5px 10px;
    cursor: pointer;
    transition: background 0.3s ease;
}

.quantity-selector button:hover {
    background: #2980b9;
}
/* Footer */
.footer {
    display: flex;
    justify-content: center; 
    text-align: center; 
}

.footer-secundario {
    font-family: Lato, sans-serif;
    font-size: 16px;
    line-height: 24px;
    text-decoration: none solid rgb(255, 255, 255);
    word-spacing: 0px;
    background-color: #FFFFFF;
    color: #083C75; 
    height: 80px;
    width: 100%; 
    border-top: 5px solid #E50246;
    display: flex; 
    justify-content: center; 
    align-items: center; 
    cursor: default;
    transition: all;
    outline: rgb(255, 0, 0) dashed 1px;
}

.footer-tercero {
    color: #083C75; /* Color del texto */
    height: 74px;
    padding: 15px 45px 15px 65px;
    display: flex;
    justify-content: center; /* Centra horizontalmente el contenido */
    align-items: center; /* Centra verticalmente el contenido */
}

.siguenos{
	font-family: Lato, sans-serif;
	font-size: 16px;
	line-height: 24px;
	text-decoration: none solid rgb(8, 60, 117);
	word-spacing: 0px;
	background-color:  #FFFFFF;
	background-position: 0% 0%;
	background-repeat: no-repeat;
	color:  #083C75;
	height: 44px;
	width: 288px;
	min-height: auto;
	min-width: auto;
	display: flex;


}
.social-icons,
.app-icons {
    display: flex;
    justify-content: center;
    gap: 10px;
    margin-top: 5px;
}
.descarga{
	height: 44px;
	width: 288px;
	min-height: auto;
	min-width: auto;
	display: flex;
}
.libro{
	height: 44px;
	width: 288px;
	min-height: auto;
	min-width: auto;
	display: flex;
	color: #083c75;

}


</style>
<body>
    <header class="header">
    <div class="header-contenedor">
    	<div class="contenedor-button">
    	<a href="dulceria.jsp" class="back-button">
    	
    		<span class="descripcion"> Atrás</span>
    	</a>
    		
    	</div>
        
        <h1>1. Dulcería</h1>
        
        
    	<a href="dulceria.jsp" class="retroseder">
    		<span class="salir"> X </span>
    	</a>
    		
    </div>
    	
    </header>

<div class="container">
    <!-- Ubicación y cambio de cine -->
    <div class="location-bar">
        <div class="location">
            <img src="cine.jpg" alt="Cine" class="location-img">
            <p id="location-name" class="location-name">Piura, CP Piura</p>
            <a href="dulceria.jsp" class="change-cinema">Cambiar de cine</a>
            <div class="total-section" id="total-section" ;">
            <p>Dulcería: <span id="cantidad-total">0</span></p>
            <p id="total-value">Total: S/0.00</p>
        </div>
        </div>
        
    </div>

    <main class="main-content">
        <div class="contenedor-productos">
            <!-- Navegación de categorías -->
            <nav class="category-nav">
    		<a href="#" onclick="showCategory('promocional')" class="category-link">Promocional</a>
    		<a href="#" onclick="showCategory('combos')" class="category-link">Combos</a>
    		<a href="#" onclick="showCategory('cancha')" class="category-link">Cancha/HD/Nachos</a>
    		<a href="#" onclick="showCategory('bebidas')" class="category-link">Bebidas</a>
    		<a href="#" onclick="showCategory('golosinas')" class="category-link">Golosinas</a>
			</nav>

            <!-- Sección de productos -->
            <div class="productos-contenedor">
            <div id="products-grid" class="products-grid">
    <% while (rs.next()) { %>
        <div class="product-card">
            <img src="<%= rs.getString("img_url") %>" alt="<%= rs.getString("nombre_producto") %>">
            <h2><%= rs.getString("nombre_producto") %></h2>
            <p><%= rs.getString("descripcion") %></p>
            <p class="price">S/<%= rs.getDouble("precio") %></p>
            <div class="quantity-selector">
                <button onclick="actualizarCantidad('<%= rs.getInt("id_producto") %>', -1)">-</button>
                <span id="cantidad-<%= rs.getInt("id_producto") %>">0</span>
                <button onclick="actualizarCantidad('<%= rs.getInt("id_producto") %>', 1)">+</button>
            			</div>
        			</div>
    			<% } %>
			</div>
            <%
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
			%>
            
            </div>
            
            <!-- Botón Continuar -->
            <div class="contenedor-btn-continuar">
            <div	class="contenedor-btn"	>
            <div class="btn-continuar">
                <button id="continuar-btn" >Continuar</button>
            </div>
            
            </div>
            
            
            
            </div>
            
        </div>
    </main>
</div>
    <footer class="footer">
    <div class="footer-secundario">
    	<div class="footer-tercero">
    		<div class="siguenos">
    		<p>Síguenos en:</p>
        	<div class="social-icons">
            <!-- Social icons go here -->
            <svg width="25px" height="25px" viewBox="0 0 192 192" xmlns="http://www.w3.org/2000/svg" fill="none"><path stroke="#000000" stroke-linecap="round" stroke-width="12" d="M96 170c40.869 0 74-33.131 74-74 0-40.87-33.131-74-74-74-40.87 0-74 33.13-74 74 0 40.869 33.13 74 74 74Zm0 0v-62m30-48h-10c-11.046 0-20 8.954-20 20v28m0 0H74m22 0h22"/></svg>
<svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="25" height="25" viewBox="0 0 24 24">
<g opacity=".3"><polygon fill="#fff" fill-rule="evenodd" points="16.002,19 6.208,5 8.255,5 18.035,19" clip-rule="evenodd"></polygon><polygon points="8.776,4 4.288,4 15.481,20 19.953,20 8.776,4"></polygon></g><polygon fill-rule="evenodd" points="10.13,12.36 11.32,14.04 5.38,21 2.74,21" clip-rule="evenodd"></polygon><polygon fill-rule="evenodd" points="20.74,3 13.78,11.16 12.6,9.47 18.14,3" clip-rule="evenodd"></polygon><path d="M8.255,5l9.779,14h-2.032L6.208,5H8.255 M9.298,3h-6.93l12.593,18h6.91L9.298,3L9.298,3z"></path>
</svg>
        	<svg width="25px" height="25px" viewBox="0 0 48 48" xmlns="http://www.w3.org/2000/svg"><defs><style>.a{fill:none;stroke:#000000;stroke-linecap:round;stroke-linejoin:round;}</style></defs><path class="a" d="M43.1124,14.394a5.0056,5.0056,0,0,0-3.5332-3.5332c-2.3145-.8936-24.7326-1.3314-31.2358.0256A5.0059,5.0059,0,0,0,4.81,14.42c-1.0446,4.583-1.1239,14.4914.0256,19.1767A5.006,5.006,0,0,0,8.369,37.13c4.5829,1.0548,26.3712,1.2033,31.2358,0a5.0057,5.0057,0,0,0,3.5332-3.5333C44.2518,28.6037,44.3311,19.31,43.1124,14.394Z"/><path class="a" d="M30.5669,23.9952,20.1208,18.004V29.9863Z"/></svg>
        	</div>
    		</div>
    		<div class="descarga">
    			<p>Descarga la app:</p>
    			<div class="app-icons">
            	<!-- App icons go here -->
            	<svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="25" height="25" viewBox="0 0 50 50">
<path d="M 7.125 2 L 28.78125 23.5 L 34.71875 17.5625 L 8.46875 2.40625 C 8.03125 2.152344 7.5625 2.011719 7.125 2 Z M 5.3125 3 C 5.117188 3.347656 5 3.757813 5 4.21875 L 5 46 C 5 46.335938 5.070313 46.636719 5.1875 46.90625 L 27.34375 24.90625 Z M 36.53125 18.59375 L 30.1875 24.90625 L 36.53125 31.1875 L 44.28125 26.75 C 45.382813 26.113281 45.539063 25.304688 45.53125 24.875 C 45.519531 24.164063 45.070313 23.5 44.3125 23.09375 C 43.652344 22.738281 38.75 19.882813 36.53125 18.59375 Z M 28.78125 26.3125 L 6.9375 47.96875 C 7.300781 47.949219 7.695313 47.871094 8.0625 47.65625 C 8.917969 47.160156 26.21875 37.15625 26.21875 37.15625 L 34.75 32.25 Z"></path>
</svg>
            	<svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="25" height="25" viewBox="0 0 30 30">
    <path d="M25.565,9.785c-0.123,0.077-3.051,1.702-3.051,5.305c0.138,4.109,3.695,5.55,3.756,5.55 c-0.061,0.077-0.537,1.963-1.947,3.94C23.204,26.283,21.962,28,20.076,28c-1.794,0-2.438-1.135-4.508-1.135 c-2.223,0-2.852,1.135-4.554,1.135c-1.886,0-3.22-1.809-4.4-3.496c-1.533-2.208-2.836-5.673-2.882-9 c-0.031-1.763,0.307-3.496,1.165-4.968c1.211-2.055,3.373-3.45,5.734-3.496c1.809-0.061,3.419,1.242,4.523,1.242 c1.058,0,3.036-1.242,5.274-1.242C21.394,7.041,23.97,7.332,25.565,9.785z M15.001,6.688c-0.322-1.61,0.567-3.22,1.395-4.247 c1.058-1.242,2.729-2.085,4.17-2.085c0.092,1.61-0.491,3.189-1.533,4.339C18.098,5.937,16.488,6.872,15.001,6.688z"></path>
</svg>
        		</div>
    		</div>
    		<div class="libro">
    			<svg width="25px" height="25px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M12 10.4V20M12 10.4C12 8.15979 12 7.03969 11.564 6.18404C11.1805 5.43139 10.5686 4.81947 9.81596 4.43597C8.96031 4 7.84021 4 5.6 4H4.6C4.03995 4 3.75992 4 3.54601 4.10899C3.35785 4.20487 3.20487 4.35785 3.10899 4.54601C3 4.75992 3 5.03995 3 5.6V16.4C3 16.9601 3 17.2401 3.10899 17.454C3.20487 17.6422 3.35785 17.7951 3.54601 17.891C3.75992 18 4.03995 18 4.6 18H7.54668C8.08687 18 8.35696 18 8.61814 18.0466C8.84995 18.0879 9.0761 18.1563 9.29191 18.2506C9.53504 18.3567 9.75977 18.5065 10.2092 18.8062L12 20M12 10.4C12 8.15979 12 7.03969 12.436 6.18404C12.8195 5.43139 13.4314 4.81947 14.184 4.43597C15.0397 4 16.1598 4 18.4 4H19.4C19.9601 4 20.2401 4 20.454 4.10899C20.6422 4.20487 20.7951 4.35785 20.891 4.54601C21 4.75992 21 5.03995 21 5.6V16.4C21 16.9601 21 17.2401 20.891 17.454C20.7951 17.6422 20.6422 17.7951 20.454 17.891C20.2401 18 19.9601 18 19.4 18H16.4533C15.9131 18 15.643 18 15.3819 18.0466C15.15 18.0879 14.9239 18.1563 14.7081 18.2506C14.465 18.3567 14.2402 18.5065 13.7908 18.8062L12 20" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
</svg>
        	//Libro
        	<a href="#">Libro de Reclamaciones</a>
    		</div>
    	</div>
    </div>
        
    </footer>
    <script src="js/productos.js" type="text/javascript"></script>
</body>
</html>
    