package kr.or.eum.community.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.eum.community.model.service.CommunityService;
import kr.or.eum.community.model.vo.Community;
import kr.or.eum.community.model.vo.CommunityDetailData;
import kr.or.eum.community.model.vo.CommunityPageData;

@Controller
public class CommunityController {
	@Autowired
	private CommunityService service;
	
	@RequestMapping(value="/communityList.do")
	public String communityList(int category, int reqPage, Model model) {
		CommunityPageData cpd = service.selectCommunityList(category, reqPage);
		model.addAttribute("list", cpd.getList());
		model.addAttribute("pageNavi", cpd.getPageNavi());
		model.addAttribute("reqPage", reqPage);
		model.addAttribute("category", category);
		return "community/communityList";
	}
	
	@RequestMapping(value="/communityDetail.do")
	public String communityDetail(int commNo, int category, Model model) {
		//Community cm = service.communityDetail(commNo);
		CommunityDetailData cdd = service.communityDetail(commNo);
		model.addAttribute("comm", cdd.getComm());
		model.addAttribute("cmntList", cdd.getCmntList());
		if(category == 0) {
			return "community/detailCat0";
		}else {
			return "community/detailCat1";
		}
	}
	
	@RequestMapping(value="/communityWriteFrm.do")
	public String communityWriteFrm() {
			return "community/communityWriteFrm";
	}
	
	@RequestMapping(value="/communityWrite.do")
	public String communityWrite(Community comm) {
		System.out.println(comm);
		int result = service.communityWrite(comm);
		
		return "community/communityWriteFrm";
		//return "redirect:/communityList.do?category="+comm.getCommCategory()+"&reqPage=1";
	}
	
	
	
	
}
