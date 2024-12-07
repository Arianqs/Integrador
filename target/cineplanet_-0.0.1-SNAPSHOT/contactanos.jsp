<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Contáctanos</title>
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/index.css">
        <link rel="icon" href="img/icon.ico"  sizes="32x32"   type="image/x-icon">

        <style>
            #popup {
                display: none;
                position: fixed;
                left: 50%;
                top: 50%;
                transform: translate(-50%, -50%);
                background-color: white;
                padding: 20px;
                box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                text-align: center;
                z-index: 1000;
            }
            #popup h3 {
                margin-bottom: 10px;
            }
            #popup button {
                padding: 10px 20px;
                background-color: #d9534f;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            #popup button:hover {
                background-color: #c9302c;
            }
            #overlay {
                display: none;
                position: fixed;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                z-index: 999;
            }
        </style>
    </head>
    <body>
    <jsp:include page="/fragmentos/encabezado.jsp" />

    <main>
        <div class="contenedor-contactanos">
            <h2>Contáctanos</h2>
            <p class="mensaje-consulta">Atención de Consultas o Incidencias</p>
            <p class="mensaje-completar">Para asegurar la calidad y optimización de nuestro servicio, por favor llenar todos los campos que solicitamos.¡Gracias!</p>

            <form id="contactForm" action="tu_script_o_pagina.php" method="post">
                <div class="form-container">
                    <!-- Primera fila: Nombre y Apellidos -->
                    <div class="input-container">
                        <input type="text" id="nombre" name="nombre" class="input-leftt" placeholder="Nombre" maxlength="50" required>
                        <label for="nombre" class="label-custom">Nombre</label>
                    </div>   

                    <div class="input-container">
                        <input type="text" id="apellidos" name="apellidos" class="input-leftt" placeholder="Apellidos" maxlength="50" required>
                        <label for="apellidos" class="label-custom">Apellidos</label>
                    </div>

                    <!-- Segunda fila: Teléfono y Correo -->
                    <div class="membership">
                        <p>¿Eres Socio Cineplanet?</p>
                        <div class="options">
                            <label>
                                <input type="radio" name="socio" value="si" id="si" checked>
                                <span class="custom-radio si"></span>Sí
                            </label>
                            <label>
                                <input type="radio" name="socio" value="no" id="no">
                                <span class="custom-radio no"></span>No
                            </label>
                        </div>
                    </div>

                    <!-- Segunda fila: DNI y Teléfono -->
                    <div class="input-container">
                        <input type="text" id="dni" name="dni" class="input-leftt" placeholder="DNI" maxlength="50" required>
                        <label for="dni" class="label-custom">DNI</label>
                    </div>

                    <div class="input-container">
                        <input type="tel" id="telefono" name="telefono" class="input-leftt" placeholder="Teléfono de contacto" maxlength="15" required>
                        <label for="telefono" class="label-custom">Teléfono de contacto</label>
                    </div>

                    <div class="input-container">
                        <input type="email" id="correo" name="correo" class="input-leftt" placeholder="Correo electrónico" maxlength="50" required>
                        <label for="correo" class="label-custom">Correo electrónico</label>
                    </div>
                </div>
            </form>
            <div class="select-container">
                <label for="motivo">Motivo</label>
                <select id="motivo" name="motivo">
                    <option value="actualizacion">ACTUALIZACIÓN DE DATOS</option>
                    <option value="compras_online">COMPRAS ONLINE</option>
                    <option value="incidencias">INCIDENCIAS EN CINES</option>
                    <option value="programa">PROGRAMA SOCIO</option>
                    <option value="ventas">VENTAS CORPORATIVAS</option>
                    <option value="promociones">PROMOCIONES Y CAMPAÑAS</option>
                    <option value="felicitaciones">FELICITACIONES</option>
                    <option value="otros">OTROS MOTIVOS</option>
                </select>
            </div>


            <div class="fila-contacto">
                <label for="mensaje" class="label-mensaje">Mensaje - Por favor ingresa aquí todos los detalles de tu caso.</label>
                <textarea id="mensaje" name="mensaje" maxlength="500" style="height: 340px; width:960px;" placeholder=""></textarea>
            </div>
            <p class="nota-archivos">Caracteres restantes: 5000</p>
            <div class="fila-archivos">
                <label for="archivo" class="label-archivo">Archivos adjuntos - Si deseas, agrega algún archivo para complementar la información brindada.</label>

                <div class="upload-area">
                    <input type="file" id="archivo" name="archivo" multiple hidden>
                    <label for="archivo" class="upload-label">Escoge un archivo o arrástralo</label>
                </div>

                <p class="nota-archivos">Tamaño máximo permitido: 5MB<br> 
                    Archivos permitidos:.JPG, .PNG, .PDF, .DOCX</p>
            </div>
            <div class="terminos">
                <div class="checkbox-item">
                    <input type="checkbox" id="acepto-terminos" name="acepto-terminos" required>
                    <label for="acepto-terminos">Acepto los <a href="#">Términos y Condiciones</a>, <a href="#">Política de Privacidad</a> y Tratamiento necesario de datos</label>
                </div>

                <div class="checkbox-item">
                    <input type="checkbox" id="acepto-finalidades" name="acepto-finalidades" required>
                    <label for="acepto-finalidades">He leído y acepto las finalidades de tratamiento adicionales</label>
                </div>

                <div class="checkbox-item">
                    <input type="checkbox" id="acepto-opcional" name="acepto-opcional">
                    <label for="acepto-opcional">Acepto el tratamiento opcional de datos</label>
                </div>
            </div>

            <div class="contacto-fila">
                <button type="submit" class="boton-redondo">Enviar</button>
            </div>


            </form>
        </div>
    </main>

    <!-- Ventana emergente -->
    <div id="overlay"></div> <!-- Fondo oscuro -->
    <div id="popup">
        <h3>¡Formulario enviado con éxito!</h3>
        <p>Gracias por contactarnos, nos pondremos en contacto contigo pronto.</p>
        <button id="closePopup">Cerrar</button>
    </div>


    <script>
        document.querySelectorAll("input").forEach(function (input) {
            input.addEventListener("focus", function () {
                this.dataset.placeholder = this.placeholder; 
                this.placeholder = "";
            });

            input.addEventListener("blur", function () {
                this.placeholder = this.dataset.placeholder;
            });
        });
    </script>

    <script>
        const radioSi = document.getElementById('si');
        const radioNo = document.getElementById('no');
        const radioSiBox = document.querySelector('.si');
        const radioNoBox = document.querySelector('.no');

    
        function updateColors() {
            if (radioSi.checked) {
                radioSiBox.style.backgroundColor = '#003366'; 
                radioNoBox.style.backgroundColor = '#d3d3d3';
            } else {
                radioSiBox.style.backgroundColor = '#d3d3d3';
                radioNoBox.style.backgroundColor = '#003366'; 
        }


        radioSi.addEventListener('change', updateColors);
        radioNo.addEventListener('change', updateColors);


        updateColors();
    </script>

    <script>

        const urlParams = new URLSearchParams(window.location.search);
        const formSent = urlParams.get('sent');

        if (formSent) {

            document.getElementById('popup').style.display = 'block';
            document.getElementById('overlay').style.display = 'block';
        }


        document.getElementById('closePopup').addEventListener('click', function () {
            document.getElementById('popup').style.display = 'none';
            document.getElementById('overlay').style.display = 'none';

            urlParams.delete('sent');
            window.history.replaceState({}, document.title, window.location.pathname + '?' + urlParams.toString());
        });
    </script>
    <footer>
        <%@ include file="fragmentos/footer.jsp" %>
    </footer>
</body>
</html>

