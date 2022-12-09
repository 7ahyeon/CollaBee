package com.spring.collabee.view.goods;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

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

		List<GoodsReviewVO> rlist = goodsService.getReviewList(rvo);
		model.addAttribute("rlist", rlist);
//		
//		GoodsReviewVO review = goodsService.getReview(rvo);
//		model.addAttribute("review", review);
//		
//		List<GoodsReviewVO> recentList = goodsService.getRecentList(rvo);
//		model.addAttribute("recent", recentList);
//		
//		List<GoodsReviewVO> recommendList = goodsService.getRecommendList(rvo);
//		model.addAttribute("recommend", recommendList);
//		
//		goodsService.insertReview(rvo);
//		goodsService.updatePoint(rvo);
//		goodsService.updateReview(rvo);
//		goodsService.deleteReview(rvo);
//		
		List<GoodsQnAVO> qlist = goodsService.getQnAList(qvo);
		model.addAttribute("qlist", qlist);
//		
//		GoodsQnAVO qna = goodsService.getQnA(qvo);
//		model.addAttribute("qna", qna);
//		
//		goodsService.insertQnA(qvo);
//		goodsService.updateQnA(qvo);
//		goodsService.deleteQnA(qvo);
		
		System.out.println("열리기 직전");

		return "/goods/goodsContent";
	}
	
		//리뷰전체보기
		@RequestMapping("/getReviewList.do")
		public String getReviewList(GoodsReviewVO rvo, Model model) {
			System.out.println("getReviewList() 실행 ~");
			
			List<GoodsReviewVO> rlist = goodsService.getReviewList(rvo);
			model.addAttribute("rlist", rlist);
			
			return "/goods/goodsContent";
			
		}
		
		//리뷰 글 한개 검색
		@RequestMapping("/getReview.do")
		public String getReview(GoodsReviewVO rvo, Model model) {
			System.out.println("getReview() 실행 ");
			
			GoodsReviewVO review = goodsService.getReview(rvo);
			model.addAttribute("review", review);
			
			return "/goods/goodsContent";
		}
	
		//후기 최근등록순 조회
		@RequestMapping("/getRecent.do")
		public String getRecent(GoodsReviewVO rvo, Model model) {
			System.out.println("getRecent()실행");
			
			List<GoodsReviewVO> recentList = goodsService.getRecentList(rvo);
			model.addAttribute("recent", recentList);
			
			return "/goods/goodsContent";
		}
		
		//후기 추천순 조회
		@RequestMapping("/getRecommend.do")
		public String getRecommend(GoodsReviewVO rvo, Model model) {
			System.out.println("getRecommend() 실행");
			
			List<GoodsReviewVO> recommendList = goodsService.getRecommendList(rvo);
			model.addAttribute("recommend", recommendList);
			
			return "/goods/goodsContent";
		}
		
		//리뷰 입력
		@RequestMapping(value = "/insertReview.do", method = RequestMethod.POST) 
		public String insertReview(GoodsReviewVO rvo, @RequestParam(required=false) String grade) throws IllegalStateException, IOException {
			MultipartFile uploadFile = rvo.getUploadFile();
			System.out.println(">> uploadFile : " + uploadFile);
			
			if (uploadFile == null) {
				System.out.println("::: uploadFile 파라미터가 전달되지 않았을때~");
			} else if (!uploadFile.isEmpty()) {
				System.out.println("uploadFile.isEmpty() : " + uploadFile.isEmpty());
				String fileName = uploadFile.getOriginalFilename(); //원본파일명
				System.out.println("::: 원본파일명 : " + fileName);
				System.out.println("::: 저장파일명 : " + UUID.randomUUID().toString());
				uploadFile.transferTo(new File("c:/MyStudy/temp/" + UUID.randomUUID().toString()));
			}
			
			System.out.println("grade : " + grade);
			if(grade.equals("1")) {
				if (rvo.getrOriFilename() != null) {
					rvo.setPoint(200);
				} else {
					rvo.setPoint(100);
				}
			} else {
				if (rvo.getrOriFilename() != null) {
					rvo.setPoint(100);
				} else {
					rvo.setPoint(50);
				}
			}
			
			System.out.println("등급 분기 후 vo : " + rvo);
			
			goodsService.insertReview(rvo);
			goodsService.updatePoint(rvo);
			System.out.println("rvo : " + rvo);
			
			return "redirect:/goods/goodsContent.do";
		}
		
		//리뷰 수정
		@RequestMapping(value = "/updateReview.do", method = RequestMethod.POST)
		public String updateReview(GoodsReviewVO rvo) throws IllegalStateException, IOException {
			System.out.println(">> 리뷰 수정");
			
			MultipartFile uploadFile = rvo.getUploadFile();
			System.out.println(">> uploadFile : " + uploadFile);
			
			if (uploadFile == null) {
				System.out.println("::: uploadFile 파라미터가 전달되지 않았을때~");
			} else if (!uploadFile.isEmpty()) {
				System.out.println("uploadFile.isEmpty() : " + uploadFile.isEmpty());
				String fileName = uploadFile.getOriginalFilename(); //원본파일명
				System.out.println("::: 원본파일명 : " + fileName);
				System.out.println("::: 저장파일명 : " + UUID.randomUUID().toString());
				uploadFile.transferTo(new File("c:/MyStudy/temp/" + UUID.randomUUID().toString()));
			}
			
			goodsService.updateReview(rvo);
			System.out.println("rvo : " + rvo);
			
			return "redirect:/goods/goodsContent.do";
		}
		
		//리뷰 삭제
		@RequestMapping(value = "/deleteReview.do")
		public String deleteReview(GoodsReviewVO rvo) {
			goodsService.deleteReview(rvo);
			
			return "redirect:/goods/goodsContent.do";
		}
		
		
		//문의 전체 조회
		@RequestMapping("/getQnAList.do")
		public String getQnAList(GoodsQnAVO qvo, Model model) {
			System.out.println("getQnAList() 실행");
			
			List<GoodsQnAVO> qlist = goodsService.getQnAList(qvo);
			System.out.println("qlist: " + qlist);
			model.addAttribute("qlist", qlist);
			
			return "/goods/goodsContent";
		}
		
		//문의 한개 조회
		@RequestMapping("/getQnA.do")
		public String getQnA(GoodsQnAVO qvo, Model model) {
			System.out.println("getQnA() 실행");
			
			GoodsQnAVO qna = goodsService.getQnA(qvo);
			model.addAttribute("qna", qna);
			
			return "/goods/goodsContent";
		}
		
		
		//문의 입력
		@RequestMapping(value = "/insertQnA.do", method = RequestMethod.POST)
		public String insertQnA(GoodsQnAVO qvo) {
			System.out.println("qvo : " + qvo);
			goodsService.insertQnA(qvo);
			
//			//비밀글아님
//			if (secret == 0) {
//				
//			} else {
//				//비밀글
//				qvo.setqSecret(qvo.getqSecret());
//			}
//			
			
			return "redirect:/goods/goodsContent.do";
		}
		
		//문의 수정
		@RequestMapping(value = "/updateQnA.do", method = RequestMethod.POST)
		public String updateQnA(GoodsQnAVO qvo) {
			System.out.println(">>문의 수정");
			System.out.println("qvo : " + qvo);
			goodsService.updateQnA(qvo);
			
			return "redirect:/goods/goodsContent.do";
		}
		
		//문의 삭제
		@RequestMapping(value = "/deleteQnA.do")
		public String deleteQnA(GoodsQnAVO qvo) {
			goodsService.deleteQnA(qvo);
			
			return "redirect:/goods/goodsContent.do";
		}
	
	
	
	
	
	
	
}