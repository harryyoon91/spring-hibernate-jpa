package me.yonghak.controller.advice;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class ExceptionHandlerAdvice {

	@ExceptionHandler(RuntimeException.class)
	   public ModelAndView runtimeExceptionHandler(RuntimeException ex) {
	        String errorMessage  = ex.getMessage();
	        ModelAndView mav = new ModelAndView("hr/error");
	        mav.addObject("message", errorMessage);
			return mav;
	   }
}
