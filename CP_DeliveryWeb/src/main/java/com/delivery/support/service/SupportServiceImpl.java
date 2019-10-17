package com.delivery.support.service;

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

}
