package com.spring.collabee.cart.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.collabee.biz.cart.CartMemberVO;
import com.spring.collabee.biz.cart.CartService;
import com.spring.collabee.biz.cart.CartVO;

@Service("cartService")
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartDAO cartDao;

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
	public List<CartVO> getCartList(CartMemberVO vo) {
		return cartDao.getCartList(vo);
	}

	@Override
	public List<CartVO> getCartList1(CartMemberVO vo) {
		return cartDao.getCartList1(vo);
	}

	@Override
	public List<CartVO> getCartList2(CartMemberVO vo) {
		return cartDao.getCartList2(vo);
	}

	@Override
	public List<CartVO> getCartList3(CartMemberVO vo) {
		return cartDao.getCartList3(vo);
	}

	@Override
	public List<CartVO> getCartList4(CartMemberVO vo) {
		return cartDao.getCartList4(vo);
	}

}
