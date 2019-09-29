package com.delivery.notice.dao;

import java.util.List;

import com.delivery.commons.paging.Criteria;
import com.delivery.notice.model.NoticeVO;

public interface NoticeDao {

	void create(NoticeVO noticeVO) throws Exception;
	NoticeVO read(Integer ntc_No) throws Exception;
	void update(NoticeVO noticeVO) throws Exception;
	void delete(Integer ntc_No) throws Exception;
	List<NoticeVO> listAll() throws Exception;
	int listCount(Criteria criteria) throws Exception;
	List<NoticeVO> listCriteria(Criteria criteria) throws Exception;
}
