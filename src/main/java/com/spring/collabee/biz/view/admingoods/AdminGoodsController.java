package com.spring.collabee.biz.view.admingoods;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.spring.collabee.biz.admingoods.AdminGoodsService;
import com.spring.collabee.biz.admingoods.impl.AdminGoodsDAO;
import com.spring.collabee.biz.goods.GoodsVO;

@Controller
@RequestMapping("/adminGoods")
public class AdminGoodsController {
	@Autowired
	private AdminGoodsService adminGoodsService;
	
	public AdminGoodsController() {
		System.out.println(">> AdminGoodsController() 객체 생성");
	}
	
	@RequestMapping("/adminGoodsInsert.do")
	public String adminGoodsInsert(GoodsVO vo) {
		System.out.println(">> 상품등록 페이지");
		System.out.println("vo : " + vo);
		

		
		return "/admin/adminGoodsInsert";
	}
		
	@RequestMapping("/adminGoodsModify.do")
	public String adminGoodsModify() {
		System.out.println(">> 상품수정 페이지");
		return "/admin/adminGoodsModify";
	}
	
	@RequestMapping("/adminGoodsDelete.do")
	public String adminGoodsDelete() {
		System.out.println(">> 상품 삭제");
		return "/admin/adminGoodsList";
	}
	
	@RequestMapping("/adminGoodsSelect.do")
	public String adminGoodsSelect(GoodsVO vo, Model model) {
		System.out.println(">> 상품 상세 보여주기");
		System.out.println("adminGoodsService : " + adminGoodsService);
		
		GoodsVO goods = adminGoodsService.adminGoodsSelect(vo);
		
		model.addAttribute("goods", goods);
		System.out.println("goods : " + goods);
		
		return "adminGoodsSelect.jsp";
	}
	
	
	@RequestMapping("/adminGoodsList.do")
	public String adminGoodsList(GoodsVO vo, Model model) {
		System.out.println(">> 상품목록 페이지");
		System.out.println("vo : " + vo);
		
		model.addAttribute("goodsList", adminGoodsService.adminGoodsList(vo));
		
		return "/admin/adminGoodsList";
	}
			
}
