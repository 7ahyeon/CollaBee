package com.spring.collabee.biz.order;

import java.util.List;

import com.spring.collabee.biz.member.MemberVO;

public interface OrderService {
	int getCouponCnt(MemberVO vo);
	List<OrderCouponVO> getCouponList(MemberVO vo);
}
