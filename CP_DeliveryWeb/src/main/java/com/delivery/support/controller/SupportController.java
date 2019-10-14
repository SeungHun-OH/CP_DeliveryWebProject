package com.delivery.support.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/support")
public class SupportController {

	
	@RequestMapping(value = "/inquiry", method=RequestMethod.GET)
	public String inquiryGET () {
		return "/support/inquiryView";
	}
	
	@RequestMapping(value = "/inquiry", method=RequestMethod.GET)
	public String inquiryPOST () {
		
		return null;
	}
}
