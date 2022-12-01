package com.spring.collabee.biz.emoneyusage.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EmoneyUsageDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public EmoneyUsageDAO() {
		System.out.println(">>EmoneyUsageDAO mybatis() 객체생성");
	}
	
	
}
