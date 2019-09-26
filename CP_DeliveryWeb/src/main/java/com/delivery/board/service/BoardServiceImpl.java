package com.delivery.board.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.delivery.board.dao.BoardDAO;
import com.delivery.board.model.DeliveryVO;

@Service
public class BoardServiceImpl implements BoardService {

	
	@Inject
	private BoardDAO dao;

	//운송장 조회
	public DeliveryVO search(long deliveryNum) throws Exception {
		return dao.search(deliveryNum);
	}

}
