package com.spring.collabee.view.admininquiry;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@RequestMapping("/adminInquiry")
@Controller
public class AdminInquiryController {
	
	public AdminInquiryController() {
		System.out.println(">> AdminInquiryController() 객체 생성");
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
		
}
