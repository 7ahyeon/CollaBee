package com.spring.collabee.biz.collections.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.collabee.biz.collections.CategoriesVO;
import com.spring.collabee.biz.collections.CollectionsService;
import com.spring.collabee.biz.collections.DivisionVO;
import com.spring.collabee.biz.goods.GoodsVO;

@Repository
public class CollectionsDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<CategoriesVO> getCategories() {
		System.out.println("===> MyBatis 사용  getCategories() 실행");
		return mybatis.selectList("collectionsDAO.getCategories");
	}

	public List<DivisionVO> getDivision() {
		System.out.println("===> MyBatis 사용  getDivision() 실행");
		return mybatis.selectList("collectionsDAO.getDivision");
	}

	public List<DivisionVO> getDivision(int categoryNum) {
		System.out.println("===> MyBatis 사용  getDivision(int categoryNum) 실행");
		return mybatis.selectList("collectionsDAO.getJsonDivision", categoryNum);
	}

	public List<GoodsVO> getGoodsList() {
		System.out.println("===> MyBatis 사용  getGoodsList() 실행");
		return mybatis.selectList("collectionsDAO.getJsonGoodsList");
	}

	public List<GoodsVO> getGoodsList(GoodsVO vo) {
		System.out.println("===> MyBatis 사용 getGoodsList(GoodsVO vo) 실행");
		return mybatis.selectList("collectionsDAO.getJsonGoodsList", vo);
	}
}
    