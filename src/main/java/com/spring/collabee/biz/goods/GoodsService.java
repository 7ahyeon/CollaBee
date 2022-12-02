package com.spring.collabee.biz.goods;

import java.util.List;

public interface GoodsService {
	//상품리뷰
	void insertReview(GoodsReviewVO rvo);
	void updateReview(GoodsReviewVO rvo);
	void deleteReview(GoodsReviewVO rvo);
	GoodsReviewVO getReview(GoodsReviewVO rvo);
	List<GoodsReviewVO> getReviewList(GoodsReviewVO rvo);
	
	//상품문의
	void insertQnA(GoodsQnAVO qvo);
	void updateQnA(GoodsQnAVO qvo);
	void deleteQnA(GoodsQnAVO qvo);
	GoodsQnAVO getQnA(GoodsQnAVO qvo);
	List<GoodsQnAVO> getQnAList(GoodsQnAVO qvo);
	
	//상품조회
	GoodsVO getGoods(GoodsVO vo);
	
}