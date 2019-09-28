package com.delivery.commons.exception;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice	//이 클래스의 객체가 컨트롤러에서 발생하는 Exception을 처리하는 클래스라는 것을 명시
public class CommonExceptionAdvice {

	private static final Logger LOGGER = LoggerFactory.getLogger(CommonExceptionAdvice.class);

	@ExceptionHandler(Exception.class)	//	적절한 타입의 Exception 처리, 일반 컨트롤러와 달리 ModelAndView타입을 사용하는 형태임
	public ModelAndView commonException(Exception e) {
		LOGGER.info(e.toString());
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("exception", e);
		modelAndView.setViewName("/commons/common_error");
		
		return modelAndView;
	}
}
