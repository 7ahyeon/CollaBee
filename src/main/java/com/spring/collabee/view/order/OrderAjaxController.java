package com.spring.collabee.view.order;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.collabee.biz.cart.CartService;
import com.spring.collabee.biz.cart.CartVO;
import com.spring.collabee.biz.member.MemberVO;

@RestController
@RequestMapping("/order")
public class OrderAjaxController {
	
	
	// 장바구니 상품 추가
	@Autowired
	private CartService cartservice;
	
	
	// 장바구니 상품 추가
	@RequestMapping(value = "/checkCartList.do", method = RequestMethod.POST)
	public int checkCartList(HttpSession session, @RequestBody Map<String, Object> map, CartVO chkCart) {
		
		MemberVO mvo = (MemberVO) session.getAttribute("loginMember");
		String productNum = String.valueOf(map.get("productNum"));
		String count = String.valueOf(map.get("count"));
		
		chkCart.setMemberNum(mvo.getMemberNum());
		chkCart.setProductNum(Integer.parseInt(productNum));
		chkCart.setCount(Integer.parseInt(count));
		
		System.out.println(chkCart.toString());
		
		// 장바구니 상품 존재 여부 확인
		CartVO confirm = cartservice.checkCartList(chkCart);
		if (confirm == null) {
			// 비존재시 장바구니 추가
			cartservice.insertCart(chkCart);
			
			return 1;
		} else {
			int countAdd = confirm.getCount();
			int stock = confirm.getStock();
			
			// 존재시 재고보다 적다면 추가
			if (stock > countAdd) {
				countAdd += chkCart.getCount();
				if (countAdd > stock) {
					countAdd = stock;
				}
				chkCart.setCount(countAdd);
				cartservice.updateCart(chkCart);
				
				return 2;
			} else {
				// 이미 재고와 같을 때 0 리턴
				return 0;
			}
		}
	}
}
