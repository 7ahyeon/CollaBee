package com.spring.collabee.view.goods;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.collabee.biz.goods.GoodsQnAVO;
import com.spring.collabee.biz.goods.GoodsReviewVO;
import com.spring.collabee.biz.goods.GoodsService;
import com.spring.collabee.biz.goods.GoodsVO;

@SessionAttributes("goods")
@RequestMapping("/goods")
@Controller
public class GoodsController {

	@Autowired
	private GoodsService goodsService;

	public GoodsController() {
		System.out.println(">>GoodsController() 객체 생성");

	}

	@RequestMapping("/goodsContent.do")
	public String getGoods(GoodsVO vo, GoodsReviewVO rvo, GoodsQnAVO qvo, Model model) {
		System.out.println(">>상세 페이지");
		System.out.println("goodsService : " + goodsService);
		// 상품
		GoodsVO goods = goodsService.getGoods(vo);

		model.addAttribute("goods", goods);
		System.out.println("goods : " + goods);


		 //후기 
		 List<GoodsReviewVO> rlist = goodsService.getReviewList(rvo);
		 model.addAttribute("reviewList", rlist);

		 GoodsReviewVO review = goodsService.getReview(rvo);
		 model.addAttribute("review", review);

//		 //후기 입력 
//		 goodsService.insertReview(rvo); 
//		 //후기 수정
//		 goodsService.updateReview(rvo); 
//		 //후기 삭제 
//		 goodsService.deleteReview(rvo);
//		 
//		 //문의 
//		 List<GoodsQnAVO> qlist = goodsService.getQnAList(qvo);
//		 model.addAttribute("qnaList", qlist);
//		 
//		 GoodsQnAVO qna = goodsService.getQnA(qvo); model.addAttribute("qna", qna);
//		 
//		 //문의 입력 
//		 goodsService.insertQnA(qvo); 
//		 //문의 수정 
//		 goodsService.updateQnA(qvo);
//		 //문의 삭제 
//		 goodsService.deleteQnA(qvo);
		 System.out.println("열리기 직전");

		return "/goods/goodsContent";
	}
}