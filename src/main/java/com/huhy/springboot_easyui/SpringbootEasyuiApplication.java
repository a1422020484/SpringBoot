package com.huhy.springboot_easyui;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@SpringBootApplication
@ServletComponentScan
public class SpringbootEasyuiApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringbootEasyuiApplication.class, args);
	}
}
