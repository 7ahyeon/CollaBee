package com.spring.collabee.view.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.collabee.biz.member.MemberService;
import com.spring.collabee.biz.member.MemberVO;

@RestController 
@SessionAttributes("loginMember") // loginMember 라는 이름의 Model 객체가 있으면 session에 저장 
@RequestMapping("/member")
public class MemberAjaxController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("loginAjax.do")
	public MemberVO loginAjax(@RequestBody MemberVO mvo) { //@RequestBody post방식
		System.out.println("=> MemberAjaxController loginAjax() 실행 ");
		System.out.println("loginAjax mvo : " + mvo);
		MemberVO findMember = memberService.login(mvo); 
		
		System.out.println("find member : " + findMember);
		
		MemberVO result ;
		
		if (findMember != null) {
			System.out.println("로그인성공 >>");	
			result = findMember;
		} else {
			System.out.println("로그인실패 (사용자정보없음) >>");
			result = mvo;
		}
		return result;
	}
	

	@PostMapping("/findIdAjax.do")
	public MemberVO findId(@RequestBody MemberVO mvo) {
		System.out.println("[POST] findId() 실행");
		System.out.println("mvo : " + mvo);
		MemberVO findMember =  memberService.findId(mvo) ;
		System.out.println("findMember: " + findMember);
		
		if (findMember != null) {
			System.out.println("아이디 찾음>>");	
		} else {
			System.out.println("아이디 찾기 실패 - 사용자정보없음 >>");
			findMember = mvo;
		}
		return findMember;
	}
	
	@PostMapping("/findPwAjax.do")
	public MemberVO findPw(@RequestBody MemberVO mvo) {
		System.out.println("[POST] findPw() 실행");
		System.out.println("mvo : " + mvo);
		MemberVO findMember =  memberService.findPw(mvo) ;
		System.out.println("findMember: " + findMember);
		
		if (findMember != null) {
			System.out.println("비밀번호 찾음>>");	
		} else {
			System.out.println("비밀번호찾기 실패 - 사용자정보없음 >>");
			findMember = mvo;
		}
		return findMember;
	}

	@RequestMapping("/confirmIdAjax.do") 
	public boolean confirmId(@RequestBody MemberVO mvo) {
		System.out.println("confirmId() 실행");
		System.out.println(">> [아이디 중복검사] 입력받은 값 : " + mvo.getId());
		
		//DB에 아이디 있는지 확인
		if (memberService.confirmId(mvo.getId()) != null) {
			return false;// 사용중인 아이디
		} else {
			return true;// 사용가능 아이디			
		}
	}
	

	@RequestMapping("/confirmEmailAjax.do") 
	public boolean confirmEmail(@RequestBody MemberVO mvo) {
		System.out.println("confirmEmail() 실행");	
		System.out.println(">> [이메일중복검사] 입력받은 값 : " + mvo.getEmail());
		
		if (memberService.confirmEmail(mvo.getEmail()) != null) {
			return false;// 사용중인 이메일
		} else {
			return true;// 사용가능 이메일				
		}	
	}
	

	
}
