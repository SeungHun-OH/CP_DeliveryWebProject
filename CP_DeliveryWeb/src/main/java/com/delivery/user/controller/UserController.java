package com.delivery.user.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import com.delivery.user.model.LoginDTO;
import com.delivery.user.model.UserVO;
import com.delivery.user.service.UserService;

@Controller
@RequestMapping(value="/user")
public class UserController {

	@Inject
	private UserService userService;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginGET(@ModelAttribute ("loginDTO") LoginDTO loginDTO, HttpServletRequest request) {
		String referer = request.getHeader("Referer");
		request.getSession().setAttribute("destination", referer);
		return "user/loginForm";
	}
	@RequestMapping(value="/loginPost", method=RequestMethod.POST)
	public void loginPOST(LoginDTO loginDTO, HttpSession httpSession, Model model) throws Exception {
		UserVO userVO = userService.login(loginDTO);
		if(userVO == null || !BCrypt.checkpw(loginDTO.getUser_pwd(), userVO.getUser_pwd())){
			return ;
		}
		model.addAttribute("user", userVO);
		if(loginDTO.isUseCookie()) {
			int amount = 60 * 60 * 24 * 7; // 7일
			Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));
			userService.keepLogin(userVO.getUser_id(), httpSession.getId(), sessionLimit);
			System.out.println("쿠키 생성");
		}
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws Exception {
		Object object = httpSession.getAttribute("login");	//해당 세션 속성명 값을 Object 타입으로 리턴, 없을 경우 null
		if( object != null) {
			UserVO userVO = (UserVO) object;
			httpSession.removeAttribute("login");	//login 세션  제거
			httpSession.invalidate();	// 현재 생성된 세션 무효화
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if(loginCookie != null) {	// 로그인 유지를 선택했을 경우 loginCookie 값을 초기화
				loginCookie.setPath("/");	//쿠키의 유효한 디렉토리 설정
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				userService.keepLogin(userVO.getUser_id(), "none", new Date());	// DB에 저장한 세션아이디와 자동로그인 유지기간 초기화
			}
		}
		return "/user/logoutForm";
	}
	
	
	@RequestMapping(value="/signup", method=RequestMethod.GET)
	public String insertUserView(@ModelAttribute("userVO") UserVO userVO) {
		return "user/signupForm";
	}
	
	@RequestMapping(value="/signup", method=RequestMethod.POST)
	public String insertUserSC(@ModelAttribute UserVO userVO) throws Exception {
		
		String hashPw = BCrypt.hashpw(userVO.getUser_pwd(), BCrypt.gensalt());
		userVO.setUser_pwd(hashPw);
		userService.insertUser(userVO);
		return "redirect:/";
	}
	
	
}
