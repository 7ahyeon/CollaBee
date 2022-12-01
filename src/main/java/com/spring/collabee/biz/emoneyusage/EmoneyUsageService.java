package com.spring.collabee.biz.emoneyusage;

import java.util.List;

import com.spring.collabee.biz.member.MemberVO;

public interface EmoneyUsageService {
	List <EmoneyUsageVO> getEmoneyUsageList(MemberVO mvo);	//적립금내역 조회
	
}
