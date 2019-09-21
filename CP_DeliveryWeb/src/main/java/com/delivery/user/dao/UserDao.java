package com.delivery.user.dao;

import com.delivery.user.model.UserVO;

public interface UserDao {
	
	public int insertUser(UserVO userVO) throws Exception;
}
