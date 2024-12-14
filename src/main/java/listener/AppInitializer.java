package listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import Controller.LogConfig;


@WebListener
public class AppInitializer implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        LogConfig.initializeLogger();
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // Opcional: Detener el contexto de Log4j si es necesario
    }
}
