package com.delivery.user.service;

import java.util.Date;

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
	public void keepLogin(String user_id, String session_key, Date session_Limit) throws Exception {
		userDao.keepLogin(user_id, session_key, session_Limit);
	}

	@Override
	public UserVO checkLoginBefore(String value) throws Exception {
		return userDao.checkUserWithSessionKey(value);
	}
	
	@Override
	public int insertUser(UserVO userVO) throws Exception {
		return userDao.insertUser(userVO);
	}

	@Override
	public int chkUserId(String chkId) throws Exception {
		return userDao.chkUserId(chkId);
	}

	@Override
	public void loginDate(String userId, Date loginDate) {
		userDao.loginDate(userId, loginDate);
	}

}
