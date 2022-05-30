package kr.or.eum.manager.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.eum.manager.model.service.ManagerService;
import kr.or.eum.product.model.service.ProductService;
import kr.or.eum.product.model.vo.Payment;
import kr.or.eum.product.model.vo.ProductDetail;
import kr.or.eum.report.model.vo.Report;

@Controller
public class ManagerController {
	@Autowired
	private ManagerService service;
	private ProductService productService;
	
	@RequestMapping(value = "/manaMember.do")
	public String manaMember(int reqPage, int selectNum, String searchType, String keyword, Model model) {
		String wherePage = "manaMember.do";
		//MemberPageData mpd = service.MemberList(reqPage, selMem, searchType, keyword);
		HashMap<String, Object> mpd = service.PageList(reqPage, selectNum, wherePage, searchType, keyword);
		model.addAttribute("list", mpd.get("memberList"));
		model.addAttribute("pageNavi", mpd.get("pageNavi"));
		model.addAttribute("reqPage", reqPage);
		model.addAttribute("selMem", selectNum);
		return "manager/managementMember";
	}
	
	@RequestMapping(value = "/updateBlackList.do")
	public String updateBlackList(int updateNo, int memberNo, int reqPage) {
		int result = service.updateBlackList(updateNo, memberNo);
		return "redirect:/manaMember.do?reqPage="+reqPage+"&selMem=4";
	}
	
	@RequestMapping(value = "/manaPayment.do")
	public String manaPayment(int reqPage, int selectNum, String searchType, String keyword, Model model) {
		String wherePage = "manaPayment.do";
		//PaymentPageData ppd = service.paymentList(reqPage, payState, searchType, keyword);
		HashMap<String, Object> ppd = service.PageList(reqPage, selectNum, wherePage, searchType, keyword);
		model.addAttribute("list", ppd.get("paymentList"));
		model.addAttribute("pageNavi", ppd.get("pageNavi"));
		model.addAttribute("reqPage", reqPage);
		model.addAttribute("payState", selectNum);
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
	@RequestMapping(value = "/manaReport.do")
	public String manaReport(int reqPage, String searchType, String keyword, Model model) {
		String wherePage = "manaReport.do";
		int selectNum = 0;
		HashMap<String, Object> rpd = service.PageList(reqPage, selectNum, wherePage, searchType, keyword);
		model.addAttribute("list", rpd.get("reportList"));
		model.addAttribute("pageNavi",rpd.get("pageNavi"));
		model.addAttribute("reqPage", reqPage);
		return "manager/managementReport";
	}
	@RequestMapping(value = "/detailReport.do")
	public String detailReport(int reportNo,int categoryNo, Model model) {
		ArrayList<Report> report = service.detailReport(reportNo);
		for(int i=0;i<report.size();i++) {
		System.out.println(report.get(i));
		}
		//ProductDetail pd = productService.selectProductDetail(report.get(index), expertNo);
		model.addAttribute("report", report);
		return "manager/detailReport";
	}
	
	
}
