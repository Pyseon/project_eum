package kr.or.eum.community.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.eum.community.model.service.CommunityService;
import kr.or.eum.community.model.vo.Community;
import kr.or.eum.community.model.vo.CommunityPageData;

@Controller
public class CommunityController {
	@Autowired
	private CommunityService service;
	
	@RequestMapping(value="/communityList.do")
	public String communityList(String menu, int category, int reqPage, Model model) {
		CommunityPageData cpd = service.selectCommunityList(category, reqPage);
		model.addAttribute("list", cpd.getList());
		model.addAttribute("pageNavi", cpd.getPageNavi());
		model.addAttribute("reqPage", reqPage);
		model.addAttribute("menu", menu);
		return "community/communityList";
	//	if(category == 0) {
	//	}else if(category == 1) {
	//		return "community/communityListCat1";
	//	}else {
	//		return "community/communityListCat2";
	//	}
		
	}
	
	
}
