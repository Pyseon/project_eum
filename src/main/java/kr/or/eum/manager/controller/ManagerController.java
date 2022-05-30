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
import kr.or.eum.manager.model.vo.PaymentPageData;
import kr.or.eum.member.model.vo.Member;
import kr.or.eum.product.model.vo.Payment;

@Controller
public class ManagerController {
	@Autowired
	private ManagerService service;
	
	@RequestMapping(value = "/manaMember.do")
	public String manaMember(int reqPage, int selMem, String searchType, String keyword, Model model) {
		MemberPageData mpd = service.MemberList(reqPage, selMem, searchType, keyword);
		model.addAttribute("list",mpd.getList());
		model.addAttribute("pageNavi", mpd.getPageNavi());
		model.addAttribute("reqPage", reqPage);
		model.addAttribute("selMem", selMem);
		return "manager/managementMember";
	}
	
	@RequestMapping(value = "/updateBlackList.do")
	public String updateBlackList(int updateNo, int memberNo, int reqPage) {
		int result = service.updateBlackList(updateNo, memberNo);
		return "redirect:/manaMember.do?reqPage="+reqPage+"&selMem=4";
	}
	
	@RequestMapping(value = "/manaPayment.do")
	public String manaPayment(int reqPage, int payState, String searchType, String keyword, Model model) {
		PaymentPageData ppd = service.paymentList(reqPage, payState, searchType, keyword);
		model.addAttribute("list", ppd.getList());
		model.addAttribute("pageNavi", ppd.getPageNavi());
		model.addAttribute("reqPage", reqPage);
		model.addAttribute("payState", payState);
		return "manager/managementPayment";
	}
	@RequestMapping(value = "/updatePayState.do")
	public String updatePayState(int updateNo, int payNo, int reqPage) {
		int result = service.updatePayState(updateNo, payNo);
		return "redirect:/manaPayment.do?reqPage="+reqPage+"&payState=3";
	}
	@RequestMapping(value="/detailPayment.do")
	public String detailPayment(int payNo, Model model) {
		ArrayList<Payment> pay = service.detailPayment(payNo);
		model.addAttribute("pay", pay);
		return "manager/detailPayment";
	}
	
	
}
