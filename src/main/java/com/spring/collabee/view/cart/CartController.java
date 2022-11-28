package com.spring.collabee.view.cart;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.collabee.biz.cart.CartMemberService;
import com.spring.collabee.biz.cart.CartMemberVO;
import com.spring.collabee.biz.cart.CartService;
import com.spring.collabee.biz.cart.CartVO;

@SessionAttributes({"cartMember", "cartList", "cartList1", "cartList2", "cartList3", "cartList4"})
@RequestMapping("/cart")
@Controller
public class CartController {
	
	@Autowired
	private CartMemberService cartMemberService;
	
	private CartService cartService;
	
	public CartController() {
	}
	
	@RequestMapping("/cart.do")
	public String cart(CartVO vo, Model model) {
		// 임시 로그인
		CartMemberVO vo2 = new CartMemberVO();
		vo2.setMemberNum(1);
		
		CartMemberVO cartMember = cartMemberService.getMember(vo2);
		model.addAttribute("cartMember", cartMember);
		
		
		//회원 장바구니 조회
		List<CartVO> cartList = cartService.getCartList(vo2);
		List<CartVO> cartList1 = cartService.getCartList1(vo2);
		List<CartVO> cartList2 = cartService.getCartList2(vo2);
		List<CartVO> cartList3 = cartService.getCartList3(vo2);
		List<CartVO> cartList4 = cartService.getCartList4(vo2);
		
		return "/cart/cart";
	}
	
	@RequestMapping(value = "/changeAddr.do", method=RequestMethod.POST)
	@ResponseBody
	public CartMemberVO changeAddr(@RequestBody Map<String, Object> map, @ModelAttribute("cartMember") CartMemberVO cartMember) {
		cartMember.setAddress((String)map.get("address"));
		cartMember.setAddressDetail((String)map.get("addressDetail"));
		cartMemberService.updateMember(cartMember);
		
		return cartMember;
	}
	
}
