package com.kopo.criminaleyes;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

@EnableFeignClients
@SpringBootApplication
public class CriminalEyesApplication {

    public static void main(String[] args) {
        SpringApplication.run(CriminalEyesApplication.class, args);
    }

}
