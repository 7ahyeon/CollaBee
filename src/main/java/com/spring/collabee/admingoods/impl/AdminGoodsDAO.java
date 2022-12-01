package com.spring.collabee.admingoods.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.collabee.admingoods.AdminGoodsVO;

@Repository
public class AdminGoodsDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public AdminGoodsDAO() {
		System.out.println(">> AdminGoodsDAO() 객체 생성");
	}
	
	
	//상품 입력
	public void adminGoodsInsert(AdminGoodsVO vo) {
		
	}
	
}
