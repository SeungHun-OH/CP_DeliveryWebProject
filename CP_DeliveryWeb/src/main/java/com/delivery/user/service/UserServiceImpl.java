package com.delivery.user.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.delivery.user.dao.UserDao;
import com.delivery.user.model.LoginDTO;
import com.delivery.user.model.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	private UserDao userDao;
	
	@Override
	public UserVO login(LoginDTO loginDTO) throws Exception {
		return userDao.login(loginDTO);
	}
	
	@Override
	public int insertUser(UserVO userVO) throws Exception {
		return userDao.insertUser(userVO);
	}

}
