package com.delivery.user.dao;

import com.delivery.user.model.LoginDTO;
import com.delivery.user.model.UserVO;

public interface UserDao {
	
	public UserVO login(LoginDTO loginDTO) throws Exception;
	public int insertUser(UserVO userVO) throws Exception;
}
