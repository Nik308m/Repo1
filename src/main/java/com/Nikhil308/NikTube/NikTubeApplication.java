package com.Nikhil308.NikTube;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;


@SpringBootApplication
@EntityScan(basePackages = "com.Nikhil308.NikTube")
public class NikTubeApplication {

	public static void main(String[] args) {
		SpringApplication.run(NikTubeApplication.class, args);
	}

}
