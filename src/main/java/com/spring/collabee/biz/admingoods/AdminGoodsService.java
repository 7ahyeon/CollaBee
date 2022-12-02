package com.spring.collabee.biz.admingoods;

import java.util.List;

import com.spring.collabee.biz.goods.GoodsVO;

public interface AdminGoodsService {

	void adminGoodsInsert(GoodsVO vo);
	void adminGoodsModify(GoodsVO vo);
	void adminGoodsDelete(GoodsVO vo);
	GoodsVO adminGoodsSelect(GoodsVO vo);
	List<GoodsVO> adminGoodsList(GoodsVO vo);
}
