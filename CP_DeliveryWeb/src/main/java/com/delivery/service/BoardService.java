package com.delivery.service;

import java.util.List;

import com.delivery.dao.BoardDAO;
import com.delivery.vo.BoardVO;

public interface BoardService {

	// 게시글 작성
		public void write(BoardVO boardVO) throws Exception;
	
	// 게시글 목록 조회
		public List<BoardVO> list() throws Exception;
}
