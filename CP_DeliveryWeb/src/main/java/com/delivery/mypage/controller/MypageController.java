package com.delivery.mypage.controller;

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
	
	@RequestMapping(value="/deliverylist", method=RequestMethod.GET)
	public String deliveryListGET() {
		return "mypage/deliveryList";
	}
	
	@ResponseBody
	@RequestMapping(value="/lookuplist", method=RequestMethod.POST)
	public String ajaxListPOST(HttpSession httpSession, @RequestBody DateDTO dateDTO) {
		logger.info("보낸 date값 "+dateDTO.getStartDate()+":"+dateDTO.getEndDate());
		if(httpSession.getAttribute("login")!= null) {
			Object object = httpSession.getAttribute("login");
			UserVO userVO = (UserVO) object;
			System.out.println(userVO.toString());
			dateDTO.setLoginName(userVO.getUser_name());
			dateDTO.setPhone(userVO.getUser_phone());
			List<LookUpVO> lookupList = mypageService.lookuplist(dateDTO);
			for(LookUpVO i : lookupList) {
				System.out.println("출력:  "+i.toString());
			}
		}
		return null;
	}
}
