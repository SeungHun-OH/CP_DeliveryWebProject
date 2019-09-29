package com.delivery;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.delivery.commons.paging.Criteria;
import com.delivery.notice.dao.NoticeDao;
import com.delivery.notice.model.NoticeVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class NoticeDaoTest {

	private static final Logger logger = LoggerFactory.getLogger(NoticeDaoTest.class);
	
	@Inject
	private NoticeDao noticeDao;
	
//	@Test
//	public void testCreate() throws Exception {
//		NoticeVO noticeVO = new NoticeVO();
//		noticeVO.setNtc_Title("글 제목 신규");
//		noticeVO.setNtc_Content("글 내용 신규");
//		noticeVO.setNtc_Division("글 구분 신규");
//		noticeDao.create(noticeVO);
//	}
//	
//	@Test
//	public void testRead() throws Exception {
//		logger.info(noticeDao.read(11).toString());
//	}
//
//	@Test
//	public void testUpdate() throws Exception {
//		NoticeVO noticeVO = new NoticeVO();
//		noticeVO.setNtc_No(1);
//		noticeVO.setNtc_Title("글 제목 수정");
//		noticeVO.setNtc_Content("글 내용 수정");
//		noticeDao.update(noticeVO);
//	}
//	
//	@Test
//	public void testDelete() throws Exception {
//		noticeDao.delete(1);
//	}
	
	@Test
	public void testListCriteria() throws Exception {
		Criteria criteria = new Criteria();
		criteria.setPage(1);
		criteria.setPerPageNum(10);
		String b = Integer.toString((criteria.getRowStart()));
		String a = Integer.toString((criteria.getRowEnd()));
		
		
		logger.info("start"+b + ":" + " end" + a);
		List<NoticeVO> notices = noticeDao.listCriteria(criteria);
		for (NoticeVO notice : notices) {
			logger.info(notice.getNtc_No() + ":" + notice.getNtc_Title() + ":" + notice.getNtc_Content());
		}
	}


}
