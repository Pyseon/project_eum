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
  
  @RequestMapping(value="/Mypage.do")
	public String Mypage() {
		return "Mypage";
	}
	
	@RequestMapping(value="/updateMember.do")
	public String updateMember(Member m,HttpSession session) {
		int result = service.updateMember(m);
		if(result>0) {
			session.setAttribute("m", m);
		}
		return "redirect:/mypage.do";
	}
	
	@RequestMapping(value="/MyquestionList.do")
	public String questionList(Model model) {
		ArrayList<Question> list = service.selectQuestionList();
		model.addAttribute("list", list);
		System.out.println("list"+list);
		return "MyquestionList";
	}
	

}
