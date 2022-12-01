package com.spring.collabee.cart.biz.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.collabee.biz.cart.CartMemberService;
import com.spring.collabee.biz.cart.CartMemberVO;

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
