package com.spring.collabee.biz.admingoods.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.collabee.biz.admingoods.AdminGoodsService;
import com.spring.collabee.biz.goods.GoodsVO;

@Service("adminGoodsService")
public class AdminGoodsServiceImpl implements AdminGoodsService {

	@Autowired
	private AdminGoodsDAO adminGoodsDAO;
	
	
	public AdminGoodsServiceImpl() {
		System.out.println(">> AdminGoodsServiceImpl() 객체 생성");
	}
	
	@Override
	public void adminGoodsInsert(GoodsVO vo) {
		adminGoodsDAO.adminGoodsInsert(vo);
	}

	@Override
	public void adminGoodsModify(GoodsVO vo) {
		adminGoodsDAO.adminGoodsModify(vo);
	}

	@Override
	public void adminGoodsDelete(GoodsVO vo) {
		adminGoodsDAO.adminGoodsDelete(vo);
	}
	
	@Override
	public GoodsVO adminGoodsSelect(GoodsVO vo) {
		return adminGoodsDAO.adminGoodsSelect(vo);
	}
	
	@Override
	public List<GoodsVO> adminGoodsList(GoodsVO vo) {
		return adminGoodsDAO.adminGoodsList(vo);
	}

	@Override
	public GoodsVO adminName(GoodsVO vo) {
		return adminGoodsDAO.adminName(vo);
	}


}
