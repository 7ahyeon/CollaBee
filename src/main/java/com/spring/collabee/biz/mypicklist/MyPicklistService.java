package com.spring.collabee.biz.mypicklist;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestBody;

import com.spring.collabee.biz.member.MemberVO;

public interface MyPicklistService {
	List<MyPickListVO> getPickList(MemberVO mvo);
	int delPickList (@RequestBody Map<String, Integer> pickInfo);
}
