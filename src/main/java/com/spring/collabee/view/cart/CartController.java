package com.spring.collabee.view.cart;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.collabee.cart.CartMemberService;
import com.spring.collabee.cart.CartMemberVO;

@SessionAttributes("cartMember")
@RequestMapping("/cart")
@Controller
public class CartController {
	
	@Autowired
	private CartMemberService cartMemberService;
	
	public CartController() {
	}
	
	@RequestMapping("/cart.do")
	public String cart(Model model) {
		// 임시 로그인
		CartMemberVO vo = new CartMemberVO();
		vo.setMemberNum(1);
		
		CartMemberVO cartMember = cartMemberService.getMember(vo);
		model.addAttribute("cartMember", cartMember);
		return "/cart/cart";
	}
	
	@PostMapping("/changeAddr.do")
	public void changeAddr(@RequestBody Map<String, String> map) {
		System.out.println(map.get("address"));
	}
	
}
