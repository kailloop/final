package com.kh.couplism.configuration;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

//spring bean configuration xml 파일과 같은 역활
@Configuration
public class SevletConfiguration {
	
	@Bean
	public Logger getLogger() {
		return LoggerFactory.getLogger(SevletConfiguration.class);
	}
}
