package com.spring.collabee.biz.collections.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.collabee.biz.collections.CategoriesVO;
import com.spring.collabee.biz.collections.CollectionsService;
import com.spring.collabee.biz.collections.DivisionVO;
import com.spring.collabee.biz.goods.GoodsVO;

@Service
public class CollectionsServiceImpl implements CollectionsService{
	
	@Autowired
	private CollectionsDAO collectionsDAO;
	
	@Override
	public List<CategoriesVO> getCategories() {
		return collectionsDAO.getCategories();
	}

	@Override
	public List<DivisionVO> getDivision() {
		return collectionsDAO.getDivision();
	}

	@Override
	public List<DivisionVO> getDivision(int categoryNum) {
		return collectionsDAO.getDivision(categoryNum);
	}

	@Override
	public List<GoodsVO> getGoodsList() {
		return collectionsDAO.getGoodsList();
	}

	@Override
	public List<GoodsVO> getGoodsList(GoodsVO vo) {
		return collectionsDAO.getGoodsList(vo);
	}

}
