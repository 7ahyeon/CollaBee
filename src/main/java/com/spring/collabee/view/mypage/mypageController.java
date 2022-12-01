package com.spring.collabee.view.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class mypageController {
	public mypageController() {
		System.out.println("● mypageController 객체 생성");
	}
	
	@GetMapping("/coupon.do")
	public String coupon() {	
		return "/mypage/coupon";
	}
	@GetMapping("/emoney.do")
	public String emoney() {	
		return "/mypage/emoney";
	}
	@GetMapping("/info.do")
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
	
	@GetMapping("/order.do")
	public String orderPageLoad() {	
		return "/mypage/order";
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
