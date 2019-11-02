package com.delivery.mypage.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.delivery.mypage.dao.MypageDao;
import com.delivery.mypage.model.DateDTO;
import com.delivery.mypage.model.LookUpVO;

@Service
public class MypageServiceImpl implements MypageService {

	@Inject
	private MypageDao mypageDao;

	@Override
	public List<LookUpVO> lookuplist(DateDTO dateDto) {
		return mypageDao.lookuplist(dateDto);
	}
}
