package com.spring.collabee.view.collections;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.collabee.biz.collections.CategoriesVO;
import com.spring.collabee.biz.collections.CollectionsService;
import com.spring.collabee.biz.collections.DivisionVO;
import com.spring.collabee.biz.goods.GoodsVO;

@Controller
@RequestMapping(value={"/cart", "/collections"})
public class CollectionsController {

	@Autowired
	private CollectionsService collectionsService;
	
	@RequestMapping("/categories")
	public String getCategories(HttpSession session, Model model) {
		System.out.println(">>> 카테고리 가져오기");
		
		
		return  null;
	}
	
	@RequestMapping("/main.do") 
	public String goMain(HttpServletRequest request, Model model)throws Exception {
		System.out.println(">>> 메인페이지");
		
		HttpSession session = request.getSession();
		
		session.setAttribute("categories", getCategories());
		session.setAttribute("division", getDivision());
		
		System.out.println(getDivision());
		System.out.println(getCategories());
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
	
	@ResponseBody
	@RequestMapping("/getJsonDivision.do")
	public List<DivisionVO> getJsonDvisionList(String categoryNum) {
		System.out.println(">>> 세부카테고리 제이슨 실행");
		
		System.out.println(categoryNum);
		List<DivisionVO> list = collectionsService.getDivision(Integer.parseInt(categoryNum));
		
		System.out.println("갔다옴" + list);
		return list;
	}
	
	
	@ResponseBody
	@RequestMapping("/getJsonGoodsLis1t.do")
	public List<GoodsVO> getJsonGoodsList() {
		System.out.println(">>> 신상품 제이슨 실행");
		
		
		List<GoodsVO> list = collectionsService.getGoodsList();
		
		System.out.println("갔다옴" + list);
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/getJsonGoodsList.do")
	public List<GoodsVO> getJsonGoodsList(GoodsVO vo) {
		System.out.println(">>> 신상품 제이슨 실행");
		
		String[] arr = new String[2];
		if (vo.getPriceRange() != null) {
			arr[0] = vo.getPriceRange().substring(0, vo.getPriceRange().indexOf('~'));
			arr[1] = vo.getPriceRange().substring(vo.getPriceRange().indexOf('~')+1, vo.getPriceRange().length());
		}
		vo.setPriceStart(arr[0]);
		vo.setPriceEnd(arr[1]);
		
		System.out.println("가격범위 ~기준 다른 배열 : " + arr[0]);
		System.out.println("가격범위 ~기준 다른 배열 : " + arr[1]);
		
		ArrayList<String> typeList = null;
		
		if (vo.getCategoryType() != null) {
			typeList = new ArrayList<>(Arrays.asList(vo.getCategoryType().split(",")));
			vo.setTypeList(typeList);
		}
		
		System.out.println("카테고리 타입 문자열 자른 리스트 : " + typeList);
		
		System.out.println("카테고리 필터 적용 후 mapper에 전달될 vo : " + vo);
		List<GoodsVO> list = collectionsService.getGoodsList(vo);
		
		System.out.println("갔다옴" + list);
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




