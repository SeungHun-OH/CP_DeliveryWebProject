package com.delivery.support.dao;

import java.util.List;

import com.delivery.support.model.FileVO;
import com.delivery.support.model.InquiryVO;

public interface SupportDao {
	void insertInquiry(InquiryVO inquiryVO);
	void insertInquiry(InquiryVO inquiryVO, FileVO fileVO);
	void deleteFile(String fileLocation);
	List<InquiryVO> inquiryList(String loginId);
	InquiryVO detailInquiry(int inquiryNo);
	List<FileVO> detailInquiryFile(int inquiryNo);
}
