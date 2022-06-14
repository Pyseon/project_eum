package kr.or.eum.request.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.or.eum.member.model.vo.Expert;
import kr.or.eum.member.model.vo.Member;
import kr.or.eum.request.model.service.RequestService;
import kr.or.eum.request.model.vo.Request;
import kr.or.eum.request.model.vo.RequestAskPageData;
import kr.or.eum.request.model.vo.RequestDetailData;
import kr.or.eum.request.model.vo.RequestPageData;

@ControllerAdvice 
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
		
		HttpSession session = request.getSession(false);
        Member member = null;
        
        if(session != null) {
            member = (Member)session.getAttribute("member");
        }
        if(member != null) {
			model.addAttribute("memberNo", member.getMemberNo());

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
        
		return "request/requestWriterFrm";
	}
	
	@RequestMapping(value = "/requestWrite.do")
	public String requestWrite(Request req, HttpServletRequest request) {
		
		int result = service.requestWrite(req);
		
		return "redirect:/requestList.do?reqPage=1&selReq=%EC%A0%84%EC%B2%B4";
	}
	
	@RequestMapping(value="insertreqask.do")
	public String insertreqask(int reqNo, int expertNo, HttpServletRequest request) {
		
		int result = service.insertReqask(reqNo, expertNo);
		
		return "redirect:/requestDetail.do?reqNo="+reqNo;
	}
	
	@RequestMapping(value = "/requestDetail.do")
	public String requestDetail(int reqNo, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		Member member = null;
		if(session != null) {
			member = (Member)session.getAttribute("member");
		}
		RequestAskPageData rapd = service.selectReqAskExpList(reqNo);
		model.addAttribute("list", rapd.getList());
		
		RequestDetailData rdd = service.selectOneRequest(reqNo, member);
			if(member != null) {
				model.addAttribute("memberNo", member.getMemberNo());
				int memberNo = member.getMemberNo();
					Expert expert = service.selectExpertNo(memberNo);
					if(expert != null) {
					model.addAttribute("expertNo", expert.getExpertNo());
					int existReqAsk = service.selectExistReqAsk(expert.getExpertNo(), reqNo);
					if(existReqAsk != 0) {
						model.addAttribute("existReqAsk", 1);
					}else {
						model.addAttribute("existReqAsk", 0);
					}
					
					}else {
					model.addAttribute("expertNo", 0);
				}
			}else {
				model.addAttribute("memberNo", 0);
			}
			model.addAttribute("reqaskList", rdd.getReqaskList());
			model.addAttribute("req", rdd.getReq());
			model.addAttribute("Tag", rdd.getTag());
			
			int selectExpertIs = service.selectExpertIs(reqNo);
			if(selectExpertIs != 0) {
				int selectExpert = service.selectExpert(reqNo);
				model.addAttribute("se", selectExpert);
			}else {
				model.addAttribute("se", 0);
				
			}
			model.addAttribute("sei", selectExpertIs);
			
		return "request/requestDetail";
	}
	
	@RequestMapping(value = "/selectExpert.do")
	public String selectExpert(int reqNo, int expertNo) {
		int result = service.updateSelectExpert(reqNo);
		int result2 = service.deleteUnselectExpert(reqNo, expertNo);
		return "redirect:/requestDetail.do?reqNo="+reqNo;
	}
	@RequestMapping(value = "/deleteRequest.do")
	public String deleteRequest(int reqNo) {
		int result = service.deleteRequest(reqNo);
		return "redirect:/requestList.do?reqPage=1&selReq=%EC%A0%84%EC%B2%B4";
	}
	@RequestMapping(value = "/updateRequestFrm.do")
	public String updateRequestFrm(HttpServletRequest request, int reqNo, Model model) {
		HttpSession session = request.getSession(false);
		Member member = null;
		if(session != null) {
			member = (Member)session.getAttribute("member");
		}
		RequestDetailData rdd = service.selectOneRequest(reqNo, member);
		model.addAttribute("req", rdd.getReq());
		model.addAttribute("Tag", rdd.getTag());
		return "request/updateRequestFrm";
	}
	@RequestMapping(value = "/updateRequest.do")
	public String updateRequest(int reqNo, String reqTitle, String reqContent) {
		int result = service.updateRequest(reqNo, reqTitle, reqContent);
		return "redirect:/requestDetail.do?reqNo="+reqNo;
	}
	
	//컨트롤러에서 발생하는 모든 에러를 처리하는 방식
	@ExceptionHandler
	public String error1(Exception e) {
		return "common/error";
	}
}
