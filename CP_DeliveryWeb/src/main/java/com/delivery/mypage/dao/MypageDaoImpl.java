package com.delivery.mypage.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.delivery.commons.paging.Criteria;
import com.delivery.mypage.model.DateDTO;
import com.delivery.mypage.model.LookUpVO;

@Repository
public class MypageDaoImpl implements MypageDao{

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<LookUpVO> lookuplist(DateDTO dateDto){
		return sqlSession.selectList("mypageMapper.lookuplist", dateDto);
	}
}
