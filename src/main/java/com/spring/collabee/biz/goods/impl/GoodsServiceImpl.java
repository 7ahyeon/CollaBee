package com.spring.collabee.biz.goods.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.collabee.biz.goods.GoodsQnAVO;
import com.spring.collabee.biz.goods.GoodsReviewVO;
import com.spring.collabee.biz.goods.GoodsService;
import com.spring.collabee.biz.goods.GoodsVO;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {
	@Autowired
	private GoodsDAO goodsDAO;
	
	public GoodsServiceImpl() {
		System.out.println(">> GoodsServiceImpl() 객체 생성");
	}
	
	//상품 조회
	@Override
	public GoodsVO getGoods(GoodsVO vo) {
		return goodsDAO.getGoods(vo);
	}
	
	//상품 리뷰
	@Override
	public void insertReview(GoodsReviewVO rvo) {
		goodsDAO.insertReview(rvo);
	}
	
	@Override
	public void updateReview(GoodsReviewVO rvo) {
		goodsDAO.updateReview(rvo);
		
	}
	
	@Override
	public void deleteReview(GoodsReviewVO rvo) {
		goodsDAO.deleteReview(rvo);
		
	}
	
	@Override
	public GoodsReviewVO getReview(GoodsReviewVO rvo) {
		return goodsDAO.getReview(rvo);
	}
	
	@Override
	public List<GoodsReviewVO> getReviewList(GoodsReviewVO rvo) {
		return goodsDAO.getReviewList(rvo);
	}
	
	//상품 문의
	@Override
	public void insertQnA(GoodsQnAVO qvo) {
		goodsDAO.insertQnA(qvo);
	}
	
	@Override
	public void updateQnA(GoodsQnAVO qvo) {
		goodsDAO.updateQnA(qvo);
	}
	
	@Override
	public void deleteQnA(GoodsQnAVO qvo) {
		goodsDAO.deleteQnA(qvo);
	}
	
	@Override
	public GoodsQnAVO getQnA(GoodsQnAVO qvo) {
		return goodsDAO.getQnA(qvo);
	}
	
	@Override
	public List<GoodsQnAVO> getQnAList(GoodsQnAVO qvo) {
		return goodsDAO.getQnAList(qvo);
	}
}