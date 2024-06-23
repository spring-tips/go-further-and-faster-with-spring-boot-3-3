package bootiful.service;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.data.annotation.Id;
import org.springframework.data.repository.ListCrudRepository;
import org.springframework.web.servlet.function.RouterFunction;
import org.springframework.web.servlet.function.ServerResponse;

import java.time.LocalDate;

import static org.springframework.web.servlet.function.RouterFunctions.route;

@SpringBootApplication
public class ServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(ServiceApplication.class, args);
    }

    @Bean
    RouterFunction<ServerResponse> routerFunction(DogRepository repository) {
        return route()
                .GET("/dogs", request -> ServerResponse.ok().body(repository.findAll()))
                .build();
    }
}

interface DogRepository extends ListCrudRepository<Dog, Integer> {
}

record Dog(@Id Integer id, String name, String description, LocalDate dob) {
}