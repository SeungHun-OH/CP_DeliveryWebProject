package com.delivery.board.service;

import com.delivery.board.model.DeliveryVO;
import com.delivery.board.model.ReservationVO;

public interface BoardService {

	void reserve(ReservationVO reservationVO) throws Exception;
	//운송장 조회
	DeliveryVO search(long deliveryNum) throws Exception;
}
