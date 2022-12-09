package com.spring.collabee.view.coupons;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.collabee.biz.coupons.CouponsService;
import com.spring.collabee.biz.coupons.CouponsVO;

@RequestMapping("/coupons")
@Controller
public class CouponsController {
	
	@Autowired
	private CouponsService couponsService;
	
	public CouponsController() {
		System.out.println(">> CouponsController() 객체 생성");
	}
	
	@RequestMapping("/couponsList.do")
	public String couponList(CouponsVO vo, Model model) {
		System.out.println(">> 쿠폰 목록 페이지");
		System.out.println("vo : " + vo);
		
		model.addAttribute("couponsList", couponsService.couponsList(vo));
		
		return "/admin/couponsList";
	}
	
	@RequestMapping("/couponsInsertPage.do")
	public String couponsInsertPage() {
		System.out.println(">> 쿠폰 발행 페이지");
		
		return "/admin/couponsInsert";
	}
	
	@RequestMapping("/couponsInsert.do")
	public String couponInsert(CouponsVO vo) {
		
		System.out.println(">> 쿠폰 DB입력 및 발행");
		
		couponsService.couponsInsert(vo);
		
		return "redirect:/coupons/couponsList.do";
	}
	
	@RequestMapping("/couponsModify.do")
	public String couponsModify(CouponsVO vo) {
		System.out.println(">> 쿠폰 정보 수정");
		
		System.out.println(vo);
		couponsService.couponsModify(vo);
		
		return "redirect:/coupons/couponsList.do";
	}
	
	@RequestMapping("/couponsSelect.do")
	public String couponSelect(CouponsVO vo, Model model) {
		System.out.println(">> 쿠폰 상세조회 페이지");
		model.addAttribute("coupons", couponsService.couponsSelect(vo));
		return "/admin/couponsSelect";
	}
	
	@RequestMapping("/couponsDelete.do")
	public String couponsDelete(CouponsVO vo) {
		System.out.println(">> 쿠폰 삭제");
		
		couponsService.couponsDelete(vo);
		return "/admin/couponsList";
	}
	
	
	@ResponseBody
	@RequestMapping("/getJsonCouponsList.do")
	public List<CouponsVO> getJsonCouponsList(CouponsVO vo){
		System.out.println(">> getJsonCouponsList(CouponsVO vo) 실행");
		
		return couponsService.couponsList(vo);
	}
	
	
	
}
