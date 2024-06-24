package bootiful.service;

import org.springframework.aot.hint.RuntimeHints;
import org.springframework.aot.hint.RuntimeHintsRegistrar;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.SmartLifecycle;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ImportRuntimeHints;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.data.annotation.Id;
import org.springframework.data.repository.ListCrudRepository;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.function.RouterFunction;
import org.springframework.web.servlet.function.ServerResponse;

import java.time.Duration;
import java.time.Instant;
import java.time.LocalDate;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;

import static org.springframework.web.servlet.function.RouterFunctions.route;


@SpringBootApplication
@ImportRuntimeHints(ServiceApplication.Hints.class)
public class ServiceApplication {

    static final AtomicReference<Instant> START_TIME = new AtomicReference<>();

    static final AtomicReference<Instant> STOP_TIME = new AtomicReference<>();

    public static void main(String[] args) {
        START_TIME.set(Instant.now());
        SpringApplication.run(ServiceApplication.class, args);
    }


    private static final Resource HELLO = new ClassPathResource("/hello");

    static class Hints implements RuntimeHintsRegistrar {

        @Override
        public void registerHints(RuntimeHints hints, ClassLoader classLoader) {
            hints.resources().registerResource(HELLO);
        }

    }

    @Component
    static class ReadyListener implements ApplicationListener<ApplicationReadyEvent> {

        @Override
        public void onApplicationEvent(ApplicationReadyEvent event) {
            STOP_TIME.set(Instant.now());
        }
    }


    @Bean
    RouterFunction<ServerResponse> routerFunction(DogRepository repository) {
        return route()
                .GET("/hello", request -> ServerResponse.ok().body(HELLO))
                .GET("/startup", request -> {
                    var duration = Duration.between(START_TIME.get(), STOP_TIME.get());
                    return ServerResponse.ok().body(duration.toString().substring(2));
                })
                .GET("/dogs", request -> ServerResponse.ok().body(repository.findAll()))
                .build();
    }
}


@Component
class CracLifecycle implements SmartLifecycle {

    private final AtomicBoolean running = new AtomicBoolean(false);

    @Override
    public void start() {
        if (this.running.compareAndSet(false, true))
            System.out.println("CRAC starting");
    }

    @Override
    public void stop() {
        if (this.running.compareAndSet(true, false))
            System.out.println("CRAC stopping");

    }

    @Override
    public boolean isRunning() {
        return this.running.get();
    }
}

interface DogRepository extends ListCrudRepository<Dog, Integer> {
}

record Dog(@Id Integer id, String name, String description, LocalDate dob) {
}