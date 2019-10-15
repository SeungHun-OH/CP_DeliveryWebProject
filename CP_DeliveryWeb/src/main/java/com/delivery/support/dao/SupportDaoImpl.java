package com.delivery.support.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.delivery.support.model.FileVO;
import com.delivery.support.model.InquiryVO;

@Repository
public class SupportDaoImpl implements SupportDao{

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void insertInquiry(InquiryVO inquiryVO) {
		sqlSession.insert("supportMapper.insert",inquiryVO);
	}

}
