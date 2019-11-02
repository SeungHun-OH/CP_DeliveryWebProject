package com.delivery.notice.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.delivery.commons.paging.Criteria;
import com.delivery.notice.dao.NoticeDao;
import com.delivery.notice.model.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Inject
	private NoticeDao noticeDao;
	
	@Override
	public void create(NoticeVO noticeVO) throws Exception {
		noticeDao.create(noticeVO);
	}

	@Override
	public NoticeVO read(Integer ntc_No) throws Exception {
		return noticeDao.read(ntc_No);
	}

	@Override
	public void update(NoticeVO noticeVO) throws Exception {
		noticeDao.update(noticeVO);
	}

	@Override
	public void delete(Integer ntc_No) throws Exception {
		noticeDao.delete(ntc_No);
	}

	@Override
	public List<NoticeVO> listAll() throws Exception {
		return noticeDao.listAll();
	}

	@Override
	public int listCount() throws Exception {
		return noticeDao.listCount();
	}
	
	@Override
	public List<NoticeVO> listCriteria(Criteria criteria) throws Exception {
		return noticeDao.listCriteria(criteria);
	}

}
