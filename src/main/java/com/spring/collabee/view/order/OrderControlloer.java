package com.spring.collabee.view.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.collabee.biz.cart.CartVO;
import com.spring.collabee.biz.member.MemberVO;

@RequestMapping("/order")
@Controller
public class OrderControlloer {
	
	
	public OrderControlloer() {
	}
	
	@RequestMapping("/order.do")
	public String order(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model, CartVO cart, MemberVO mvo) {
		
		
		return "/order/order";
	}
	
	@RequestMapping("/cartadd.do")
	public String cartadd() {
		return "/order/cartadd";
	}
}
