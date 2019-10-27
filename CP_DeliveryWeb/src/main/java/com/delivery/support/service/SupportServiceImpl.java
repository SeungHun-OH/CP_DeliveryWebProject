package com.delivery.support.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.delivery.support.dao.SupportDao;
import com.delivery.support.model.FileVO;
import com.delivery.support.model.InquiryVO;

@Service
public class SupportServiceImpl implements SupportService {

	@Inject
	private SupportDao supportDao;
	
	@Override
	public void insertInquiry(InquiryVO inquiryVO, FileVO fileVO) {
		supportDao.insertInquiry(inquiryVO, fileVO);
	}

	@Override
	public void deleteFile(String fileLoaction) {
		supportDao.deleteFile(fileLoaction);
	}

	@Override
	public void insertInquiry(InquiryVO inquiryVO) {
		supportDao.insertInquiry(inquiryVO);
	}

	@Override
	public List<InquiryVO> inquiryList(String loginId) {
		return supportDao.inquiryList(loginId);
	}

	@Override
	public InquiryVO detailInquiry(int inquiryNo) {
		return supportDao.detailInquiry(inquiryNo);
	}

	@Override
	public List<FileVO> detailInquiryFile(int inquiryNo) {
		return supportDao.detailInquiryFile(inquiryNo);
	}

}
