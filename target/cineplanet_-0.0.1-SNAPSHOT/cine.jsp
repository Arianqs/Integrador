<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.List" %>
<%@ page import="Controller.metPeliculasCines" %> 
<%@ page import="Model.Cines" %>
<%@ page import="DAO.CiudadDAO" %>
<%@ page import="DAO.Ciu_DAO_Implimentado" %>
<%@ page import="Model.Ciudades" %>
<%@ page import="java.util.List, java.util.ArrayList" %>
<%@ page import="java.sql.*, java.util.*" %>


<!DOCTYPE html>
<html>
<head>
  <link rel="icon" href="img/icon.ico"  sizes="32x32"   type="image/x-icon">
    <title>Cineplanet Perú I Lo mejor del cine y entretenimiento</title>
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <link rel="stylesheet" type="text/css" href="css/estilotabla2.css">
    <style>
            body {
                margin: 0;
                padding: 0;
                overflow-x: hidden;
                font-family: Arial, sans-serif;
            }

            h1 {
                color: #004A8C;
                font: 800 60px / 1.0666 "Montserrat", sans-serif;
                text-align: left;
                margin-left: 32%;
            }

           
            .filter-container {
              display: flex;
                align-items: center;
                justify-content: space-between;
                max-width: 35%;
                margin: 0 auto;
                padding: 10px;
                border-bottom: solid 1px #A0A6AB;
                border-top: solid 1px #A0A6AB;
                border-left: none;  
                border-right: none;  

                padding: 19px 0 10px;
                position: relative;
				box-sizing: inherit;
            }


            .combobox-item {
                display: flex;
                flex-direction: column;
                gap: 0px;
            }

          
            select {
                width: 250px;
                height: 45px;
                padding: 5px 10px;
                font-size: 16px;
                border: rgba(255, 255, 255, 0);
                border-radius: 8px;

                cursor: pointer;
                transition: all 0.3s ease;
                margin: 0; 
                transform: translateX(-10px);
            }


            .view-options {
                display: flex;
                align-items: center;
                gap: 15px;
            }

            .view-btn {
                background: none;
                border: none;
                font-weight: bold;
                cursor: pointer;
                padding: 10px;
                font-size: 14px;
            }

            .view-btn.active {
                color: #1a1a1a;
            }

            .view-btn.disabled {
                color: lightgray;
                cursor: not-allowed;
            }

        
            .divider {
                width: 1px;
                height: 40px;
                background-color: #d3d3d3;
            }
            .label {
                font-weight: 800;
                font-size: 20px;
                top: 3px;
            }
			        .informacion-container {
            text-align: center;
            font-family: Arial, sans-serif;
            margin-top: 50px;
        }
        .divider {
            border-top: 1px solid #d1d1d1;
            margin: 20px 0;
        }
.informacion-titulo {
    font-weight: bold;
    color: #003366;
    font-size: 1.2em;
    margin-right: 540px; 
    
}

.informacion-texto {
    color: #333;
    max-width: 750px;
    margin: 0 auto;
    text-align: left;
    color: #0D1F40;
    font: 12px / 1.33 "Lato", sans-serif;
    font-size: 16px;
        
}

        </style>
    
    <script>
        function cargarCines() {
            var ciudadId = document.getElementById("ciudades").value;
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("cines").innerHTML = this.responseText;
                }
            };
            xhttp.open("GET", "cargarCines.jsp?ciudadId=" + ciudadId, true);
            xhttp.send();
        }

        function mostrarCine() {
            var cineId = document.getElementById("cines").value;
            if (cineId) {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById("resultado").innerHTML = this.responseText;
                    }
                };
                xhttp.open("GET", "mostrarCine.jsp?cineId=" + cineId, true);
                xhttp.send();
            } else {
                document.getElementById("resultado").innerHTML = "";
            }
        }
    </script>
</head>
<jsp:include page="/fragmentos/encabezado.jsp" />
<br><br><br><br>
<body>

<h1>Cines</h1>
   <div class="filter-container">
    <table class="filter-table">
        <tr>
            <form action="cines.jsp" method="post">
                <td>
                    <div class="combobox-item">
    <label for="ciudades" style="font-size: 1.3em; font-weight: bold;">Por ciudad:</label>
    <select id="ciudades" name="ciudades" onchange="cargarCines()">
        <option value="">--Seleccionar--</option>
        <%
                                // Establecer la conexión y obtener las ciudades utilizando el patrón DAO
                                Connection conexion = null;
                                try {
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/cineplanet", "root", "");
                                    CiudadDAO ciudadesDAO = new Ciu_DAO_Implimentado(conexion);
                                    List<Ciudades> ciudades = ciudadesDAO.obt_Ciudades();

                                    for (Ciudades ciudad : ciudades) {
                            %>
                                        <option value="<%= ciudad.getId() %>"><%= ciudad.getNombreCiudad() %></option>
                            <%
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                } finally {
                                    if (conexion != null) try { conexion.close(); } catch (Exception e) { e.printStackTrace(); }
                                }
                            %>
        
    </select>
    </div>
    </td>

    <br><br>
    <td>
    <div class="combobox-item">
  <label for="cines" style="font-size: 1.3em; font-weight: bold;">Por cine:</label>
    <select id="cines" name="cines" onchange="mostrarCine()">
        <option value="">-- Seleccionar --</option>
        
        <!-- Aquí se cargarán los cines a través de AJAX -->
    </select>
    </div>
    </td>
    </form>
    </tr>
    </table>
<div class="view-options">
                <button class="view-btn active">Lista</button>
                <button class="view-btn disabled">   </button>
            </div>
</div>
    
    <div id="resultado"></div>


    
     
    <br><br><br><br><br><br> <br><br><br><br><br><br>
    <footer>
		<%@ include file="fragmentos/footer.jsp" %>
	</footer>
</select>
</body>
</html>
