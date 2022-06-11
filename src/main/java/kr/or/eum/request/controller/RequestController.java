package kr.or.eum.request.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.or.eum.member.model.vo.Member;
import kr.or.eum.request.model.service.RequestService;
import kr.or.eum.request.model.vo.Request;
import kr.or.eum.request.model.vo.RequestDetailData;
import kr.or.eum.request.model.vo.RequestPageData;

@Controller
public class RequestController {
	@Autowired
	private RequestService service;

	@RequestMapping(value = "/requestList.do")
	public String requestList(int reqPage, String selReq, Model model, HttpServletRequest request) {
		RequestPageData rpd = service.selectRequestList(reqPage, selReq);
		
		model.addAttribute("list", rpd.getList());
		model.addAttribute("selReq", selReq);
		model.addAttribute("pageNavi",rpd.getPageNavi());
		model.addAttribute("reqPage", reqPage);
		System.out.println("selReq : "+selReq);
		
		HttpSession session = request.getSession(false);
        Member member = null;
        if(session != null) {
            member = (Member)session.getAttribute("member");
        }
        if(member != null) {
			model.addAttribute("memberNo", member.getMemberNo());
			System.out.println("memberNo : "+member.getMemberNo());

		}else {
			model.addAttribute("memberNo", 0);
		}
		return "request/requestList";
	}
	
	@RequestMapping(value = "/requestWriterFrm.do")
	public String requestWriterFrm(HttpServletRequest request, Model model) {
		//HttpSession session = request.getSession(false);
		HttpSession session = request.getSession(false);
		Member member = null;
        if(session != null) {
            member = (Member)session.getAttribute("member");
        } 
        model.addAttribute("memberNo", member.getMemberNo());
        System.out.println("memberNo : "+member.getMemberNo());
        
		return "request/requestWriterFrm";
	}
	
	@RequestMapping(value = "/requestWrite.do")
	public String requestWrite(Request req, HttpServletRequest request) {
		
		int result = service.requestWrite(req);
		
		return "request/requestWriterFrm";
	}
	
	@RequestMapping(value="insertreqask.do")
	public String insertreqask(Request reqNo, HttpServletRequest request) {
		
		int result = service.insertreqask(reqNo);
		return "request/requestDetail";
	}
	
	@RequestMapping(value = "/requestDetail.do")
	public String requestDetail(int reqNo, int memberNo, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		Member member = null;
		if(session != null) {
			member = (Member)session.getAttribute("member");
		}
		
		RequestDetailData rdd = service.selectOneRequest(reqNo, member);
			if(member != null) {
				model.addAttribute("memberNo", member.getMemberNo());
				
			}else {
				model.addAttribute("memberNo", 0);
			}
			model.addAttribute("reqaskList", rdd.getReqaskList());
			model.addAttribute("req", rdd.getReq());
			model.addAttribute("Tag", rdd.getTag());
			System.out.println("req : "+rdd);
			
		return "request/requestDetail";
		
	}
}
