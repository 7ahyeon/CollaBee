package com.spring.collabee.view.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.spring.collabee.biz.emoneyusage.EmoneyUsageService;
import com.spring.collabee.biz.emoneyusage.EmoneyUsageVO;
import com.spring.collabee.biz.member.MemberService;
import com.spring.collabee.biz.member.MemberVO;
import com.spring.collabee.biz.mycouponbox.MyCouponBoxService;
import com.spring.collabee.biz.mycouponbox.MyCouponBoxVO;
import com.spring.collabee.biz.myorderlist.MyOrderListService;
import com.spring.collabee.biz.myorderlist.MyOrderListVO;
import com.spring.collabee.biz.mypicklist.MyPickListVO;
import com.spring.collabee.biz.mypicklist.MyPicklistService;

@RestController
@SessionAttributes("loginMember") //loginMember 라는 이름의 Model 객체가 있으면 session에 저장 
@RequestMapping("/mypage")
public class mypageAjaxController {
	@Autowired
	MemberService memberService;
	@Autowired
	MyCouponBoxService myCouponBoxService;
	@Autowired
	EmoneyUsageService emoneyUsageService;
	@Autowired
	MyPicklistService myPicklistService;
	@Autowired
	MyOrderListService myOrderListService;
	
	
	public mypageAjaxController() {
		System.out.println("● mypageAjaxController 객체 생성");
	}
	
	@RequestMapping("/oldPwChkAjax.do") 
	public boolean oldPwChk(@RequestBody MemberVO mvo) {
		System.out.println("oldPwChk() 실행");	
		System.out.println("받은값 : " + mvo);
		MemberVO findMember = memberService.login(mvo);
		System.out.println("찾은 비번 : " + memberService.login(mvo).getPassword() );
		
		if (findMember != null) {
			System.out.println("비밀번호찾기 성공 >>");	
			if (mvo.getPassword().equals(findMember.getPassword())) {
				System.out.println("true리턴");
				return true;				 
			} else {
				return false;
			}
		} else {
			System.out.println("비밀번호찾기 실패 (사용자정보없음) >>");
			return false;
		}		
	
	}
	
	@RequestMapping("/modifyAjax.do") 
	public boolean modify(@RequestBody MemberVO mvo, Model model) {
		System.out.println("modify() 실행");	
		System.out.println("받은값 : "  + mvo);
		int result = memberService.modify(mvo);
		System.out.println("result : " + result );
		if (result < 0) {
			return false;
		} else {
			MemberVO loginMember = memberService.getMember(mvo.getId());
			model.addAttribute("loginMember", loginMember);
			return true;			
		}
		
	}

	
	@RequestMapping("/leaveAjax.do")
	public String leaveAjax(MemberVO mvo, SessionStatus sessionStatus) {
		System.out.println("leaveAjax.do 실행 > mvo : " + mvo );
		memberService.leave(mvo);
		return "mypage/logout.do";
	}
	
	
	//마이페이지 상단 쿠폰 갯수
	@RequestMapping("/getCouponCntAjax.do")
	public int getCouponCnt (@RequestBody MemberVO mvo) {
		System.out.println(">> 마이페이지 상단 쿠폰 불러올게용");
		return myCouponBoxService.getCouponCnt(mvo);
	}
	
	//마이페이지 상단 총 적립금
	@RequestMapping("/getTotEmoneyAjax.do")
	public int getTotEmoney (@RequestBody MemberVO mvo, Model model) {
		System.out.println(">> 마이페이지 상단 적립금 불러올게용");
		System.out.println("받은값 : " + emoneyUsageService.getTotEmoney(mvo));
			int totEmoney = emoneyUsageService.getTotEmoney(mvo);
			model.addAttribute("totEmoney", totEmoney);
			return 	emoneyUsageService.getTotEmoney(mvo);			
	}
	
	
	//쿠폰페이지
	@RequestMapping("/couponAjax.do")
	public List<MyCouponBoxVO> getCouponBoxList(@RequestBody MemberVO mvo) {	
		System.out.println("coupon() 실행");	
		System.out.println("받은값 : " + mvo);
		return myCouponBoxService.getCouponBoxList(mvo);
	}
	
	//적립금 내역 페이지
	@RequestMapping("/emoneyAjax.do")
	public List<EmoneyUsageVO> getEmoneyUsage(@RequestBody MemberVO mvo) {	
		System.out.println("getEmoneyUsage () 실행");	
		System.out.println("받은값 : " + mvo);
		return emoneyUsageService.getEmoneyUsageList(mvo);
	}
	
	
	//주문목록
	@RequestMapping("/getOrderListAjax.do")
	public Map<String, MyOrderListVO> getOrderList(@RequestBody Map<String,Integer> orderInfo) {
		System.out.println("getOrderList() 실행 ~~> 주문목록불러오기");
		int memberNum = (int) orderInfo.get("memberNum");
		int period = (int) orderInfo.get("period");
		System.out.println(">>>> 주문목록 받아온 멤버 : " + memberNum );
		System.out.println(">>>> 주문목록 받아온 기간 : " + period );

		//회원의 전체 주문 목록 찾아오기
		List<MyOrderListVO> orderListAll = myOrderListService.getOrderList(orderInfo);
		System.out.println("orderListAll>>> " + orderListAll);
		
		//주문번호 별로 1건의 데이터만 저장(주문번호별 보기)
		Map<String, MyOrderListVO> orderList = new HashMap<String, MyOrderListVO>();
		;
		for(int i = 0; i <orderListAll.size(); i++) {
			//리스트의 인덱스를 꺼내서(OrderListVO 에 담음)
			MyOrderListVO olvo  = orderListAll.get(i);
			//map에 넣어줌 (주문번호가 중복이면 첫번째만 들어감)
			orderList.put(Integer.toString(olvo.getOrderNum()), olvo);	
		}
		return	orderList;
	
	}
	
	//주문상세
	@RequestMapping("/getOrderDetailAjax.do")
	public List<MyOrderListVO> getOrderDetail(@RequestBody Map<String, Integer> orderInfo) {
		System.out.println("getOrderDetail() 실행 ~~> 주문상세불러오기");
		System.out.println(">>>> 주문상세 받아온 값 : " + orderInfo.get("memberNum"));
		System.out.println(">>>> 주문상세 받아온 값 : " + orderInfo.get("orderNum"));
		//null값 처리하기
		return myOrderListService.getOrderDetail(orderInfo);
		
	}
	
	//리뷰페이지 리뷰 작성
	@RequestMapping("/writeProReviewAjax.do")
	public void writeProReview( ) {
	
	}
	
	
	//찜한상품
	@RequestMapping("/getPickListAjax.do")
	public List<MyPickListVO> getPickList(@RequestBody MemberVO mvo) {	
		System.out.println("getPickList() 실행");	
		System.out.println("받은값 : " + mvo);
		return myPicklistService.getPickList(mvo);
	}
	
	
}
