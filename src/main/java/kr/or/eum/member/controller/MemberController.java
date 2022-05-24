package kr.or.eum.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.eum.member.model.service.MemberService;
import kr.or.eum.member.model.vo.Member;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	
	@RequestMapping(value="/loginFrm.do")
	public String loginFrm() {
		return "member/loginFrm";
	}
	@RequestMapping(value="/login.do")
	public String login(Member m , HttpSession session) {
		Member member = service.selectOneMember(m);
		if(member != null) {
			session.setAttribute("member", member);
		}
		return "redirect:/";
	}
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
	@RequestMapping(value="/joinFrm.do")
	public String joinFrm() {
		return "member/joinFrm";
	}
}
