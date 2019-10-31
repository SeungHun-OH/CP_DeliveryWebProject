package com.delivery.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.delivery.board.dao.BoardDAO;
import com.delivery.board.model.ReservationVO;
import com.delivery.board.model.SearchDTO;
import com.delivery.board.model.SearchResultVO;

@Service
public class BoardServiceImpl implements BoardService {

	
	@Inject
	private BoardDAO boardDAO;
	
	//택배예약
	@Override
	public void reserve(ReservationVO reservationVO) throws Exception {
		boardDAO.reserve(reservationVO);
	}

	@Override
	public ReservationVO lookupReserve(SearchDTO searchDTO) throws Exception {
		return boardDAO.lookupReserve(searchDTO);
	}

	@Override
	public List<SearchResultVO> searchListResult(SearchDTO searchDTO) throws Exception {
		return boardDAO.searchListResult(searchDTO);
	}

	@Override
	public SearchResultVO searchResult(SearchDTO searchDTO) throws Exception {
		return boardDAO.searchResult(searchDTO);
	}

	
}
