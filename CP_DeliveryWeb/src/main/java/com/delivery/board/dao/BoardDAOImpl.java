package com.delivery.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.delivery.board.model.DeliveryVO;
import com.delivery.board.model.ReservationVO;
import com.delivery.board.model.SearchDTO;
import com.delivery.board.model.SearchResultVO;

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


	@Override
	public ReservationVO lookupReserve(SearchDTO searchDTO) throws Exception {
		return sqlSession.selectOne("boardMapper.lookupReserve",searchDTO);
	}


	@Override
	public List<SearchResultVO> searchListResult(SearchDTO searchDTO) throws Exception {
		return sqlSession.selectList("boardMapper.searchListResult",searchDTO);
	}


	@Override
	public SearchResultVO searchResult(SearchDTO searchDTO) throws Exception {
		return sqlSession.selectOne("boardMapper.searchResult",searchDTO);
	}
	
}
