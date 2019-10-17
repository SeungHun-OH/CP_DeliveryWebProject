package com.delivery.support.service;

import com.delivery.support.model.FileVO;
import com.delivery.support.model.InquiryVO;

public interface SupportService {

	void insertInquiry(InquiryVO inquiryVO, FileVO fileVO);
}
