package com.spring.collabee.biz.emoneyusage.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.collabee.biz.emoneyusage.EmoneyUsageVO;
import com.spring.collabee.biz.member.MemberVO;

@Repository
public class EmoneyUsageDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public EmoneyUsageDAO() {
		System.out.println(">>EmoneyUsageDAO mybatis() 객체생성");
		
	}
	public Integer getTotEmoney(MemberVO mvo) {
		Integer result = mybatis.selectOne("mypageDAO.getTotEmoney", mvo);
		if (result != null) {
			return mybatis.selectOne("mypageDAO.getTotEmoney", mvo);			
		} else {
			return 0;
		}
	}
	
	public List<EmoneyUsageVO> getEmoneyUsage(MemberVO mvo) {
		System.out.println("getEmoneyUsage()실행");
		return mybatis.selectList("mypageDAO.getEmoneyUsage", mvo);
	}
	
}
