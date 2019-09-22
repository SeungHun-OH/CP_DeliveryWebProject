package com.delivery.user.service;

import com.delivery.user.model.LoginDTO;
import com.delivery.user.model.UserVO;

public interface UserService {
	
	public UserVO login(LoginDTO loginDTO) throws Exception;
	public int insertUser(UserVO userVO) throws Exception;
}
