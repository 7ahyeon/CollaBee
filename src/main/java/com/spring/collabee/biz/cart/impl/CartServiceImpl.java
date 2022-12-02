package com.spring.collabee.biz.cart.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.collabee.biz.cart.CartService;
import com.spring.collabee.biz.cart.CartVO;
import com.spring.collabee.biz.member.MemberVO;
import com.spring.collabee.biz.order.OrderMemberVO;

@Service("cartService")
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartDAO cartDao;
	
	public CartServiceImpl() {
	}

	@Override
	public void insertCart(CartVO vo) {
		
	}

	@Override
	public void updateCart(CartVO vo) {
		
	}

	@Override
	public void deleteCart(CartVO vo) {
		
	}
	
	@Override
	public void updateAddress(MemberVO vo) {
		cartDao.updateAddress(vo);
	}

	@Override
	public int getCartCount(MemberVO vo) {
		return cartDao.getCartCount(vo);
	}
	
	@Override
	public OrderMemberVO getCartMember(MemberVO vo) {
		return cartDao.getCartMember(vo);
	}
	
	@Override
	public List<CartVO> getCartList(MemberVO vo) {
		return cartDao.getCartList(vo);
	}

	@Override
	public List<CartVO> getCartList1(MemberVO vo) {
		return cartDao.getCartList1(vo);
	}

	@Override
	public List<CartVO> getCartList2(MemberVO vo) {
		return cartDao.getCartList2(vo);
	}

	@Override
	public List<CartVO> getCartList3(MemberVO vo) {
		return cartDao.getCartList3(vo);
	}

	@Override
	public List<CartVO> getCartList4(MemberVO vo) {
		return cartDao.getCartList4(vo);
	}

	

	
}
