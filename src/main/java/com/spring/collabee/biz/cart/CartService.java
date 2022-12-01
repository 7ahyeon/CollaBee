package com.spring.collabee.biz.cart;

import java.util.List;

import com.spring.collabee.biz.member.MemberVO;

public interface CartService {
	void insertCart(CartVO vo);
	void updateCart(CartVO vo);
	void deleteCart(CartVO vo);
	
	void updateAddress(MemberVO vo);
	
	int getCartCount(MemberVO vo);
	
	List<CartVO> getCartList(MemberVO vo);
	List<CartVO> getCartList1(MemberVO vo);
	List<CartVO> getCartList2(MemberVO vo);
	List<CartVO> getCartList3(MemberVO vo);
	List<CartVO> getCartList4(MemberVO vo);
}
