package com.delivery.mypage.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.delivery.board.model.SearchDTO;
import com.delivery.board.model.SearchResultVO;
import com.delivery.board.service.BoardService;
import com.delivery.commons.paging.Criteria;
import com.delivery.commons.paging.PageMaker;
import com.delivery.mypage.model.DateDTO;
import com.delivery.mypage.model.LookUpVO;
import com.delivery.mypage.service.MypageService;
import com.delivery.support.model.FileVO;
import com.delivery.support.model.InquiryVO;
import com.delivery.support.service.SupportService;
import com.delivery.user.model.UserVO;


@Controller
@RequestMapping("/mypage")
public class MypageController {

	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Inject
	private MypageService mypageService;
	
	@Inject
	private BoardService boardService;
	
	@Inject
	private SupportService supportService;
	
	@RequestMapping(value="/deliverylist", method=RequestMethod.GET)
	public String deliveryListGET() {
		return "mypage/deliveryList";
	}
	
	@ResponseBody
	@RequestMapping(value="/deliveryLookuplist", method=RequestMethod.POST)
	public HashMap<String, Object> ajaxDeliveryListPOST(HttpSession httpSession, @RequestBody DateDTO dateDTO) {
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
	@RequestMapping(value="/deliveryDetail", method=RequestMethod.POST)
	public HashMap<String, Object> ajaxDeliveryDetailPOST(@RequestBody SearchDTO searchDTO) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<SearchResultVO> searchList = boardService.searchListResult(searchDTO);
		SearchResultVO searchResultVO = boardService.searchResult(searchDTO);
		map.put("result",searchResultVO);
		map.put("resultList",searchList);
		return map;
	}
	
	@RequestMapping(value="/myinquiry", method=RequestMethod.GET)
	public String myinauiryListGET(HttpSession session, Model model, Criteria criteria) throws Exception {
		UserVO userVo = (UserVO)session.getAttribute("login");
		PageMaker pageMaker = new PageMaker();
		criteria.setLoginId(userVo.getUser_id());
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(supportService.listCount(criteria.getLoginId()));
		model.addAttribute("pageMaker",pageMaker);
		
//		List<InquiryVO> userInquiry = supportService.inquiryList(userVo.getUser_id());
//		model.addAttribute("inquiryList", userInquiry);
		model.addAttribute("inquiryList", supportService.listCriteria(criteria));
		model.addAttribute("pageMaker",pageMaker);
		return "mypage/myinquiryView";
	}
	
	@ResponseBody
	@RequestMapping(value="/inquiryDetail", method=RequestMethod.GET)
	public HashMap<String, Object> ajaxInquiryDetailGET(@RequestParam("inquiryNo") int inquiryNo) {
		System.out.println("숫자: "+inquiryNo);
		InquiryVO inquiryVO = supportService.detailInquiry(inquiryNo);
		List<FileVO> listFileVo = supportService.detailInquiryFile(inquiryNo);
		for(FileVO i : listFileVo) {
			System.out.println(i.toString());
		}
		System.out.println(inquiryVO.toString());
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("result",inquiryVO);
		if(!listFileVo.isEmpty()) {
			map.put("resultList",listFileVo);
		}
		return map;
	}
	
	@RequestMapping(value="/myinfo", method=RequestMethod.GET)
	public String myinfoGET(UserVO userVO, HttpSession session, Model model) {
		userVO = (UserVO)session.getAttribute("login");
		model.addAttribute("myinfo", userVO);
		return "mypage/myinfoView";
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxModifyMyInfo", method=RequestMethod.POST)
	public String ajaxModifyMyInfo(@RequestBody HashMap<String,String> sendData, HttpSession session) {
		UserVO userVO = (UserVO)session.getAttribute("login");
		if(!BCrypt.checkpw(sendData.get("user_pw"), userVO.getUser_pwd())){
			return "false";
		}else {
			return "true";
		}
	}
	
	@RequestMapping(value="/modifyMyInfo", method=RequestMethod.POST)
	public String modifyMyInfoPOST(UserVO userVO) {
		System.out.println("여기실행");
		return "redirect:/mypage/myinfo";
	}
	
}
