package com.spring.collabee.view.cart;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.util.WebUtils;

import com.spring.collabee.biz.cart.CartManagementVO;
import com.spring.collabee.biz.cart.CartService;
import com.spring.collabee.biz.cart.CartVO;
import com.spring.collabee.biz.member.MemberVO;

@SessionAttributes({"cartList", "cartCount", "cartList1", "cartList2", "cartList3", "cartList4"})
@RequestMapping("/cart")
@Controller
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	public CartController() {
	}
	
	@RequestMapping("/cart.do")
	public String cart(HttpSession session, CartManagementVO cmvo, CartVO vo, Model model) {
		
		MemberVO mvo = (MemberVO)session.getAttribute("loginMember");
		//회원 장바구니 조회
		List<CartVO> cartList = cartService.getCartList(mvo);
		model.addAttribute("cartList", cartList);
		
		int cartCount = cartService.getCartCount(mvo);
		model.addAttribute("cartCount", cartCount);
		
		List<CartVO> cartList1 = cartService.getCartList1(mvo);
		List<CartVO> cartList2 = cartService.getCartList2(mvo);
		List<CartVO> cartList3 = cartService.getCartList3(mvo);
		List<CartVO> cartList4 = cartService.getCartList4(mvo);
		
		model.addAttribute("cartList1", cartList1);
		model.addAttribute("cartList2", cartList2);
		model.addAttribute("cartList3", cartList3);
		model.addAttribute("cartList4", cartList4);
		
		return "/cart/cart";
	}
	
	
}
