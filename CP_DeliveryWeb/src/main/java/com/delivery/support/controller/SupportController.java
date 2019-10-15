package com.delivery.support.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.delivery.support.model.InquiryVO;
import com.delivery.support.service.SupportService;

@Controller
@RequestMapping("/support")
public class SupportController {

	@Inject
	private SupportService supportService;
	
	@RequestMapping(value = "/inquiry", method=RequestMethod.GET)
	public String inquiryGET () {
		return "/support/inquiryView";
	}
	
	@RequestMapping(value = "/inquiry", method=RequestMethod.POST)
	public String inquiryPOST (InquiryVO inquiryVO) {
		supportService.insertInquiry(inquiryVO);
		return null;
	}
}
