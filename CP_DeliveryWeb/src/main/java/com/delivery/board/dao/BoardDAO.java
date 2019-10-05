package com.delivery.board.dao;

import com.delivery.board.model.DeliveryVO;
import com.delivery.board.model.ReservationVO;
import com.delivery.board.model.SearchDTO;

public interface BoardDAO {

	//운송장 조회
	DeliveryVO search(long deliveryNum) throws Exception;
	void reserve(ReservationVO reservationVO) throws Exception;
	ReservationVO lookupReserve (SearchDTO searchDTO) throws Exception;
}
