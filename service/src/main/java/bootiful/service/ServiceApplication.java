package bootiful.service;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.annotation.Bean;
import org.springframework.data.annotation.Id;
import org.springframework.data.repository.ListCrudRepository;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.function.RouterFunction;
import org.springframework.web.servlet.function.ServerResponse;

import java.time.Duration;
import java.time.Instant;
import java.time.LocalDate;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;

import static org.springframework.web.servlet.function.RouterFunctions.route;

@SpringBootApplication
public class ServiceApplication {

    static final AtomicReference<Instant> START_TIME = new AtomicReference<>();

    static final AtomicReference<Instant> STOP_TIME = new AtomicReference<>();

    public static void main(String[] args) {
        START_TIME.set(Instant.now());
        SpringApplication.run(ServiceApplication.class, args);
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
                .GET("/startup", request -> {
                    var duration = Duration.between(START_TIME.get(), STOP_TIME.get());
                    return ServerResponse.ok().body(Map.of("startup", duration.toString()));
                })
                .GET("/dogs", request -> ServerResponse.ok().body(repository.findAll()))
                .build();
    }
}

interface DogRepository extends ListCrudRepository<Dog, Integer> {
}

record Dog(@Id Integer id, String name, String description, LocalDate dob) {
}