package com.delivery.board.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.delivery.board.model.DeliveryVO;
import com.delivery.board.service.BoardService;



@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardService service;

	
	@RequestMapping(value = "/reservation", method = RequestMethod.GET)
	public String reservationGET() {
		return "board/reservationView";
	}
	
	// 운송장 검색
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String deliverySearch(HttpServletRequest req,Model model) throws Exception {
		logger.info("search");
		if(req.getParameter("waybill") != null) {
			long num = Long.parseLong(req.getParameter("waybill"));
				if (service.search(num) != null) {
					DeliveryVO deliVO = service.search(num);
					model.addAttribute("deliveryNum",deliVO);
				}else {
					model.addAttribute("deliveryNum",null);
				}
		}else {
			model.addAttribute("deliveryNum","0");
		}
		return "board/searchView";
	}
	
}