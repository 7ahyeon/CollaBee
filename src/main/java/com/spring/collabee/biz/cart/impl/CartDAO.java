package com.spring.collabee.biz.cart.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.collabee.biz.cart.CartVO;
import com.spring.collabee.biz.member.MemberVO;
import com.spring.collabee.biz.order.OrderMemberVO;

@Repository
public class CartDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public CartDAO() {
	}
	
	public void insertCart(CartVO vo) {
	}

	public void updateCart(CartVO vo) {
	}

	public void deleteCart(CartVO vo) {
	}
	public void updateAddress(MemberVO vo) {
		mybatis.update("cartDAO.updateAddress", vo);
	}
	public int getCartCount(MemberVO vo) {
		return mybatis.selectOne("cartDAO.getCartCount", vo);
	}
	public OrderMemberVO getCartMember(MemberVO vo) {
		return mybatis.selectOne("cartDAO.getCartMember", vo);
	}
	public List<CartVO> getCartList(MemberVO vo) {
		return mybatis.selectList("cartDAO.getCartList", vo);
	}
	
	public List<CartVO> getCartList1(MemberVO vo) {
		return mybatis.selectList("cartDAO.getCartList1", vo);
	}

	public List<CartVO> getCartList2(MemberVO vo) {
		return mybatis.selectList("cartDAO.getCartList2", vo);
	}

	public List<CartVO> getCartList3(MemberVO vo) {
		return mybatis.selectList("cartDAO.getCartList3", vo);
	}

	public List<CartVO> getCartList4(MemberVO vo) {
		return mybatis.selectList("cartDAO.getCartList4", vo);
	}
}
