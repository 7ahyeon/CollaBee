package com.spring.collabee.biz.mypicklist.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.collabee.biz.member.MemberVO;
import com.spring.collabee.biz.mypicklist.MyPickListVO;
import com.spring.collabee.biz.mypicklist.MyPicklistService;

@Service("myPicklistService")
public class MyPicklistServiceImpl implements MyPicklistService {
	@Autowired
	MyPickListDAO myPickListDAO;	
	
	@Override
	public List<MyPickListVO> getPickList(MemberVO mvo) {
		return myPickListDAO.getPickList(mvo);
	}

}
