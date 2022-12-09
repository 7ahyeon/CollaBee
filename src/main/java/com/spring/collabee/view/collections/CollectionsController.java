package com.spring.collabee.view.collections;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.collabee.biz.collections.CategoriesVO;
import com.spring.collabee.biz.collections.CollectionsService;
import com.spring.collabee.biz.collections.DivisionVO;
import com.spring.collabee.biz.collections.SpecialCatVO;
import com.spring.collabee.biz.coupons.CouponsService;
import com.spring.collabee.biz.coupons.CouponsVO;
import com.spring.collabee.biz.goods.GoodsVO;

@Controller
@SessionAttributes({"categories", "division"})
@RequestMapping(value={"/cart", "/collections"})
public class CollectionsController {

	@Autowired
	private CollectionsService collectionsService;
	@Autowired
	private CouponsService couponsService;
	
	
	
	@ResponseBody
	@RequestMapping("/getJsonGoodsListByCategory.do")
	public List<GoodsVO> getJsonGoodsListByCategory(GoodsVO goods, DivisionVO division) {
		System.out.println(">>> 카테고리 Json 실행");
		
		Map<String, Object> map = processJsonData(null, "categories", goods, division);
		List<GoodsVO> list = collectionsService.goodsListByCategory(map);
		return list;
	}
	
	@RequestMapping("/categories.do")
	public String goCategories(DivisionVO vo, Model model) {
		System.out.println(">>> 카테고리별 상품조회페이지");
		
		System.out.println("카테고리별 상품조회 페이지 로딩시 DivisionVO : " + vo);
		model.addAttribute("divisionVOList", collectionsService.getDivisionByCategory(vo));
		System.out.println("카테고리별 상품조회 페이지 로딩시 divisionVOList : " + collectionsService.getDivisionByCategory(vo));
		model.addAttribute("division", vo);
		
		return "/collections/categories";
	}
	
	
	@RequestMapping("/main.do") 
	public String goMain(Model model){
		System.out.println(">>> 메인페이지");
		
		model.addAttribute("categories", getCategories());
//		model.addAttribute("division", getDivision());
		
		List<SpecialCatVO> specialList = getSpecialCat();
		model.addAttribute("specialList", specialList);
		
		int index = 1;
		for(SpecialCatVO vo : specialList) {
			model.addAttribute("special" + index, collectionsService.getSpecial(vo.getSpecialNum()));
			index++;
		}
		
		
		// 메인페이지 뿐만 아니라 맨처음 콜라비 입장시 들고가야하는 데이터
		model.addAttribute("imgRootPath", "C:/MyStudy/temp");
		

		return "/collections/main";
	}
	
	@RequestMapping("/market-newproduct.do") 
	public String goMarketNewProduct(Model model) {
		System.out.println(">>> 신상품페이지");
		
		return "/collections/new_item";
	}
	
	
	@RequestMapping("/search.do")
	public String goSearch(Model model, String sword) {
		System.out.println(">> 카테고리(상품검색) 검색페이지");
		
		System.out.println("키워드 : " + sword);
		model.addAttribute("sword", sword);
		return "/collections/new_item";
	}
	
	
	@RequestMapping("/market-best.do") 
	public String goMarketBest() {
		System.out.println(">>> 베스트페이지");
		
		return "/collections/best";
	}
	
	@RequestMapping("/event.do") 
	public String goEvent(Model model, CouponsVO vo) {
		System.out.println(">>> 이벤트페이지");
		
		model.addAttribute("couponsList", couponsService.couponsListAvail());
		return "/collections/event";
	}
	
	@RequestMapping("/about_delivery.do") 
	public String goAboutDelivery() {
		return "/collections/about_delivery";
	}
	
	@ResponseBody
	@RequestMapping("/getJsonDivision.do")
	public List<DivisionVO> getJsonDvisionList(DivisionVO vo) {
		List<DivisionVO> list = collectionsService.getDivisionByCategory(vo);
		System.out.println("호버에 따른 세부카테고리 DivisionVO 리스트 : " + list);

		return list;
	}
	
	
	@ResponseBody
	@RequestMapping("/getJsonGoodsList.do")
	public Map<String, Object> getJsonGoodsList(Model model, String sword, GoodsVO goods, DivisionVO division) {
		System.out.println(">>> 신상품 제이슨 실행");
		
		Map<String, Object> map = processJsonData(sword, "newItem", goods, division);
		model.addAttribute("paging", map);
		
		List<GoodsVO> list = collectionsService.getGoodsList(map);
		
		map = new HashMap<String, Object>();
		map.put("GoodsVOList", list);
		
		
		return map;
	}
	
	
	public List<GoodsVO> getSpecial(int specialNum) {
		
		return collectionsService.getSpecial(specialNum);
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
	
	public List<SpecialCatVO> getSpecialCat(){
		return collectionsService.getSpecialCat();
	}
	
	public Map<String, Object> processJsonData(String sword, String type, GoodsVO goods, DivisionVO division) {
		
		String[] arr = new String[2];
		if (goods.getPriceRange() != null) {
			arr[0] = goods.getPriceRange().substring(0, goods.getPriceRange().indexOf('~'));
			arr[1] = goods.getPriceRange().substring(goods.getPriceRange().indexOf('~')+1, goods.getPriceRange().length());
		}
		goods.setPriceStart(arr[0]);
		goods.setPriceEnd(arr[1]);
		
		Map<String, Object> map = new HashMap<>();
		List<GoodsVO> list = null;
		
		if ("categories".equals(type)) {
			
			map.put("categoryNum", division.getCategoryNum());
			map.put("goods", goods);
			
			list = collectionsService.goodsListByCategory(map);
			
		} else if ("newItem".equals(type) || "search".equals(type)) {
			
			ArrayList<String> typeList = null;
			
			if (goods.getCategoryType() != null) {
				typeList = new ArrayList<>(Arrays.asList(goods.getCategoryType().split(",")));
				goods.setTypeList(typeList);
				System.out.println("타입리스트: " + typeList);
			}
			
			map.put("goods", goods);
			map.put("sword", sword);
			
			System.out.println("생성된 map 출력 : " + map);
		}
		
		return map;
	}
	

}