package com.spring.collabee.biz.mypicklist;

import java.util.List;

import com.spring.collabee.biz.member.MemberVO;

public interface MyPicklistService {
	List<MyPickListVO> getPickList(MemberVO mvo);
}
