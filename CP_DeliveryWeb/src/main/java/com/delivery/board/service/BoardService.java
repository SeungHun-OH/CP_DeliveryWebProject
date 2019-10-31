package com.delivery.board.service;

import java.util.List;

import com.delivery.board.model.ReservationVO;
import com.delivery.board.model.SearchDTO;
import com.delivery.board.model.SearchResultVO;

public interface BoardService {

	//운송장 조회
	void reserve(ReservationVO reservationVO) throws Exception;
	ReservationVO lookupReserve (SearchDTO searchDTO) throws Exception;
	List<SearchResultVO> searchListResult (SearchDTO searchDTO) throws Exception;
	SearchResultVO searchResult(SearchDTO searchDTO) throws Exception;
}
