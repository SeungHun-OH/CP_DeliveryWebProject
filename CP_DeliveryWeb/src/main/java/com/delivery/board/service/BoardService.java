package com.delivery.board.service;

import com.delivery.board.model.DeliveryVO;

public interface BoardService {

	//운송장 조회
		public DeliveryVO search(long deliveryNum) throws Exception;
}
