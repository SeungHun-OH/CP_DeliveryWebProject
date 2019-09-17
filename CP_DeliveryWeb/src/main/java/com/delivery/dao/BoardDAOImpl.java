package com.delivery.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.delivery.vo.BoardVO;
import com.delivery.vo.Criteria;
import com.delivery.vo.DeliveryVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sqlSession;
	
	// 게시글 작성
	@Override
	public void write(BoardVO boardVO) throws Exception {
		sqlSession.insert("boardMapper.insert", boardVO);
		
	}
	// 게시글 목록 조회
	@Override
	public List<BoardVO> list(Criteria cri) throws Exception {
		return sqlSession.selectList("boardMapper.listPage", cri);
	}
	
	//게시글 총 갯수
	@Override
	public int listCount() throws Exception {
		return sqlSession.selectOne("boardMapper.listCount");
	}
	
	// 게시글 조회
	@Override
	public BoardVO read(int bno) throws Exception {
		return sqlSession.selectOne("boardMapper.read", bno);
	}
	
	// 게시물 수정
	@Override
	public void update(BoardVO boardVO) throws Exception {
		
		sqlSession.update("boardMapper.update", boardVO);
	}

	// 게시물 삭제
	@Override
	public void delete(int bno) throws Exception {
		
		sqlSession.delete("boardMapper.delete", bno);
	}
	
	public DeliveryVO search(long deliveryNum) throws Exception {
		
		return sqlSession.selectOne("boardMapper.search", deliveryNum);
	}
	
}
