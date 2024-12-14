package Controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.core.LoggerContext;
import org.apache.logging.log4j.core.config.Configuration;
import org.apache.logging.log4j.core.config.builder.api.AppenderComponentBuilder;
import org.apache.logging.log4j.core.config.builder.api.ConfigurationBuilder;
import org.apache.logging.log4j.core.config.builder.impl.BuiltConfiguration;
import org.apache.logging.log4j.core.config.builder.impl.DefaultConfigurationBuilder;

public class LogConfig {

    private static final Logger logger = LogManager.getLogger(LogConfig.class);

    public static void initializeLogger() {
        // Crea un builder de configuración
        ConfigurationBuilder<BuiltConfiguration> builder = new DefaultConfigurationBuilder<>();

        // Configura el Appender para consola
        AppenderComponentBuilder consoleAppender = builder.newAppender("Console", "CONSOLE")
                .add(builder.newLayout("PatternLayout")
                        .addAttribute("pattern", "%d{yyyy-MM-dd HH:mm:ss} [%t] %-5level %logger{36} - %msg%n"));
        builder.add(consoleAppender);

        // Configura el Appender para archivo
        AppenderComponentBuilder fileAppender = builder.newAppender("File", "FILE")
                .addAttribute("fileName", "logs/cineplanet.log")
                .add(builder.newLayout("PatternLayout")
                        .addAttribute("pattern", "%d{yyyy-MM-dd HH:mm:ss} [%t] %-5level %logger{36} - %msg%n"));
        builder.add(fileAppender);

        // Configura el logger raíz
        builder.add(builder.newRootLogger(org.apache.logging.log4j.Level.INFO)
                .add(builder.newAppenderRef("Console"))
                .add(builder.newAppenderRef("File")));

        // Aplica la configuración
        LoggerContext context = (LoggerContext) LogManager.getContext(false);
        Configuration config = builder.build();
        context.start(config);

        logger.info("Logger inicializado correctamente.");
    }
}
