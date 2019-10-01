package com.delivery.board.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.delivery.board.dao.BoardDAO;
import com.delivery.board.model.DeliveryVO;
import com.delivery.board.model.ReservationVO;

@Service
public class BoardServiceImpl implements BoardService {

	
	@Inject
	private BoardDAO dao;
	
	//택배예약
	@Override
	public void reserve(ReservationVO reservationVO) throws Exception {
		dao.reserve(reservationVO);
	}

	//운송장 조회
	public DeliveryVO search(long deliveryNum) throws Exception {
		return dao.search(deliveryNum);
	}

}
