package com.spring.collabee.biz.coupons;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.collabee.biz.admingoods.AdminGoodsService;
import com.spring.collabee.biz.goods.GoodsVO;

public interface CouponsService{

	void couponsInsert(CouponsVO vo);
	void couponsModify(CouponsVO vo);
	void couponsDelete(CouponsVO vo);
	CouponsVO couponsSelect(CouponsVO vo);
	List<CouponsVO> couponsList(CouponsVO vo);

}
