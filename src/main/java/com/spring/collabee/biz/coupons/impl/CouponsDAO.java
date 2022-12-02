package com.spring.collabee.biz.coupons.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.collabee.biz.coupons.CouponsVO;

@Repository
public class CouponsDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public CouponsDAO() {
		System.out.println(">> CouponsDAO() 객체 생성");
	}
	
	
	//쿠폰 입력
	public void couponsInsert(CouponsVO vo) {
		System.out.println(">> Mybatis 사용 couponsInsert() 실행");
		mybatis.insert("couponsDAO.couponsInsert", vo);
	}
	
	//쿠폰 수정
	public void couponsModify(CouponsVO vo) {
		System.out.println(">> Mybatis 사용 couponsModify() 실행");
		mybatis.update("couponsDAO.couponsModify", vo);
	}
	
	//쿠폰 삭제
	public void couponsDelete(CouponsVO vo) {
		System.out.println(">> Mybatis 사용 couponsDelete() 실행");
		mybatis.delete("couponsDAO.couponsDelete", vo);
	}
	
	//쿠폰 상세 조회
	public CouponsVO couponsSelect(CouponsVO vo) {
		System.out.println(">> Mybatis 사용 couponsSelect() 실행");
		
		return mybatis.selectOne("couponsDAO.couponsSelect", vo);
	}
	
	//쿠폰 전체 리스트 보기
	public List<CouponsVO> couponsList(CouponsVO vo){
		System.out.println(">> Mybatis 사용 couponsList(vo) 실행");
		
		return mybatis.selectList("couponsDAO.couponsList", vo);
	}

}
