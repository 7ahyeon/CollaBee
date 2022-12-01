package com.spring.collabee.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.collabee.collections.CategoriesVO;
import com.spring.collabee.collections.CollectionsService;
import com.spring.collabee.collections.DivisionVO;

@Repository
public class CollectionsDAO implements CollectionsService{
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public List<CategoriesVO> getCategories() {
		System.out.println("===> MyBatis 사용  getCategories() 실행");
		return mybatis.selectList("collectionsDAO.getCategories");
	}

	@Override
	public List<DivisionVO> getDivision() {
		System.out.println("===> MyBatis 사용  getDivision() 실행");
		return mybatis.selectList("collectionsDAO.getDivision");
	}

	@Override
	public List<DivisionVO> getDivision(int categoryNum) {
		System.out.println("===> MyBatis 사용  getDivision(int categoryNum) 실행");
		return mybatis.selectList("collectionsDAO.getJsonDivision");
	}
}
    