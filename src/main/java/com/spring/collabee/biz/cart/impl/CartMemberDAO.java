package com.spring.collabee.biz.cart.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.collabee.biz.cart.CartMemberVO;

@Repository
public class CartMemberDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public CartMemberDAO() {
	}

	public CartMemberVO getMember(CartMemberVO vo) {
		return mybatis.selectOne("cartDAO.getMember", vo);
	}
	
	public void updateMember(CartMemberVO vo) {
		mybatis.update("cartDAO.getAddress", vo);
	}
}
