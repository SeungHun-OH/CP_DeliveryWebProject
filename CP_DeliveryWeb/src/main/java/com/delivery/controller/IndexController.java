package com.delivery.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.delivery.board.controller.BoardController;

@Controller
@RequestMapping("/*")
public class IndexController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@RequestMapping(value = "/")
	public String writeView() throws Exception{
		logger.info("home");
		return "home";
	}
	
}
