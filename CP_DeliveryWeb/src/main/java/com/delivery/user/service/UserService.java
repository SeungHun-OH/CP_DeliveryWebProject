package com.delivery.user.service;

import java.util.Date;

import com.delivery.user.model.LoginDTO;
import com.delivery.user.model.UserVO;

public interface UserService {
	
	UserVO login(LoginDTO loginDTO) throws Exception;
	// 로그인 유지 처리
	void keepLogin(String user_id, String session_key, Date session_Limit) throws Exception;
	// 세션키 검증
	UserVO checkLoginBefore(String value) throws Exception;
	int insertUser(UserVO userVO) throws Exception;
}
