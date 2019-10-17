package com.delivery.support.dao;

import com.delivery.support.model.FileVO;
import com.delivery.support.model.InquiryVO;

public interface SupportDao {

	void insertInquiry(InquiryVO inquiryVO, FileVO fileVO);
	void deleteFile(String fileLocation);
}
