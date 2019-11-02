package com.delivery;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.delivery.board.dao.BoardDAO;
import com.delivery.board.model.ReservationVO;
import com.delivery.board.model.SearchDTO;
import com.delivery.notice.dao.NoticeDao;
import com.delivery.support.dao.SupportDao;
import com.delivery.support.model.InquiryVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class NoticeDaoTest {

	private static final Logger logger = LoggerFactory.getLogger(NoticeDaoTest.class);
	
	@Inject
	private NoticeDao noticeDao;
	
	@Inject
	private BoardDAO boardDao;
	
	@Inject
	private SupportDao supportDao;
	
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
	
//	@Test
//	public void testListCriteria() throws Exception {
//		Criteria criteria = new Criteria();
//		criteria.setPage(1);
//		criteria.setPerPageNum(10);
//		String b = Integer.toString((criteria.getRowStart()));
//		String a = Integer.toString((criteria.getRowEnd()));
//		
//		
//		logger.info("start"+b + ":" + " end" + a);
//		List<NoticeVO> notices = noticeDao.listCriteria(criteria);
//		for (NoticeVO notice : notices) {
//			logger.info(notice.getNtc_No() + ":" + notice.getNtc_Title() + ":" + notice.getNtc_Content());
//		}
//	}
	
//	@Test
//	public void testReserve() throws Exception {
//		ReservationVO reservationVO = new ReservationVO();
//
//		reservationVO.setSe_name("보내는사람 이름");
//		reservationVO.setSe_phone("01045451212");
//		reservationVO.setSe_phone2("01065651818");
//		reservationVO.setSe_addr("보내는 사람 주소 테스트");
//		reservationVO.setSe_addr2("보내는 사람 상세 주소 테스트");
//		reservationVO.setSe_email("test@naver.com");
//		reservationVO.setSe_req("잘 배송해주세요");
//		reservationVO.setSe_reqContents("추가 요청입니다");
//		reservationVO.setRe_name("받는 사람 이름");
//		reservationVO.setRe_phone("01048424584");
//		reservationVO.setRe_phone2("01071718264");
//		reservationVO.setRe_addr("받는 주소 테스트");
//		reservationVO.setRe_addr2("받는 상세 주소 테스트");
//		reservationVO.setItem_name("물건 이름 테스트");
//		reservationVO.setItem_price(12000);
//		reservationVO.setItem_weight("극소");
//		reservationVO.setItem_fare("착불");
//		reservationVO.setItem_farePrice(2500);
//		reservationVO.setSe_resDate("");
//		boardDao.reserve(reservationVO);
//	}
	@Test
	public void testSearch() throws Exception {
	}


}

