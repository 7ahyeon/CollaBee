package com.spring.collabee.biz.coupons.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.collabee.biz.coupons.CouponsService;
import com.spring.collabee.biz.coupons.CouponsVO;


@Service("couponsService")

public class CouponsServiceImpl implements CouponsService {

	@Autowired
	private CouponsDAO couponsDAO;
	

	public CouponsServiceImpl() {
		System.out.println(">> CouponsServiceImpl() 객체 생성");
	}
	
	@Override
	public void couponsInsert(CouponsVO vo) {
		couponsDAO.couponsInsert(vo);
	}

	@Override
	public void couponsModify(CouponsVO vo) {
		couponsDAO.couponsModify(vo);
	}

	@Override
	public void couponsDelete(CouponsVO vo) {
		couponsDAO.couponsDelete(vo);
	}

	@Override
	public CouponsVO couponsSelect(CouponsVO vo) {
		return couponsDAO.couponsSelect(vo);
	}

	@Override
	public List<CouponsVO> couponsList(CouponsVO vo) {
		System.out.println("쿠폰임플실행1");
		System.out.println(couponsDAO);
		return couponsDAO.couponsList(vo);
	}

	@Override
	public List<CouponsVO> couponsListAvail() {
		
		System.out.println("쿠폰임플실행2");
		return couponsDAO.couponsListAvail();
	}

}
