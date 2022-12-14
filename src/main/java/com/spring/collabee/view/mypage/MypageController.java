package com.spring.collabee.view.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.collabee.biz.emoneyusage.EmoneyUsageService;
import com.spring.collabee.biz.member.MemberService;
import com.spring.collabee.biz.myreview.MyReviewService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	@Autowired
	MemberService memberService;
	@Autowired
	MyReviewService myReviewService;
	@Autowired
	EmoneyUsageService emoneyUsageService;

	
	public MypageController() {
		System.out.println("● mypageController 객체 생성");
	}
	@RequestMapping("/inquiryProduct.do")
	public String inquiryProduct() {
		return "/mypage/inquiryProduct";
	}
	
	@RequestMapping("/coupon.do")
	public String coupon() {
		System.out.println("coupon.do 페이지로 이동>>>>");
		return "/mypage/coupon";
	}

	@RequestMapping("/emoney.do")
	public String emoney() {	
		System.out.println("emoney.do 페이지로 이동>>>>");
		return "/mypage/emoney";
	}
	@RequestMapping("/info.do")
	public String info() {	
		return "/mypage/info";
	}
	@GetMapping("/leave.do")
	public String leave() {	
		return "/mypage/leave";
	}
	
	@GetMapping("/modify.do")
	public String modifyPageLoad() {	
		return "/mypage/modify";
	}
	@PostMapping("/modify.do")
	public String modify() {	
		return "/mypage/modify";
	}
	
	@RequestMapping("/order.do")
	public String order() {
		return "/mypage/order";
	}
	
	@GetMapping("/orderDetail.do")
	public String orderDetail() {	
		return "/mypage/orderDetail";
	}
	@GetMapping("/picklist.do")
	public String picklist() {	
		return "/mypage/picklist";
	}
	
	
	
	

	
	
	
	/*
	리뷰조회
	@RequestMapping("/getMemberReview.do")
	public String getMemberReview(@RequestBody Map<String, String> reviewInfo, Model model) {
		System.out.println("getMemberReview.do 실행");
		ProReviewVO proReview = new ProReviewVO();
		List<MyReviewVO> myReviewList = myReviewService.getMyReview(reviewInfo);
		model.addAttribute("myReviewList", myReviewList);
		return "/mypage/beforeReviewAjax";
	}
	*/
	
	
	
}
