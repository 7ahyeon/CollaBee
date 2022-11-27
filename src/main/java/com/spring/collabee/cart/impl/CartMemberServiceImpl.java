package com.spring.collabee.cart.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.collabee.cart.CartMemberService;
import com.spring.collabee.cart.CartMemberVO;

@Service("cartMemberService")
public class CartMemberServiceImpl implements CartMemberService {
	
	@Autowired
	private CartMemberDAO cartMemberDao;

	@Override
	public CartMemberVO getMember(CartMemberVO vo) {
		return cartMemberDao.getMember(vo);
	}

	@Override
	public void updateMember(CartMemberVO vo) {
		cartMemberDao.updateMember(vo);
	}
}
