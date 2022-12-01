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
import org.springframework.web.util.WebUtils;

import com.spring.collabee.biz.cart.CartManagementVO;
import com.spring.collabee.biz.cart.CartService;
import com.spring.collabee.biz.cart.CartVO;
import com.spring.collabee.biz.member.MemberVO;

@RestController
@RequestMapping("/cart")
public class CartAjaxController {

	@Autowired
	private CartService cartService;

	/*
	 * @RequestMapping(value = "/cart.do", method = RequestMethod.POST) public int
	 * cart(HttpSession session, HttpServletRequest request, HttpServletResponse
	 * response, CartManagementVO cmvo, CartVO vo) {
	 * 
	 * Cookie cookie = WebUtils.getCookie(request, "cartCookie");
	 * 
	 * if (cookie == null && session.getAttribute("loginMember") == null ) { // 비회원
	 * 상품 담기 전 장바구니 첫 클릭시 쿠키 생성
	 * 
	 * String nmemberNum = RandomStringUtils.random(6, true, true); Cookie
	 * cartCookie = new Cookie("cartCookie", nmemberNum); cartCookie.setPath("/");
	 * // 쿠키 유효기간 1일 설정 cartCookie.setMaxAge(60 * 60 * 24 * 1);
	 * response.addCookie(cartCookie);
	 * 
	 * // 쿠키 비회원번호로 등록 cmvo.setNmemberNum(nmemberNum);
	 * //this.cartService.insertCart(cmvo);
	 * 
	 * 
	 * } else if (cookie != null && session.getAttribute("loginMember") == null) {
	 * // 비회원 장바구니 클릭 전 상품 담기시 쿠키 생성 String ckValue = cookie.getValue();
	 * cmvo.setNmemberNum(ckValue);
	 * 
	 * if (cartService.cartCheck(cmvo) != 0) { return 2; }
	 * 
	 * 
	 * // 쿠키 유효기간 1일 재설정 cookie.setPath("/"); cookie.setMaxAge(60 * 60 * 24 * 1);
	 * response.addCookie(cookie);
	 * 
	 * //cartService.insertCart(cmvo);
	 * 
	 * } else if (session.getAttribute("loginMember") != null) { // 회원 장바구니 상품 담기
	 * MemberVO mvo = (MemberVO)session.getAttribute("loginMember");
	 * cmvo.setMemberNum(mvo.getMemberNum());
	 * 
	 * if (cartService.cartCheck(cmvo) != 0) { return 2; }
	 * 
	 * //cartService.insertCart(cmvo); } return 1;
	 * 
	 * }
	 */

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
