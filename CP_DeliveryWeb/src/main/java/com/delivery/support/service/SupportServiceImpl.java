package com.delivery.support.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.delivery.support.dao.SupportDao;
import com.delivery.support.model.InquiryVO;

@Service
public class SupportServiceImpl implements SupportService {

	@Inject
	private SupportDao supportDao;
	
	@Override
	public void insertInquiry(InquiryVO inquiryVO) {
		supportDao.insertInquiry(inquiryVO);
	}

}
