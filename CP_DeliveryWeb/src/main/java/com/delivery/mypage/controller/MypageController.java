package com.delivery.mypage.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.delivery.board.model.SearchDTO;
import com.delivery.board.model.SearchResultVO;
import com.delivery.board.service.BoardService;
import com.delivery.mypage.model.DateDTO;
import com.delivery.mypage.model.LookUpVO;
import com.delivery.mypage.service.MypageService;
import com.delivery.user.model.UserVO;


@Controller
@RequestMapping("/mypage")
public class MypageController {

	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Inject
	private MypageService mypageService;
	
	@Inject
	private BoardService boardService;
	
	@RequestMapping(value="/deliverylist", method=RequestMethod.GET)
	public String deliveryListGET() {
		return "mypage/deliveryList";
	}
	
	@ResponseBody
	@RequestMapping(value="/lookuplist", method=RequestMethod.POST)
	public HashMap<String, Object> ajaxListPOST(HttpSession httpSession, @RequestBody DateDTO dateDTO) {
		logger.info("보낸 date값 "+dateDTO.getStartDate()+":"+dateDTO.getEndDate());
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(httpSession.getAttribute("login")!= null) {
			Object object = httpSession.getAttribute("login");
			UserVO userVO = (UserVO) object;
			dateDTO.setLoginName(userVO.getUser_name());
			dateDTO.setPhone(userVO.getUser_phone());
			List<LookUpVO> lookupList = mypageService.lookuplist(dateDTO);
			for(LookUpVO i : lookupList) {
				System.out.println("출력:  "+i.toString());
			}
			map.put("result", lookupList);
		}
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/detail", method=RequestMethod.POST)
	public HashMap<String, Object> ajaxDetailPOST(@RequestBody SearchDTO searchDTO) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<SearchResultVO> searchList = boardService.searchListResult(searchDTO);
		SearchResultVO searchResultVO = boardService.searchResult(searchDTO);
		map.put("result",searchResultVO);
		map.put("resultList",searchList);
		return map;
	}
}
