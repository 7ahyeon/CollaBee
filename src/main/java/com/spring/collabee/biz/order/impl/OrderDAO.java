package com.spring.collabee.biz.order.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.collabee.biz.member.MemberVO;
import com.spring.collabee.biz.order.OrderCouponVO;

@Repository
public class OrderDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public OrderDAO() {
	}
	public int getCouponCnt(MemberVO vo) {
		return mybatis.selectOne("orderDAO.getCouponCnt", vo);
	}
	public List<OrderCouponVO> getCouponList(MemberVO vo) {
		return mybatis.selectList("orderDAO.getCouponList", vo);
	}
}
