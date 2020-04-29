/**
 * Copyright (c) 2020 Contributors to the Eclipse Foundation
 *
 * See the NOTICE file(s) distributed with this work for additional
 * information regarding copyright ownership.
 *
 * This program and the accompanying materials are made available under the
 * terms of the Eclipse Public License 2.0 which is available at
 * https://www.eclipse.org/legal/epl-2.0
 *
 * SPDX-License-Identifier: EPL-2.0
 */
package org.eclipse.vorto.codegen.template.runner

import org.eclipse.vorto.codegen.api.IFileTemplate
import org.eclipse.vorto.core.api.model.informationmodel.InformationModel
import org.eclipse.vorto.codegen.api.InvocationContext

class GeneratorRunnerTemplate implements IFileTemplate<InformationModel> {
	
	override getFileName(InformationModel context) {
		'GeneratorRunner.java'
	}
	
	override getPath(InformationModel context) {
		'generator-parent/generator-runner/src/main/java/com/mycompany/runner'
	}
	
	override getContent(InformationModel element, InvocationContext context) {
		'''
		package com.mycompany.runner;
		
		import org.springframework.boot.SpringApplication;
		import org.springframework.boot.autoconfigure.SpringBootApplication;
		import org.springframework.context.annotation.Bean;
		import org.springframework.context.annotation.ComponentScan;
		import org.springframework.context.annotation.FilterType;
		import org.springframework.web.client.RestTemplate;
		
		@SpringBootApplication
		@ComponentScan(basePackages={"org.eclipse.vorto.codegen.spi.config",
									"org.eclipse.vorto.codegen.spi.controllers",
									"org.eclipse.vorto.codegen.spi.repository",
									"org.eclipse.vorto.codegen.spi.service","com.mycompany.runner"},excludeFilters = {@ComponentScan.Filter(
			    type = FilterType.ASSIGNABLE_TYPE)})
		public class GeneratorRunner {
		
			@Bean
			public RestTemplate restTemplate() {
				return new RestTemplate();
			}
			
			public static void main(String[] args) {
				SpringApplication.run(GeneratorRunner.class, args);
			}
		}
		'''
	}
	
}