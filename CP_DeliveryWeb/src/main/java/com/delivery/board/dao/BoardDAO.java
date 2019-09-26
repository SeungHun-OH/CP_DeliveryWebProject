package com.delivery.board.dao;

import com.delivery.board.model.DeliveryVO;

public interface BoardDAO {

	//운송장 조회
	public DeliveryVO search(long deliveryNum) throws Exception;
}
