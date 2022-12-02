package com.spring.collabee.biz.cart;

import java.util.List;
import java.util.Map;

import com.spring.collabee.biz.member.MemberVO;
import com.spring.collabee.biz.order.OrderMemberVO;

public interface CartService {
	void insertCart(CartVO vo);
	void updateCart(CartVO vo);
	void deleteCart(CartVO vo);
	
	void updateAddress(MemberVO vo);
	
	int getCartCount(MemberVO vo);
	OrderMemberVO getCartMember(MemberVO vo);
	
	List<CartVO> getCartList(MemberVO vo);
	List<CartVO> getCartList1(MemberVO vo);
	List<CartVO> getCartList2(MemberVO vo);
	List<CartVO> getCartList3(MemberVO vo);
	List<CartVO> getCartList4(MemberVO vo);
}
