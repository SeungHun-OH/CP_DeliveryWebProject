package com.delivery.mypage.service;

import java.util.List;

import com.delivery.mypage.model.DateDTO;
import com.delivery.mypage.model.LookUpVO;
import com.delivery.user.model.UserVO;

public interface MypageService {
	List<LookUpVO> lookuplist(DateDTO dateDto);
	void modifyMyInfo(UserVO userVO);
}
