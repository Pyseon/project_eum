package kr.or.eum.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.eum.manager.model.vo.Answer;
import kr.or.eum.member.model.service.MemberService;
import kr.or.eum.member.model.vo.Member;


@Controller
public class MemberController {

	
	@Autowired
	private MemberService service;
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
	@RequestMapping(value="answerView.do")
	public String answerView() {
		//Answer a = service.selectOneAnswer(ansNo);
		
		return null;
	}
	
}
