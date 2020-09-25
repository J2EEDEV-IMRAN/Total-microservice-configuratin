package com.imran.vehicleservice.exception;

import org.springframework.context.annotation.Profile;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.zalando.problem.spring.web.advice.ProblemHandling;

/***
 * @author amran
 */

@Profile("test")
@ControllerAdvice
public class ExceptionHandling implements ProblemHandling {
	
}
