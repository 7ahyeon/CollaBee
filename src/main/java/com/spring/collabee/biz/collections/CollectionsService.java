package com.spring.collabee.biz.collections;

import java.util.List;

import com.spring.collabee.biz.goods.GoodsVO;

public interface CollectionsService {
	
		List<CategoriesVO> getCategories(); 
		List<DivisionVO> getDivision();
		List<DivisionVO> getDivision(int categoryNum);
		List<GoodsVO> getGoodsList();
		List<GoodsVO> getGoodsList(GoodsVO vo);
}
