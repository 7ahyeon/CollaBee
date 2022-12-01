package com.spring.collabee.admingoods;

import java.util.List;

public interface AdminGoodsService {

	void adminGoodsInsert(AdminGoodsVO vo);
	void adminGoodsModify(AdminGoodsVO vo);
	List<AdminGoodsVO> adminGoodsList(AdminGoodsVO vo);
}
