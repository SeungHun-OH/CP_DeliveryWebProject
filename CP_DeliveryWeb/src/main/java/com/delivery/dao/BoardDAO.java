package com.delivery.dao;

import java.util.List;

import com.delivery.vo.BoardVO;
import com.delivery.vo.Criteria;
import com.delivery.vo.DeliveryVO;

public interface BoardDAO {

	// 게시글 작성
	public void write(BoardVO boardVO) throws Exception;
	
	// 게시글 목록 조회
	public List<BoardVO> list(Criteria cri) throws Exception;
	
	// 게시글 총 갯수
	public int listCount() throws Exception;
	
	// 게시물 조회
	public BoardVO read(int bno) throws Exception;
	
	// 게시물 수정
	public void update(BoardVO boardVO) throws Exception;
	
	// 게시물 삭제
	public void delete(int bno) throws Exception;
	
	//운송장 조회
	public DeliveryVO search(long deliveryNum) throws Exception;
}
