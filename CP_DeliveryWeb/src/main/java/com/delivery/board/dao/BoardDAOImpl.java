package com.delivery.board.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.delivery.board.model.DeliveryVO;
import com.delivery.board.model.ReservationVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sqlSession;
	
	
	public DeliveryVO search(long deliveryNum) throws Exception {
		return sqlSession.selectOne("boardMapper.search", deliveryNum);
	}


	@Override
	public void reserve(ReservationVO reservationVO) throws Exception {
		sqlSession.insert("boardMapper.reserve", reservationVO); 
	}
	
}
