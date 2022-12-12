package com.spring.collabee.view.order;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.util.WebUtils;

import com.spring.collabee.biz.cart.CartService;
import com.spring.collabee.biz.cart.CartVO;
import com.spring.collabee.biz.member.MemberVO;
import com.spring.collabee.biz.order.OrderVO;

@SessionAttributes({"orderGoods", "omember"})
@RestController
@RequestMapping("/order")
public class OrderAjaxController {
	
	@Autowired
	private CartService cartService;
	
	public OrderAjaxController() {
	}
	
	@RequestMapping(value="/cartToOrder.do", method = RequestMethod.POST)
	public int cartToOrder(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam(value = "chbox[]") List<String> list, MemberVO mvo, CartVO cart, OrderVO ovo) {
		// 쿠키 설정 / 로그인 여부 확인
		Cookie cookie = WebUtils.getCookie(request, "cartCookie");
		mvo = (MemberVO) session.getAttribute("loginMember");
		
		int productNum = 0;
		if (mvo == null) {
			// 비회원 주문
			if ( session.getAttribute("nmember") == null) {
				cart.setNmemberNum(cookie.getValue());
				ovo.setNmemberNum(cookie.getValue());
			} else {
				ovo = (OrderVO) session.getAttribute("nmember");
				cart.setNmemberNum(ovo.getNmemberNum());
			}
		} else {
			// 회원 주문
			cart.setMemberNum(mvo.getMemberNum());
		}
		List<CartVO> orderGoods = new ArrayList<CartVO>();
		for (String i : list) {
			productNum = Integer.parseInt(i);
			cart.setProductNum(productNum);
			orderGoods.add(cartService.checkCartList(cart));
		}
		model.addAttribute("orderGoods", orderGoods);
		return 1;
	}
	
	@RequestMapping(value="/changeOrderData.do", method = RequestMethod.POST)
	public OrderVO changeOrderData(HttpSession session, Model model, HttpServletRequest request, HttpServletResponse response, MemberVO mvo, @RequestBody OrderVO omember, OrderVO ovo) {
		// 쿠키 설정 / 로그인 여부 확인
		Cookie cookie = WebUtils.getCookie(request, "cartCookie");
		mvo = (MemberVO) session.getAttribute("loginMember");
		
		if (mvo == null) {
			// 비회원 주문
			if ( session.getAttribute("nmember") == null) {
				omember.setNmemberNum(cookie.getValue());
			} else {
				ovo = (OrderVO) session.getAttribute("nmember");
				omember.setNmemberNum(ovo.getNmemberNum());
			}
		} else {
			// 회원 주문
			omember.setMemberNum(mvo.getMemberNum());
		}
		model.addAttribute("omember", omember);
		System.out.println(omember.toString());
		return omember;
	}
}
