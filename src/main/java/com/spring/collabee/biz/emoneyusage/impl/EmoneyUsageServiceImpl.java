package com.spring.collabee.biz.emoneyusage.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.collabee.biz.emoneyusage.EmoneyUsageService;
import com.spring.collabee.biz.emoneyusage.EmoneyUsageVO;
import com.spring.collabee.biz.member.MemberVO;

@Service("emoneyUsageService")
public class EmoneyUsageServiceImpl implements EmoneyUsageService{
	@Autowired
	private EmoneyUsageDAO emoneyUsageDAO;
	
	@Override
	public int getTotEmoney(MemberVO mvo) {
		return emoneyUsageDAO.getTotEmoney(mvo);
	}
	
	@Override
	public List<EmoneyUsageVO> getEmoneyUsageList(MemberVO mvo) {
		return emoneyUsageDAO.getEmoneyUsage(mvo);
	}

}
