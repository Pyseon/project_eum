package kr.or.eum.community.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.eum.community.model.service.CommunityService;
import kr.or.eum.community.model.vo.Community;

@Controller
public class CommunityController {
	@Autowired
	private CommunityService service;
	
	@RequestMapping(value="/communityList.do")
	public String communityList(Model model) {
		ArrayList<Community> list = service.selectCommunityList();
		model.addAttribute("list", list);
		System.out.println("컨트롤러 불러온리스트: "+list);
		return "community/communityList";
	}
	
	
}
