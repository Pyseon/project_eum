package kr.or.eum.manager.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.eum.manager.model.service.ManagerService;
import kr.or.eum.member.model.vo.Member;

@Controller
public class ManagerController {
	@Autowired
	private ManagerService service;
	
	@RequestMapping(value = "/manaMember.do")
	public String manaMember() {
		return "manager/managementMember";
	}
	
	@ResponseBody
	@RequestMapping(value="/selectMember.do", produces = "application/json;charset=utf-8")
	public String selectMember(int selectMemberBtn) {
		ArrayList<Member> list = service.selectMember(selectMemberBtn);
		return new Gson().toJson(list);
	}
	
	@RequestMapping(value = "/registBlackList.do")
	public String registBlackList(int memberNo, int selectMemberBtn) {
		int result = service.registBlackList(memberNo);
		return "manager/managementMember";
	}
	
	@RequestMapping(value = "/clearBlackList.do")
	public String clearBlackList(int memberNo, int selectMemberBtn) {
		int result = service.clearBlackList(memberNo);
		return "redirect:/selectMember.do?selectMemberBtn="+selectMemberBtn;
	}
	
}
