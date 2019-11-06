package com.delivery.mypage.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.delivery.mypage.model.DateDTO;
import com.delivery.mypage.model.LookUpVO;
import com.delivery.user.model.UserVO;

@Repository
public class MypageDaoImpl implements MypageDao{

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<LookUpVO> lookuplist(DateDTO dateDto){
		return sqlSession.selectList("mypageMapper.lookuplist", dateDto);
	}

	@Override
	public void modifyMyInfo(UserVO userVO) {
		sqlSession.update("mypageMapper.modifyMyInfo", userVO);
	}

	@Override
	public void modifyMyPass(String newPwd, String userId) {
		HashMap<String, Object> paramMap = new HashMap<>();
		paramMap.put("newPwd", newPwd);
		paramMap.put("userId", userId);
		sqlSession.update("mypageMapper.modifyMyPass", paramMap);
	}
}
