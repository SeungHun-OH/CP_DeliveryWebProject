package com.delivery.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.delivery.dao.BoardDAO;
import com.delivery.vo.BoardVO;
import com.delivery.vo.Criteria;

@Service
public class BoardServiceImpl implements BoardService {

	
	@Inject
	private BoardDAO dao;
	
	//게시글 작성
	@Override
	public void write(BoardVO boardVO) throws Exception {
		dao.write(boardVO);

	}

	//게시글 목록 조회
	@Override
	public List<BoardVO> list(Criteria cri) throws Exception {
		return dao.list(cri);
	}
	
	//게시글 총 갯수
	@Override
	public int listCount() throws Exception {
		return dao.listCount();
	}

	//게시글 조회
	@Override
	public BoardVO read(int bno) throws Exception {
		return dao.read(bno);
	}
	
	//게시글 수정
	@Override
	public void update(BoardVO boardVO) throws Exception {
		dao.update(boardVO);
	}
	
	//게시글 삭제
	@Override
	public void delete(int bno) throws Exception {
		dao.delete(bno);
	}

}
