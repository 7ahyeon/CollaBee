package com.spring.collabee.view.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.collabee.biz.member.MemberService;
import com.spring.collabee.biz.member.MemberVO;

@Controller
@RequestMapping("/mypage")
public class mypageAjaxController {
	@Autowired
	MemberService memberService;
	
	public mypageAjaxController() {
		System.out.println("● mypageAjaxController 객체 생성");
	}
	
	@RequestMapping("/oldPwChkAjax.do") 
	public boolean oldPwChk(@RequestBody MemberVO mvo) {
		System.out.println("oldPwChk() 실행");	
		System.out.println("받은값 : " + mvo);
		System.out.println("찾은 비번 : " + memberService.findPw(mvo).getPassword() );
		String findPw = memberService.findPw(mvo).getPassword();
		if (mvo.getPassword().equals(findPw)) {
			System.out.println("true리턴");
			return true;				 
		} else {
			return false;
		}
	}
	

	
	@RequestMapping("/modifyAjax.do") 
	public boolean modify(@RequestBody MemberVO mvo) {
		System.out.println("modify() 실행");	
		System.out.println("받은값 : "  + mvo);
		int result = memberService.modify(mvo);
		
		if (result < 0) {
			return false;
		} else {
			return true;			
		}
		
	}
}
