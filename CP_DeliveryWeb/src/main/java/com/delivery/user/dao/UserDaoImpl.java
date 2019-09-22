package com.delivery.user.dao;

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
	public int insertUser(UserVO userVO) throws Exception {
		return sqlSession.insert("userMapper.insertUser", userVO);
	}

}
