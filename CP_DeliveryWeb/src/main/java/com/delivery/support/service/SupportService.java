package com.delivery.support.service;

import java.util.List;

import com.delivery.commons.paging.Criteria;
import com.delivery.support.model.FileVO;
import com.delivery.support.model.InquiryVO;

public interface SupportService {
	void insertInquiry(InquiryVO inquiryVO);
	void insertInquiry(InquiryVO inquiryVO, FileVO fileVO);
	void deleteFile(String fileLoaction);
	List<InquiryVO> inquiryList(String loginId);
	InquiryVO detailInquiry(int inquiryNo);
	List<FileVO> detailInquiryFile(int inquiryNo);
	int listCount(String loginId);
	List<InquiryVO> listCriteria(Criteria criteria) throws Exception;
}
