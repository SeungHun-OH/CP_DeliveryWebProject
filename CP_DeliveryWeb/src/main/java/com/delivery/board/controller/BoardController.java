package com.delivery.board.controller;



import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.delivery.board.model.ReservationVO;
import com.delivery.board.model.SearchDTO;
import com.delivery.board.model.SearchResultVO;
import com.delivery.board.service.BoardService;



@Controller
@RequestMapping("/board")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardService service;

	
	@RequestMapping(value = "/reservation", method = RequestMethod.GET)
	public String reservationGET() {
		return "board/reservationView";
	}
	
	@RequestMapping(value = "/reservation", method = RequestMethod.POST)
	public String reservationPOST(ReservationVO reservationVO) throws Exception {
		service.reserve(reservationVO);
		return "redirect:/";
	}
	
	@RequestMapping(value = "/return", method = RequestMethod.GET)
	public String returnGET() {
		return "board/returnView";
	}
	
	@RequestMapping(value = "/return", method = RequestMethod.POST)
	public String returnPOST(ReservationVO reservationVO) throws Exception{
		service.reserve(reservationVO);
		return "redirect:/";
	}
	
	//returnView ajax 선언부
	@ResponseBody
	@RequestMapping(value = "/lookupReserve", method = RequestMethod.POST)
	public HashMap<String, Object> reserveAjaxPOST(@RequestBody SearchDTO searchDTO) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ReservationVO reservationVO = service.lookupReserve(searchDTO);
		if(reservationVO != null) {
			map.put("reservationVO",reservationVO);
		}
		return map;  
	}
	
	@ResponseBody
	@RequestMapping(value = "/lookupSearch", method = RequestMethod.POST)
	public HashMap<String, Object> lookupSearchAjaxPOST(@RequestBody SearchDTO searchDTO) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<SearchResultVO> searchList = service.searchListResult(searchDTO);
		SearchResultVO searchResultVO = service.searchResult(searchDTO);
		if(searchResultVO != null && searchList != null) {
			map.put("result",searchResultVO);
			map.put("resultList",searchList);
		}
		return map; 
	}
	
	
	// 운송장 검색
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String deliverySearch(HttpSession httpSession, Model model) throws Exception {
		if(httpSession.getAttribute("login") != null)
		model.addAttribute("logininfo","loginOK");
		return "board/searchView";
	}
}