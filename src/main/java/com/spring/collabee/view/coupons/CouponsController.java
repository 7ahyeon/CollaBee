package com.spring.collabee.view.coupons;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String couponInsert(@RequestParam String couponName,
								@RequestParam int disPrice,
								@RequestParam int count,
								@RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd")Date couponDate,
								@RequestParam int leastCost
			) {
		
		System.out.println(">> 쿠폰 DB입력 및 발행");
		
		CouponsVO vo = new CouponsVO();
		vo.setCouponName(couponName);
		vo.setDisPrice(disPrice);
		vo.setCount(count);
		vo.setCouponDate(couponDate);
		vo.setLeastCost(leastCost);
		
		couponsService.couponsInsert(vo);
		
		return "redirect:/coupons/couponsList.do";
	}
	
	@RequestMapping("/couponsModify.do")
	public String couponsModify() {
		System.out.println(">> 쿠폰 수정 페이지");
		return "/admin/couponsModify";
	}
	
	@RequestMapping("/couponsSelect.do")
	public String couponSelect(CouponsVO vo, Model model) {
		System.out.println(">> 쿠폰 상세조회 페이지");
		System.out.println("couponsService : " + couponsService);
		
		CouponsVO coupons = couponsService.couponsSelect(vo);
		
		model.addAttribute("coupons", coupons);
		System.out.println("coupons : " + coupons);
		return "couponsSelect.jsp";
	}
	
	@RequestMapping("/couponsDelete.do")
	public String couponsDelete() {
		System.out.println(">> 쿠폰 삭제");
		return "/admin/couponsList";
	}
	
	
	
}
