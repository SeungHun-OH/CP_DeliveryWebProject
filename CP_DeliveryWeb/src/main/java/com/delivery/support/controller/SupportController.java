package com.delivery.support.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.delivery.support.model.FileVO;
import com.delivery.support.model.InquiryVO;
import com.delivery.support.service.SupportService;

@Controller
@RequestMapping("/support")
public class SupportController {

	@Inject
	private SupportService supportService;
	
	 @Resource(name = "uploadPath")
	 String uploadPath;
	 
	
	@RequestMapping(value = "/inquiry", method=RequestMethod.GET)
	public String inquiryGET (HttpSession session) {
		
		if(session.getAttribute("fileName") != null) {
			List<String> fileNameArr = (ArrayList<String>) session.getAttribute("fileName");
			for(String fileName : fileNameArr) {
				String front=fileName.substring(0, 12);
				String end=fileName.substring(14);
				new File(uploadPath+(front+end).replace('/',File.separatorChar)).delete();
				new File(uploadPath+fileName.replace('/',File.separatorChar)).delete();
			}
			session.removeAttribute("fileName");
		}
		return "/support/inquiryView";
	}
	
	@RequestMapping(value = "/inquiry", method=RequestMethod.POST)
	public String inquiryPOST (InquiryVO inquiryVO, FileVO fileVO) {
		System.out.println("이거실행 "+fileVO.toString());
		supportService.insertInquiry(inquiryVO, fileVO);
		return "redirect:/";
	}
}
