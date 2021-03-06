package com.delivery.notice.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.delivery.commons.paging.Criteria;
import com.delivery.commons.paging.PageMaker;
import com.delivery.notice.model.NoticeVO;
import com.delivery.notice.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	private static final Logger LOGGER = LoggerFactory.getLogger(NoticeController.class);
	
	@Inject
	private NoticeService noticeService;
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String writeGET() {
		LOGGER.info("write GET...");
		return "/notice/writeView";
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String writePost(NoticeVO noticeVO, RedirectAttributes redirectAttributes) throws Exception {
		LOGGER.info("write POST...");
		LOGGER.info(noticeVO.toString());
		noticeService.create(noticeVO);
		redirectAttributes.addFlashAttribute("msg", "regSuccess");
		return "redirect:/notice/list";
	}
	
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public String read(@RequestParam("noticeNo") int noticeNo, @ModelAttribute("criteria") Criteria criteria, Model model) throws Exception {
		LOGGER.info("read ...");
		model.addAttribute("notice", noticeService.read(noticeNo));
		return "/notice/readView";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public String modifyGET(@RequestParam("noticeNo") int noticeNo, @ModelAttribute("criteria") Criteria criteria, Model model) throws Exception {
		LOGGER.info("modify GET ...");
		model.addAttribute("notice", noticeService.read(noticeNo));
		return "/notice/modifyView";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modifyPOST(NoticeVO noticeVO, Criteria criteria, RedirectAttributes redirectAttributes) throws Exception {
		LOGGER.info("modify POST ...");
		noticeService.update(noticeVO);
		redirectAttributes.addAttribute("page", criteria.getPage());
		redirectAttributes.addAttribute("perPageNum", criteria.getPerPageNum());
		redirectAttributes.addFlashAttribute("msg", "modSuccess");
		return "redirect:/notice/list";
	}
	
	@RequestMapping(value="/remove", method=RequestMethod.POST)
	public String remove(@RequestParam("noticeNo") int noticeNo, Criteria criteria, RedirectAttributes redirectAttributes) throws Exception {
		LOGGER.info("remove ...");
		noticeService.delete(noticeNo);
		redirectAttributes.addAttribute("page", criteria.getPage());
		redirectAttributes.addAttribute("perPageNum", criteria.getPerPageNum());
		redirectAttributes.addFlashAttribute("msg", "delSuccess");
		return "redirect:/notice/list";
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String listCriteria(Model model, Criteria criteria) throws Exception {
		LOGGER.info("listCriteria ...");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(noticeService.listCount());
		
		model.addAttribute("notices", noticeService.listCriteria(criteria));
		model.addAttribute("pageMaker",pageMaker);
		return "/notice/listView";
	}
}
