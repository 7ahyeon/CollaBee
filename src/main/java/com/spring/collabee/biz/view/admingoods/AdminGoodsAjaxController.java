package com.spring.collabee.biz.view.admingoods;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.collabee.biz.admingoods.AdminGoodsService;
import com.spring.collabee.biz.goods.GoodsVO;

@RestController
public class AdminGoodsAjaxController {
	@Autowired
	private AdminGoodsService adminGoodsService;
	
	@ResponseBody
	@RequestMapping("/adminGoods/getJsonGoodsList.do")
	public List<GoodsVO> getJsonGoodsList(GoodsVO vo) {
		System.out.println("===== AdminGoodsAjaxController getJsonGoodsList() 실행");
		List<GoodsVO> goodsList = adminGoodsService.adminGoodsList(vo);
		System.out.println("goodsList : " + goodsList);
		
		return goodsList;
	}
}
