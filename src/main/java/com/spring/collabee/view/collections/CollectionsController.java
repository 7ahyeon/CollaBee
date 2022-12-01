package com.spring.collabee.view.collections;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.collabee.collections.CategoriesVO;
import com.spring.collabee.collections.CollectionsService;
import com.spring.collabee.collections.DivisionVO;

@Controller
@RequestMapping(value={"/cart", "/collections"})
public class CollectionsController {

	@Autowired
	private CollectionsService collectionsService;
	
	@RequestMapping("/categories")
	public String getCategories(HttpSession session, Model model) {
		System.out.println(">>> 카테고리 가져오기");
		
//		session.getAttribute("categories");
		
		return  null;
	}
	
	@RequestMapping("/main.do") 
	public String goMain( Model model) {
		System.out.println(">>> 메인페이지");
		
		model.addAttribute("categories", getCategories());
		model.addAttribute("division", getDivision());
		
		System.out.println(getDivision());
		return "/collections/main";
	}
	
	@RequestMapping("/market-newproduct.do") 
	public String goMarketNewProduct() {
		System.out.println(">>> 신상품페이지");
		
		return "/collections/new_item";
	}
	@RequestMapping("/market-best.do") 
	public String goMarketBest() {
		System.out.println(">>> 베스트페이지");
		
		return "/collections/best";
	}
	@RequestMapping("/event.do") 
	public String goEvent() {
		System.out.println(">>> 이벤트페이지");
		
		return "/collections/event";
	}
	@RequestMapping("/about_delivery.do") 
	public String goAboutDelivery() {
		System.out.println(">>> 배송안내페이지");
		
		return "/collections/about_delivery";
	}
	
	@RequestMapping("/getJsonDivision.do")
	public List<DivisionVO> getJsonDvisionList(int categoryNum) {
		System.out.println(">>> 세부카테고리 제이슨 실행");
		
		List<DivisionVO> list = collectionsService.getDivision(categoryNum);
		return list;
	}
	
	
	public List<CategoriesVO> getCategories() {
		
		List<CategoriesVO> list = new ArrayList<>();
		list = collectionsService.getCategories();
		return list;
	}
	public List<DivisionVO> getDivision() {
		
		List<DivisionVO> list = new ArrayList<>();
		list = collectionsService.getDivision();
		return list;
	}
	

}




