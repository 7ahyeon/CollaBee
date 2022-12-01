package com.spring.collabee.view.faq;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.collabee.board.BoardVO;
import com.spring.collabee.faq.FaqService;
import com.spring.collabee.faq.FaqVO;


@RequestMapping("/faq")
@Controller
public class FaqController {
	@Autowired
	private FaqService faqService;
	
	public FaqController() {
		System.out.println(">>FaqController() 객체 생성");
	}
	
	@RequestMapping("/faq.do")
	public String faq(FaqVO vo,Model model){
		System.out.println(">>FAQ 페이지");
		
		List<FaqVO> list = faqService.getFaqList(vo);
		System.out.println("vo:"+ vo);
		model.addAttribute("faqList",list);		
		return "/faq/faq";
	}
	
	@RequestMapping("/faq_write.do")
	public String faq_write() {
		System.out.println(">>FAQ 페이지 작성 페이지");
		return "/faq/faq_write";
	}
	
	@RequestMapping(value = "/insertFaq.do", method = RequestMethod.POST)
	public String insertFaq(FaqVO vo) {
		System.out.println("===> Faq 입력");
		System.out.println("vo : " + vo);
		
		faqService.insertFaq(vo);
		
		return "redirect:/faq/faq.do";
	}
	
	@RequestMapping("/faq_modify.do")
	public String faq_modify(FaqVO vo, Model model) {
		System.out.println(">>FAQ 페이지 수정 페이지");
		FaqVO faq = faqService.getFaq(vo);
		model.addAttribute("faq", faq);
		
		System.out.println("faq : " + faq);
		
		return "/faq/faq_modify";
	}
	
	@RequestMapping(value = "/updateFaq.do", method = RequestMethod.POST)
	public String updateNotice(FaqVO vo, int faqNum) {
		System.out.println("===> FAQ 수정");
		System.out.println(faqNum);
		faqService.updateFaq(vo);
		
		System.out.println("vo : " + vo);
		
		return "redirect:/faq/faq.do";
	}

	@RequestMapping("/deletefaq.do")
	public String deleteFaq(FaqVO vo) {
		System.out.println(">> FAQ 삭제");
		System.out.println("vo : " + vo);
		
		faqService.deletFaq(vo);
		
		return "redirect:/faq/faq.do";
	}

	
}
