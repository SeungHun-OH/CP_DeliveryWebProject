package com.delivery.user.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.delivery.user.model.UserVO;
import com.delivery.user.service.UserService;

@Controller
@RequestMapping(value="/user")
public class UserController {

	@Inject
	UserService userService;
	
	@RequestMapping(value="/signup", method=RequestMethod.GET)
	public String insertUser(Model model) {
		model.addAttribute("userVO", new UserVO());
		return "user/signupForm";
	}
}
