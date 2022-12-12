package com.spring.collabee.biz.order.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.collabee.biz.member.MemberVO;
import com.spring.collabee.biz.order.OrderCouponVO;
import com.spring.collabee.biz.order.OrderService;

@Service("orderService")
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	OrderDAO orderDao;

	@Override
	public int getCouponCnt(MemberVO vo) {
		return orderDao.getCouponCnt(vo);
	}
	@Override
	public List<OrderCouponVO> getCouponList(MemberVO vo) {
		return orderDao.getCouponList(vo);
	}


}
