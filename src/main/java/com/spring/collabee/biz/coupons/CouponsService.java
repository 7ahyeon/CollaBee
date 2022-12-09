package com.spring.collabee.biz.coupons;

import java.util.List;

public interface CouponsService{

	void couponsInsert(CouponsVO vo);
	void couponsModify(CouponsVO vo);
	void couponsDelete(CouponsVO vo);
	CouponsVO couponsSelect(CouponsVO vo);
	List<CouponsVO> couponsList(CouponsVO vo);
	List<CouponsVO> couponsListAvail();

}
