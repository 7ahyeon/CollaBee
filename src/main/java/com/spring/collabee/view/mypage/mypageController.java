package com.spring.collabee.view.mypage;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.collabee.biz.member.MemberService;

@Controller
@RequestMapping("/mypage")
public class mypageController {
	@Autowired
	MemberService memberService;

	
	public mypageController() {
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
	@GetMapping("/review.do")
	public String review() {	
		return "/mypage/review";
	}
	
}
