package com.spring.collabee.view.cart;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.util.WebUtils;

import com.spring.collabee.biz.cart.CartManagementVO;
import com.spring.collabee.biz.cart.CartService;
import com.spring.collabee.biz.cart.CartVO;
import com.spring.collabee.biz.member.MemberVO;
import com.spring.collabee.biz.order.OrderMemberVO;

@SessionAttributes("nmember")
@RestController
@RequestMapping("/cart")
public class CartAjaxController {

	@Autowired
	private CartService cartService;
	
	/*
	 * @RequestMapping(value="/cart.do") public int cart(HttpSession session,
	 * HttpServletRequest request, HttpServletResponse response, Model model,
	 * CartManagementVO cmvo, MemberVO mvo) { Cookie cookie =
	 * WebUtils.getCookie(request, "cartCookie"); mvo = (MemberVO)
	 * session.getAttribute("loginMember");
	 * 
	 * if (cookie == null && mvo == null) { // 비회원 상품 추가 없이 장바구니 첫 클릭시 쿠키 생성 String
	 * nmemberNum = RandomStringUtils.random(6, true, true); Cookie cartCookie = new
	 * Cookie("cartCookie", nmemberNum);
	 * 
	 * // 비회원 데이터 유지기간 최대 3일 cartCookie.setPath("/"); cartCookie.setMaxAge(60 * 60 *
	 * 24 * 3); response.addCookie(cartCookie); cmvo.setNmemberNum(nmemberNum);
	 * model.addAttribute("nmember", cmvo);
	 * 
	 * } else if (cookie != null && mvo == null) { // 비회원 장바구니 클릭 후 상품 추가 String
	 * cookieVal = cookie.getValue(); cmvo.setNmemberNum(cookieVal);
	 * 
	 * cookie.setPath("/"); // 비회원 데이터 유지기간 최대 3일 cookie.setMaxAge(60 * 60 * 24 *
	 * 3); response.addCookie(cookie);
	 * 
	 * // 비회원 상품 추가
	 * 
	 * } else if (mvo != null) { //회원 장바구니 추가
	 * 
	 * }
	 * 
	 * }
	 */
	
	@RequestMapping(value = "/updateCart.do", method = RequestMethod.POST)
	public int updateCart(HttpSession session, @RequestBody Map<String, Object> map, CartVO cart) {
		MemberVO mvo = (MemberVO) session.getAttribute("loginMember");
		String productNum = String.valueOf(map.get("productNum"));
		String count = String.valueOf(map.get("count"));
		
		cart.setProductNum(Integer.parseInt(productNum));
		cart.setMemberNum(mvo.getMemberNum());
		cart.setCount(Integer.parseInt(count));
		
		System.out.println(cart.toString());
		cartService.updateCart(cart);
		
		return 1;
	}
	
	@RequestMapping(value = "/changeAddr.do", method = RequestMethod.POST)
	public MemberVO changeAddr(HttpSession session, @RequestBody Map<String, Object> map) {

		MemberVO mvo = (MemberVO) session.getAttribute("loginMember");

		mvo.setAddress((String) map.get("address"));
		mvo.setAddressDetail((String) map.get("addressDetail"));
		cartService.updateAddress(mvo);

		return mvo;
	}

	@RequestMapping(value = "/delectCart.do", method = RequestMethod.POST)
	public int delectCart(HttpSession session, @RequestParam(value = "chbox[]") List<String> list, CartVO cart) {

		MemberVO mvo = (MemberVO) session.getAttribute("loginMember");
		int result = 0;
		int productNum = 0;

		cart.setMemberNum(mvo.getMemberNum());
		
		for (String i : list) {
			productNum = Integer.parseInt(i);
			cart.setProductNum(productNum);
			// cartService.deleteCart(cart);
			result = 1;
		}
		return result;

	}

}
