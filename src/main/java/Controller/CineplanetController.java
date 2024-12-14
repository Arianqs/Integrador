package Controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class CineplanetController {
    private static final Logger logger = LogManager.getLogger(CineplanetController.class);

    public void procesarCompra(String usuario, String pelicula) {
        logger.info("El usuario '{}' está procesando la compra para la película '{}'", usuario, pelicula);
        try {
            // Simula un procesamiento
            Thread.sleep(1000);
            logger.debug("Compra procesada exitosamente para el usuario '{}'", usuario);
        } catch (Exception e) {
            logger.error("Error procesando la compra para el usuario '{}': ", usuario, e);
        }
    }
}
