package com.spring.collabee.view.member;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.spring.collabee.biz.member.MemberService;
import com.spring.collabee.biz.member.MemberVO;

@Controller
@SessionAttributes("loginMember") // member 라는 이름의 Model 객체가 있으면 session에 저장 
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	public MemberController() {
		System.out.println("● MemberController 객체 생성");
	}
	//== 페이지확인
	@GetMapping("/login.do")
	public String loginPageLoad(@ModelAttribute("mvo") MemberVO mvo) {	
		System.out.println("[GET] 로그인화면 이동 >> ");
		return "/member/login";
	}
	
	@PostMapping("login.do")
	public String login(MemberVO mvo, Model model) {
		System.out.println("[POST]login() 실행");
		System.out.println("id : " + mvo.getId() + ", pw : " + mvo.getPassword());
		
		MemberVO loginMember = memberService.login(mvo); 
		System.out.println("Controlller db작업 결과값 : " + loginMember);

		model.addAttribute("loginMember", loginMember);
		return "/mypage/order";

	}
	
	@RequestMapping("/logout.do")
	public String logout(SessionStatus sessionStatus) {
		System.out.println(">> 로그아웃 처리 ");
		//1. 세션 초기화(세션객체 무효화)
	//	session.invalidate();
		sessionStatus.setComplete();
		return "redirect:/member/login.do";
	}
	
	
	@GetMapping("/findId.do")
	public String findIdPageLoad(MemberVO mvo) {
		System.out.println("[GET] findId() 실행");
		return "/member/findId";
	}
	
	
	@GetMapping("/findPw.do")
	public String findPw() {	
		System.out.println("findPw() 실행");
		return "/member/findPw";
	}
	
	
	@GetMapping("/signup.do")
	public String signupPageLoad(MemberVO mvo) {
		System.out.println("signup()실행 회원가입페이지로 이동");
		System.out.println("memberVO : " + mvo);
		return "/member/signup";
	}
	
	@PostMapping("/signup.do")
	public String signup(MemberVO mvo) {
		System.out.println("[POST] signup() 실행");
		System.out.println("memberVO : " + mvo);
		memberService.signup(mvo);
		return "/member/login";
	}
	


	

	
	
}
