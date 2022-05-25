package kr.or.eum.member.controller;


import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;


import kr.or.eum.community.model.vo.Community;
import kr.or.eum.manager.model.vo.Answer;
import kr.or.eum.manager.model.vo.Question;
import kr.or.eum.member.model.service.MemberService;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.eum.member.model.vo.Member;
import kr.or.eum.product.model.vo.Product;
import kr.or.eum.product.model.vo.ProductAndPayment;
import kr.or.eum.wishlist.model.vo.Wishlist;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	//대권 로그인페이지 이동
	@RequestMapping(value="/loginFrm.do")
	public String loginFrm() {
		return "member/loginFrm";
	}
	
	//대권 로그인 실행
	@RequestMapping(value="/login.do")
	public String login(Member m , HttpSession session) {
		Member member = service.selectOneMember(m);
		if(member != null) {
			session.setAttribute("member", member);
		}
		return "redirect:/";
	}
	
	//대권 로그아웃
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session) {
	session.invalidate();
	return "redirect:/";
	}
	
	//즉시로그인
	@RequestMapping(value="/instantlogin.do")
	public String instatlogin(Member m, HttpSession session) {
		Member member = service.selectOneMember(m);
		if(member != null) {
			session.setAttribute("member", member);
		}
		return "redirect:/";
	}
	
	//대권 회원가입페이지이동
	@RequestMapping(value="/joinFrm.do")
	public String joinFrm() {
		return "member/joinFrm";
	}	
	//재민 내 정보페이지
	@RequestMapping(value="/Mypage.do")
	public String Mypage() {
		return "mypage/Mypage";
	}
	//재민 내정보수정
	@RequestMapping(value="/updateMember.do")
	public String updateMember(Member m,HttpSession session) {
		int result = service.updateMember(m);
		if(result>0) {
			session.setAttribute("m", m);
		}
		return "redirect:/mypage.do";
	}
	//재민 1:1 문의내역 확인
	@RequestMapping(value="/MyquestionList.do")
	public String questionList(Model model) {
		ArrayList<Question> list = service.selectQuestionList();
		model.addAttribute("list", list);
		
		return "mypage/MyquestionList";
	}
	
	//재민 1:1문의 상세내역
	@RequestMapping(value="/questionView.do.do")
	public String questionView(int qstNo, Model model) {
		Question q = service.selectOneQuestion(qstNo);
		model.addAttribute("q",q);
		
		return "mypage/questionView";
		
	}
	//재민 구매내역
	@RequestMapping(value="/Myproduct.do")
	public String Myproduct(Model model) {
		ArrayList<ProductAndPayment> list = service.selectProductList();
		model.addAttribute("list", list);
		
		return "mypage/Myproduct";
	}
	//재민 찜내역
	
	@RequestMapping(value="/Wishlist.do")
	public String Mywishlist(Model model) {
		ArrayList<Wishlist> list = service.selectWishlist();
		model.addAttribute("list", list);
		System.out.println("list"+list);
		return "mypage/wishlist";
	}

}
