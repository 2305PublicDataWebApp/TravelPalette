package com.semi.travelpalette.temp;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

//@ControllerAdvice
public class CustomExceptionHandler {
	
	
	@ExceptionHandler(RuntimeException.class)
	public String defaultError(RuntimeException e) {
		ErrorDto error = new ErrorDto(e.getMessage());
		
        return "redirect:/index.jsp";
	}
	
	
	
	@ExceptionHandler(Exception.class)
	public String defaultError(Exception e) {
		ErrorDto error = new ErrorDto(e.getMessage());
		
        return "redirect:/index.jsp";
	}
	
	

}
