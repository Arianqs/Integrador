<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cineplanet Perú I Lo mejor del cine y entretenimiento</title>
<link rel="stylesheet" type="text/css" href="css/index.css">
<link rel="stylesheet" type="text/css" href="css/promos.css">
  <link rel="icon" href="img/icon.ico"  sizes="32x32"   type="image/x-icon">
</head>
<body>
	<div><jsp:include page="/fragmentos/encabezado.jsp" /></div>
	<div class="container">
        <div class="left-section">
            <h1>Eres Entel, <br> eres cine</h1>
            <p>Cine todo el año...</p>
           <button onclick="window.open('https://cdnpe.cineplanet.com.pe/assets/1d9ef03d-4024-4acf-a510-318b8c0bde95.pdf', '_blank');">Términos y condiciones</button>

        </div>
        <div class="right-section">
            <img src ="img/entel.png">
        </div>
    </div>
	<div class="container-1">
        <div class="left-section">
            <h1>Obtén un <br> postcard <br>holográfico <br>de Jung <br>Kook</h1>
            <p>Asiste al estreno de Look Back y obtén un ticket<br> conmemorativo.</p>
            <button onclick="window.open('https://cdnpe.cineplanet.com.pe/assets/83abc51f-b036-438a-bbbf-1024669b35a7.pdf', '_blank');">Términos y condiciones</button>
        </div>
        <div class="right-section">
 			<img src ="img/estreno.png">
        </div>
    </div>
		<footer>
		<%@ include file="fragmentos/footer.jsp" %>
	</footer>
</body>
</html>