package com.spring.collabee.view.cart;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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

import com.spring.collabee.biz.cart.CartMemberService;
import com.spring.collabee.biz.cart.CartMemberVO;
import com.spring.collabee.biz.cart.CartService;
import com.spring.collabee.biz.cart.CartVO;

@SessionAttributes({"cartMember", "cartList", "cartCount", "cartList1", "cartList2", "cartList3", "cartList4"})
@RequestMapping("/cart")
@Controller
public class CartController {
	
	@Autowired
	private CartMemberService cartMemberService;
	
	@Autowired
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
		List<CartVO> cartList = cartService.getCartList(cartMember);
		model.addAttribute("cartList", cartList);
		
		int cartCount = cartService.getCartCount(cartMember);
		model.addAttribute("cartCount", cartCount);
		
		List<CartVO> cartList1 = cartService.getCartList1(cartMember);
		List<CartVO> cartList2 = cartService.getCartList2(cartMember);
		model.addAttribute("cartList1", cartList1);
		model.addAttribute("cartList2", cartList2);
		
		return "/cart/cart";
	}
	
	@ResponseBody
	@RequestMapping(value = "/changeAddr.do", method=RequestMethod.POST)
	public CartMemberVO changeAddr(@RequestBody Map<String, Object> map, @ModelAttribute("cartMember") CartMemberVO cartMember) {
		cartMember.setAddress((String)map.get("address"));
		cartMember.setAddressDetail((String)map.get("addressDetail"));
		cartMemberService.updateMember(cartMember);
		
		return cartMember;
	}
	
	@ResponseBody
	@RequestMapping(value = "/delectCart.do", method= RequestMethod.POST)
	public int delectCart(@ModelAttribute("cartMember") CartMemberVO cartMember, @RequestParam(value="chbox[]") List<String> list, CartVO cart) {

		int result = 0;
		int productNum = 0;
		
		cart.setMemberNum(cartMember.getMemberNum());
		
		for (String i : list) {
			productNum = Integer.parseInt(i);
			cart.setProductNum(productNum);
			//cartService.deleteCart(cart);
			result = 1;
		}
		return result;
		
	}
	
}
