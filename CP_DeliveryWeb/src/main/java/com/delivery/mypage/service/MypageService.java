package com.delivery.mypage.service;

import java.util.List;

import com.delivery.mypage.model.DateDTO;
import com.delivery.mypage.model.LookUpVO;

public interface MypageService {
	List<LookUpVO> lookuplist(DateDTO dateDto);
}
