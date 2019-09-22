package com.delivery.user.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.delivery.user.model.UserVO;
import com.delivery.user.service.UserService;

@Controller
@RequestMapping(value="/user")
public class UserController {

	@Inject
	UserService userService;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "user/loginForm";
	}
	
	@RequestMapping(value="/signup", method=RequestMethod.GET)
	public String insertUser(Model model) {
		model.addAttribute("userVO", new UserVO());
		return "user/signupForm";
	}
	@RequestMapping(value="/signup", method=RequestMethod.POST)
	public String insertUserSC(@ModelAttribute UserVO userVO) throws Exception {
		System.out.println(userVO.getUser_id());
		System.out.println(userVO.getUser_name());
		System.out.println(userVO.getUser_birth());
		System.out.println(userVO.getUser_addr2());
		System.out.println(userVO.getUser_addr());
		System.out.println(userVO.getUser_gender());
		System.out.println(userVO.getUser_pwd());
		userService.insertUser(userVO);
		return "user/signupSuccess";
	}
}
