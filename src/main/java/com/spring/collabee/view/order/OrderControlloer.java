package com.spring.collabee.view.order;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/order")
@Controller
public class OrderControlloer {
	
	
	
	public OrderControlloer() {
	}
	
	@RequestMapping("/order.do")
	public String order(HttpSession session) {
		return "/order/order";
	}
	
	@RequestMapping("/cartadd.do")
	public String cartadd() {
		return "/order/cartadd";
	}
}
