package com.spring.collabee.view.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.mail.Session;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.util.WebUtils;

import com.spring.collabee.biz.cart.CartService;
import com.spring.collabee.biz.cart.CartVO;
import com.spring.collabee.biz.kauth.KakaoAuthService;
import com.spring.collabee.biz.member.MemberService;
import com.spring.collabee.biz.member.MemberVO;

@Controller
@SessionAttributes("loginMember") // member 라는 이름의 Model 객체가 있으면 session에 저장 
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private KakaoAuthService kakaoAuthService;
	@Autowired
	private CartService cartService;
	
	private static final String LOGIN = "/member/login";
	private static final String ORDER = "/mypage/order";
	private static final String FINDID = "/member/findId";
	private static final String FINDPW = "/member/findPw";
	private static final String SINGUP = "/member/signup";

	private String accessToken;
	
	public MemberController() {
		System.out.println("● MemberController 객체 생성");
	}

	@RequestMapping("/loginWithKakao.do")
	public String loginWithKakao (@RequestParam String code, Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response, CartVO cart) {
		// URL에 포함된 code를 이용하여 액세스 토큰 발급
		accessToken = kakaoAuthService.getKakaoAccessToken(code);
		System.out.println(">> Login accessToken :" + accessToken);
	
	    // 액세스 토큰을 이용하여 카카오 서버에서 유저 정보(이메일) 받아오기
	    HashMap<String, Object> userInfo = kakaoAuthService.getMeberInfo(accessToken);
		String email = (String) userInfo.get("email");
		System.out.println(">>>controller get email : " + email);
		//DB에서 일치하는 사용자 정보 찾기
		MemberVO findMember = memberService.getMember(email);
		if (email.equals(findMember.getEmail())) {
			model.addAttribute("loginMember", findMember);
			model.addAttribute("accessToken", accessToken);
			
			// 비회원 장바구니 -> 회원 장바구니 이동
			Cookie cookie = WebUtils.getCookie(request, "cartCookie");
			
			if (cookie != null) {
				List<CartVO> loginCart = new ArrayList<CartVO>();
				List<CartVO> nLoginCart = new ArrayList<CartVO>();
				
				String nmemberNum = cookie.getValue();
				cart.setMemberNum(findMember.getMemberNum());
				cart.setNmemberNum(nmemberNum);
				
				loginCart = cartService.getCartLogin(cart);
				nLoginCart = cartService.getCartNLogin(cart);
				
				if (nLoginCart != null && loginCart != null) {
					List<CartVO> equalCart = new ArrayList<CartVO>();
					List<CartVO> equalNCart = new ArrayList<CartVO>();

					// 비회원/회원 장바구니 모두 존재
					for (int n = 0; n < nLoginCart.size(); n++) {
						for (int i = 0; i < loginCart.size(); i++) {
							if (nLoginCart.get(n).getProductNum() == loginCart.get(i).getProductNum()) {
								equalCart.add(loginCart.get(i));
								equalNCart.add(nLoginCart.get(n));
							}
						}
					}
					// 중복 상품 존재시 재고 고려 수량 변경
					if (equalCart != null) {
						int goodsNum = 0;
						int goodsStock = 0;
						int goodsCount = 0;
						
						for (int e = 0; e < equalCart.size(); e++) {
							goodsNum = equalCart.get(e).getProductNum();
							cart.setProductNum(goodsNum);
							goodsStock = equalCart.get(e).getStock();
							
							goodsCount = equalCart.get(e).getCount() + equalNCart.get(e).getCount();
							if (goodsStock >= goodsCount) {
								
							} else {
								goodsCount = goodsStock;
							}
							cart.setMemberNum(0);
							cartService.deleteCart(cart);
							
							cart.setCount(goodsCount);
							cart.setNmemberNum(null);
							cart.setMemberNum(findMember.getMemberNum());
							cartService.updateCart(cart);
						}
					}
					// 비회원 장바구니 이동
					cart.setNmemberNum(nmemberNum);
					cartService.updateCartLogin(cart);
					
				} else if (nLoginCart != null && loginCart == null) {
					// 비회원 장바구니 존재시 이동
					cartService.updateCartLogin(cart);
				}

				cookie.setPath("/");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			
			return "redirect:/mypage/order.do";			
		} else {
			System.out.println("카카오 아이디와 일치하는 사용자 정보없음");
			return "redirect:/login.do?result=false";
		}
    	
	}	
	
	@GetMapping("/login.do") 
	public String loginPageLoad(@ModelAttribute("mvo") MemberVO mvo) {	
		System.out.println("[GET] 로그인화면 이동 >> ");
		return LOGIN;
	}
	
	@PostMapping("login.do") //로그인실행
	public String login(MemberVO mvo, Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response, CartVO cart) {
		System.out.println("[POST]login() 실행 >>");
		System.out.println("id : " + mvo.getId() + ", pw : " + mvo.getPassword());
		
		MemberVO loginMember = memberService.login(mvo); 
		System.out.println("Controlller db작업 결과값 : " + loginMember);

		model.addAttribute("loginMember", loginMember);
		
		// 비회원 장바구니 -> 회원 장바구니 이동
		Cookie cookie = WebUtils.getCookie(request, "cartCookie");
		
		if (cookie != null) {
			List<CartVO> loginCart = new ArrayList<CartVO>();
			List<CartVO> nLoginCart = new ArrayList<CartVO>();
			
			String nmemberNum = cookie.getValue();
			cart.setMemberNum(loginMember.getMemberNum());
			cart.setNmemberNum(nmemberNum);
			
			loginCart = cartService.getCartLogin(cart);
			nLoginCart = cartService.getCartNLogin(cart);
			
			if (nLoginCart != null && loginCart != null) {
				List<CartVO> equalCart = new ArrayList<CartVO>();
				List<CartVO> equalNCart = new ArrayList<CartVO>();

				// 비회원/회원 장바구니 모두 존재
				for (int n = 0; n < nLoginCart.size(); n++) {
					for (int i = 0; i < loginCart.size(); i++) {
						if (nLoginCart.get(n).getProductNum() == loginCart.get(i).getProductNum()) {
							equalCart.add(loginCart.get(i));
							equalNCart.add(nLoginCart.get(n));
						}
					}
				}
				// 중복 상품 존재시 재고 고려 수량 변경
				if (equalCart != null) {
					int goodsNum = 0;
					int goodsStock = 0;
					int goodsCount = 0;
					
					for (int e = 0; e < equalCart.size(); e++) {
						goodsNum = equalCart.get(e).getProductNum();
						cart.setProductNum(goodsNum);
						goodsStock = equalCart.get(e).getStock();
						
						goodsCount = equalCart.get(e).getCount() + equalNCart.get(e).getCount();
						if (goodsStock >= goodsCount) {
							
						} else {
							goodsCount = goodsStock;
						}
						cart.setMemberNum(0);
						cartService.deleteCart(cart);
						
						cart.setCount(goodsCount);
						cart.setNmemberNum(null);
						cart.setMemberNum(loginMember.getMemberNum());
						cartService.updateCart(cart);
					}
				}
				// 비회원 장바구니 이동
				cart.setNmemberNum(nmemberNum);
				cartService.updateCartLogin(cart);
				
			} else if (nLoginCart != null && loginCart == null) {
				// 비회원 장바구니 존재시 이동
				cartService.updateCartLogin(cart);
			}

			cookie.setPath("/");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		
		return "redirect:/mypage/order.do";
	}
	
	
	  @GetMapping ("/logout.do") public String logout(SessionStatus sessionStatus) { 
		  System.out.println(">> 로그아웃 처리 "); //세션 초기화(세션객체 무효화)
		  sessionStatus.setComplete();
	  	return "redirect:/member/login.do"; }
	 
	
	@GetMapping("/findId.do")
	public String findIdPageLoad(MemberVO mvo) {
		System.out.println("[GET] findId() 실행");
		return FINDID;
	}
	
	
	@GetMapping("/findPw.do")
	public String findPw() {	
		System.out.println("findPw() 실행");
		return FINDPW;
	}
	

	
	@GetMapping("/signup.do")
	public String signupPageLoad(MemberVO mvo) {
		System.out.println("signup()실행 회원가입페이지로 이동");
		System.out.println("memberVO : " + mvo);
		return SINGUP;
	}
	
	@PostMapping("/signup.do")
	public String signup(MemberVO mvo) {
		System.out.println("[POST] signup() 실행");
		System.out.println("memberVO : " + mvo);
		memberService.signup(mvo);
		return LOGIN;
	}
	


	

	
	
}
