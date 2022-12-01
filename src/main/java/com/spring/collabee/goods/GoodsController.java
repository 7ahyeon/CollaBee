package com.spring.collabee.goods;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/goods")
@Controller
public class GoodsController {
	
	public GoodsController() {
		System.out.println(">>GoodsController() 객체 생성");
		
	}
	
	@RequestMapping("/goodsContent.do")
	public String cart() {
		System.out.println(">>상세 페이지");
		return "/goods/goodsContent";
	}
}


