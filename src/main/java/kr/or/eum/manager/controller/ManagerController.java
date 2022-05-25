package kr.or.eum.manager.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.eum.manager.model.service.ManagerService;
import kr.or.eum.manager.model.vo.MemberPageData;
import kr.or.eum.member.model.vo.Member;

@Controller
public class ManagerController {
	@Autowired
	private ManagerService service;
	
	@RequestMapping(value = "/manaMember.do")
	public String manaMember(int reqPage, Model model) {
		MemberPageData mpd = service.MemberList(reqPage);
		//ArrayList<Member> list = service.selectMember(0);
		model.addAttribute("list",mpd.getList());
		model.addAttribute("pageNavi", mpd.getPageNavi());
		model.addAttribute("reqPage", reqPage);
		return "manager/managementMember";
	}
	
	@ResponseBody
	@RequestMapping(value="/selectMember.do", produces = "application/json;charset=utf-8")
	public String selectMember(int selectMemberBtn) {
		ArrayList<Member> list = service.selectMember(selectMemberBtn);
		return new Gson().toJson(list);
	}
	
	@RequestMapping(value = "/updateBlackList.do")
	public String updateBlackList(int updateNo, int memberNo, int reqPage) {
		int result = service.updateBlackList(updateNo, memberNo);
		return "redirect:/manaMember.do?reqPage="+reqPage;
	}
	
}
