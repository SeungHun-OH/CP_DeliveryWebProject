package com.delivery.support.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.delivery.support.model.FileVO;
import com.delivery.support.model.InquiryVO;

@Repository
public class SupportDaoImpl implements SupportDao{

	@Inject
	private SqlSession sqlSession;
	
	@Transactional
	@Override
	public void insertInquiry(InquiryVO inquiryVO, FileVO fileVO) {
		sqlSession.insert("supportMapper.insert",inquiryVO);
		for(int i=0; i<fileVO.getFileNameArr().length; i++) {
//			fileVO.setFileLocation();
			fileVO.setFileName(fileVO.getFileNameArr()[i]);
			fileVO.setFileLocation(fileVO.getFileLocationArr()[i]);
			fileVO.setFileSize(fileVO.getFileSizeArr()[i]);
			sqlSession.insert("supportMapper.insertFile",fileVO);
		}
		
	}

}
