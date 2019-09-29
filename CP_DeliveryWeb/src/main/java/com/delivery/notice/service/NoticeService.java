package com.delivery.notice.service;

import java.util.List;

import com.delivery.commons.paging.Criteria;
import com.delivery.notice.model.NoticeVO;

public interface NoticeService {
	void create(NoticeVO noticeVO) throws Exception;
	NoticeVO read(Integer ntc_No) throws Exception;
	void update(NoticeVO noticeVO) throws Exception;
	void delete(Integer ntc_No) throws Exception;
	List<NoticeVO> listAll() throws Exception;
	List<NoticeVO> listCriteria(Criteria criteria) throws Exception;
}
