package com.spring.collabee.view.cart;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/cart")
@Controller
public class CartController {
	
	public CartController() {
		System.out.println(">>CartController() 객체 생성");
	}
	
	@RequestMapping("/cart.do")
	public String cart() {
		System.out.println(">>장바구니 페이지");
		return "/cart/cart";
	}
}
