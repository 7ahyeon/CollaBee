package com.spring.collabee.biz.cart;

import java.util.List;

public interface CartService {
	void insertCart(CartVO vo);
	void updateCart(CartVO vo);
	void deleteCart(CartVO vo);
	int getCartCount(CartMemberVO vo);
	List<CartVO> getCartList(CartMemberVO vo);
	List<CartVO> getCartList1(CartMemberVO vo);
	List<CartVO> getCartList2(CartMemberVO vo);
	List<CartVO> getCartList3(CartMemberVO vo);
	List<CartVO> getCartList4(CartMemberVO vo);
}
