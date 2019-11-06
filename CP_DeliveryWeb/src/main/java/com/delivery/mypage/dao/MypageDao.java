package com.delivery.mypage.dao;

import java.util.List;

import com.delivery.mypage.model.DateDTO;
import com.delivery.mypage.model.LookUpVO;
import com.delivery.user.model.UserVO;

public interface MypageDao {
	List<LookUpVO> lookuplist (DateDTO dataDto);
	void modifyMyInfo (UserVO userVO);
}
