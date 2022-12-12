package com.spring.collabee.view.order;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.collabee.biz.emoneyusage.EmoneyUsageService;
import com.spring.collabee.biz.member.MemberVO;
import com.spring.collabee.biz.order.OrderCouponVO;
import com.spring.collabee.biz.order.OrderService;

@SessionAttributes({"totEmoney", "couponCnt", "couponList"})
@RequestMapping("/order")
@Controller
public class OrderControlloer {
	
	@Autowired
	EmoneyUsageService emoneyService;
	
	@Autowired
	OrderService orderService;
	
	public OrderControlloer() {
	}
	
	@RequestMapping("/order.do")
	public String order(HttpSession session, Model model, MemberVO mvo) {
		
		if (session.getAttribute("loginMember") != null) {
			mvo = (MemberVO) session.getAttribute("loginMember");
			
			int totEmoney = emoneyService.getTotEmoney(mvo);
			model.addAttribute("totEmoney", totEmoney);
			
			int couponCnt = orderService.getCouponCnt(mvo);
			model.addAttribute("couponCnt", couponCnt);

			if (couponCnt != 0) {
				List<OrderCouponVO> couponList = orderService.getCouponList(mvo);
				model.addAttribute("couponList", couponList);
			}
			
		}
		
		return "/order/order";
	}
	
	@RequestMapping("/orderComplete.do")
	public String orderComplete() {
		return "/order/orderComplete";
	}
	
	@RequestMapping("/cartadd.do")
	public String cartadd() {
		return "/order/cartadd";
	}
}
