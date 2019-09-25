package com.delivery.user.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.delivery.user.model.LoginDTO;
import com.delivery.user.model.UserVO;

@Repository
public class UserDaoImpl implements UserDao {

	@Inject
	private SqlSession sqlSession;
	
	
	@Override
	public UserVO login(LoginDTO loginDTO) throws Exception {
		return sqlSession.selectOne("userMapper.login", loginDTO);
	}
	
	@Override
	public void keepLogin(String user_id, String session_key, Date session_Limit) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("userId", user_id);
		paramMap.put("sessionKey", session_key);
		paramMap.put("sessionLimit", session_Limit);
		sqlSession.update("userMapper.keepLogin", paramMap);
	}


	@Override
	public UserVO checkUserWithSessionKey(String value) throws Exception {
		return sqlSession.selectOne("userMapper.checkUserWithSessionKey", value);
	}
	
	@Override
	public int insertUser(UserVO userVO) throws Exception {
		return sqlSession.insert("userMapper.insertUser", userVO);
	}


	

}
