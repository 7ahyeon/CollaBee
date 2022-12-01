package com.spring.collabee.biz.coupon;

import java.util.List;

import com.spring.collabee.biz.member.MemberVO;

public interface CouponBoxService {
	List<CouponBoxVO> getCouponUsageList(MemberVO mvo); //쿠폰사용내역
	void getCoupon(CouponVO cvo); //쿠폰받기
	
	void useCoupon(); //쿠폰사용상태 변경 
}
