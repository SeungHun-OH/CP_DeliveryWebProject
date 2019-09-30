package com.delivery.board.dao;

import com.delivery.board.model.DeliveryVO;
import com.delivery.board.model.ReservationVO;

public interface BoardDAO {

	//운송장 조회
	DeliveryVO search(long deliveryNum) throws Exception;
	void reserve(ReservationVO reservationVO) throws Exception;
}
