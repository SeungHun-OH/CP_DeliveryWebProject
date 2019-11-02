package com.delivery.support.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.delivery.commons.paging.Criteria;
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
	
	@Transactional
	@Override
	public void insertInquiry(InquiryVO inquiryVO, FileVO fileVO) {
		sqlSession.insert("supportMapper.insert",inquiryVO);
		if(fileVO != null){
			for(int i=0; i<fileVO.getFileNameArr().length; i++) {
				fileVO.setFileName(fileVO.getFileNameArr()[i]);
				fileVO.setFileLocation(fileVO.getFileLocationArr()[i]);
				fileVO.setFileSize(fileVO.getFileSizeArr()[i]);
				fileVO.setFileNo(i+1);
				sqlSession.insert("supportMapper.insertFile",fileVO);
			}
		}
	}

	@Override
	public void deleteFile(String fileLocation) {
		sqlSession.delete("supportMapper.deleteFile",fileLocation);
	}

	@Override
	public List<InquiryVO> inquiryList(String loginId) {
		return sqlSession.selectList("supportMapper.inquiryList", loginId);
	}

	@Override
	public InquiryVO detailInquiry(int inquiryNo) {
		return sqlSession.selectOne("supportMapper.detailInquiry", inquiryNo);
	}

	@Override
	public List<FileVO> detailInquiryFile(int inquiryNo) {
		return sqlSession.selectList("supportMapper.detailInquiryFile", inquiryNo);
	}
	
	@Override
	public int listCount(String loginId) {
		return sqlSession.selectOne("supportMapper.listCount", loginId);
	}

	@Override
	public List<InquiryVO> listCriteria(Criteria criteria) {
		return sqlSession.selectList("supportMapper.listCriteria", criteria);
	}
}
