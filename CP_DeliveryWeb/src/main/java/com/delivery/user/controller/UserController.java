package com.delivery.user.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.delivery.user.model.LoginDTO;
import com.delivery.user.model.UserVO;
import com.delivery.user.service.UserService;

@Controller
@RequestMapping(value="/user")
public class UserController {

	@Inject
	UserService userService;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginGET(@ModelAttribute ("loginDTO") LoginDTO loginDTO) {
		return "user/loginForm";
	}
	@RequestMapping(value="/loginPost", method=RequestMethod.POST)
	public void loginPOST(LoginDTO loginDTO, HttpSession httpSession, Model model) throws Exception {
		UserVO userVO = userService.login(loginDTO);
		if(userVO == null || !(loginDTO.getUser_pwd().equals(userVO.getUser_pwd()))){
			return ;
		}
		model.addAttribute("user", userVO);
//		https://doublesprogramming.tistory.com/211 [참고]
	}
	
	@RequestMapping(value="/signup", method=RequestMethod.GET)
	public String insertUserView(@ModelAttribute("userVO") UserVO userVO) {
		return "user/signupForm";
	}
	
	@RequestMapping(value="/signup", method=RequestMethod.POST)
	public String insertUserSC(@ModelAttribute UserVO userVO) throws Exception {
		userService.insertUser(userVO);
		return "redirect:/";
	}
	
	
}
