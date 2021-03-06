package com.delivery.notice.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.delivery.commons.paging.Criteria;
import com.delivery.notice.model.NoticeVO;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void create(NoticeVO noticeVO) throws Exception {
		sqlSession.insert("noticeMapper.create", noticeVO);
	}

	@Override
	public NoticeVO read(Integer ntc_No) throws Exception {
		return sqlSession.selectOne("noticeMapper.read", ntc_No);
	}

	@Override
	public void update(NoticeVO noticeVO) throws Exception {
		sqlSession.update("noticeMapper.update", noticeVO);
	}

	@Override
	public void delete(Integer ntc_No) throws Exception {
		sqlSession.delete("noticeMapper.delete", ntc_No);
	}

	@Override
	public List<NoticeVO> listAll() throws Exception {
		return sqlSession.selectList("noticeMapper.listAll");
	}

	@Override
	public int listCount() throws Exception {
		return sqlSession.selectOne("noticeMapper.listCount");
	}
	
	@Override
	public List<NoticeVO> listCriteria(Criteria criteria) throws Exception {
		return sqlSession.selectList("noticeMapper.listCriteria", criteria);
	}

}
