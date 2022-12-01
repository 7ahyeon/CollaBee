package com.spring.collabee.view.coupons;

import java.awt.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.collabee.admingoods.AdminGoodsVO;

@RequestMapping("/admin")
@Controller
public class CouponsController {
	
	public CouponsController() {
		System.out.println(">> AdminController() 객체 생성");
	}
	
	@RequestMapping("/adminGoodsInsert.do")
	public String adminGoodsInsert(AdminGoodsVO vo) {
		System.out.println(">> 상품등록 페이지");
		System.out.println("vo : " + vo);
		return "/admin/adminGoodsInsert";
	}
		
	@RequestMapping("/adminGoodsModify.do")
	public String adminGoodsModify() {
		System.out.println(">> 상품수정 페이지");
		return "/admin/adminGoodsModify";
	}
	
	@RequestMapping("/adminGoodsList.do")
	public String adminGoodsList(AdminGoodsVO vo, Model model) {
		System.out.println(">> 상품목록 페이지");
		System.out.println("vo : " + vo);
//		List<AdminVO> list = 
		return "/admin/adminGoodsList";
	}
	
	@RequestMapping("/adminInquiry.do")
	public String adminInquiry() {
		System.out.println(">> 1:1상품 문의 페이지");
		return "/admin/adminInquiry";
	}
	
	@RequestMapping("/adminInquiryAnswer.do")
	public String adminInquiryAnswer() {
		System.out.println(">> 1:1상품 문의 답변 페이지");
		return "/admin/adminInquiryAnswer";
	}
	
	
	@RequestMapping("/adminInquiryModify.do")
	public String adminInquiryModify() {
		System.out.println(">> 1:1상품 문의 수정 페이지");
		return "/admin/adminInquiryModify";
	}
	
	@RequestMapping("/couponList.do")
	public String couponList() {
		System.out.println(">> 쿠폰 목록 페이지");
		return "/admin/couponList";
	}
	
	@RequestMapping("/couponInsert.do")
	public String couponInsert() {
		System.out.println(">> 쿠폰 발행 페이지");
		return "/admin/couponInsert";
	}
	
	@RequestMapping("/couponModify.do")
	public String couponModify() {
		System.out.println(">> 쿠폰 수정 페이지");
		return "/admin/couponModify";
	}
	
	@RequestMapping("/couponSelect.do")
	public String couponSelect() {
		System.out.println(">> 쿠폰 조회 페이지");
		return "/admin/couponSelect";
	}
	
	
	
}
