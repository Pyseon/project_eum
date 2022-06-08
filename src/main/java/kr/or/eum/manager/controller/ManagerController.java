package kr.or.eum.manager.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.eum.manager.model.service.ManagerService;
import kr.or.eum.manager.model.vo.Answer;
import kr.or.eum.manager.model.vo.Chart;
import kr.or.eum.manager.model.vo.FaQ;
import kr.or.eum.manager.model.vo.MemberChart;
import kr.or.eum.manager.model.vo.Notice;
import kr.or.eum.manager.model.vo.Question;
import kr.or.eum.manager.model.vo.SalesChart;
import kr.or.eum.member.model.vo.Member;
import kr.or.eum.product.model.vo.Payment;
import kr.or.eum.report.model.vo.Report;

@Controller
public class ManagerController {
	@Autowired
	private ManagerService service;
	
	@RequestMapping(value = "/manaMember.do")
	public String manaMember(int reqPage, int selectNum, String searchType, String keyword, Model model) {
		String wherePage = "manaMember.do";
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
	public String manaReport(int reqPage, int selectNum, String searchType, String keyword, Model model) {
		String wherePage = "manaReport.do";
		HashMap<String, Object> rpd = service.PageList(reqPage, selectNum, wherePage, searchType, keyword);
		model.addAttribute("list", rpd.get("reportList"));
		model.addAttribute("pageNavi",rpd.get("pageNavi"));
		model.addAttribute("reqPage", reqPage);
		return "manager/managementReport";
	}
	
	@RequestMapping(value = "/detailReport.do")
	public String detailReport(int reportNo,int categoryNo,int reportIndex, Model model) {
		ArrayList<Report> report = service.detailReport(reportNo);
		model.addAttribute("report", report);
		model.addAttribute("category", categoryNo);
		return "manager/detailReport";
	}
	
	@RequestMapping(value="/answerReport.do")
	public String answerReport(int reportNo, String answerTitle, String answerContent, int category, int index) {
		int selNo = 1;
		int result = service.answerReport(answerTitle, answerContent);
		int result2 = service.updateReportIs(reportNo, selNo);
		return "manager/detailReport.do?reportNo="+reportNo+"&categoryNo="+category+"&reportIndex="+index;
	}
	@RequestMapping(value = "/reportMember.do")
	public String reportMember(int memberNo, int category, int index, int reportNo,int selNo) {
		int result = service.reportMember(memberNo);  //해당 멤버 정지, 리폿카운트 올림
		int result2 = service.deleteArticles(category, index);  //글 없애기
		return "redirect:/manaMember.do?reqPage=1&selectNum=0&searchType=memberNo&keyword="+memberNo;
	}
	
	@RequestMapping(value = "/manaFAQ.do")
	public String manaFAQ(int reqPage, int selectNum, String searchType, String keyword, Model model) {
		String wherePage = "manaFAQ.do";
		HashMap<String, Object> fpd = service.PageList(reqPage, selectNum, wherePage, searchType, keyword);
		model.addAttribute("list", fpd.get("FAQList"));
		model.addAttribute("pageNavi", fpd.get("pageNavi"));
		model.addAttribute("reqPage", reqPage);
		model.addAttribute("selectNum", selectNum);
		return "manager/managementFAQ";
	}
	@RequestMapping(value = "/insertFAQFrm.do")
	public String inorupFAQFrm() {
		return "manager/insertFAQFrm";
	}
	
	@RequestMapping(value = "/insertFAQ.do")
	public String insertFAQ(int FAQType, String FAQTitle, String FAQContent) {
		int result = service.insertFAQ(FAQType, FAQTitle, FAQContent);
		return "redirect:/manaFAQ.do?reqPage=1&selectNum=0";
	}
	
	@RequestMapping(value = "/deleteFAQ.do")
	public String deleteFAQ(int FAQNo) {
		int result = service.deleteFAQ(FAQNo);
		return "redirect:/manaFAQ.do?reqPage=1&selectNum=0";
	}
	
	@RequestMapping(value = "/updateFAQFrm.do")
	public String updateFAQFrm(int FAQNo, Model model) {
		ArrayList<FaQ> list = service.selectFAQ(FAQNo);
		model.addAttribute("list", list);
		return "manager/updateFAQFrm";
	}
	@RequestMapping(value = "/updateFAQ.do")
	public String updateFAQ(int FAQNo, int FAQType, String FAQTitle, String FAQContent) {
		int result = service.updateFAQ(FAQNo, FAQType, FAQTitle, FAQContent);
		return "redirect:/manaFAQ.do?reqPage=1&selectNum=0";
	}
	@RequestMapping(value = "/manaNotice.do")
	public String manaNotice(int reqPage, String searchType, String keyword, Model model) {
		String wherePage = "manaNotice.do";
		int selectNum = 0;
		HashMap<String, Object> npd = service.PageList(reqPage, selectNum, wherePage, searchType, keyword);
		model.addAttribute("list", npd.get("noticeList"));
		model.addAttribute("pageNavi", npd.get("pageNavi"));
		model.addAttribute("reqPage", reqPage);
		model.addAttribute("selectNum", selectNum);
		return "manager/managementNotice";
	}
	@RequestMapping(value = "/insertNoticeFrm.do")
	public String insertNoticeFrm() {
		return "manager/insertNoticeFrm";
	}
	@RequestMapping(value = "/insertNotice.do")
	public String insertNotice(HttpServletRequest request, String noticeTitle, String noticeContent) {
		HttpSession session = request.getSession(false);
		Member member = (Member)session.getAttribute("member");
		HashMap<String, Object> notice = new HashMap<String, Object>();
		notice.put("memberNo", member.getMemberNo());
		notice.put("noticeTitle", noticeTitle);
		notice.put("noticeContent", noticeContent);
		int result = service.insertNotice(notice);
		return "redirect:/manaNotice.do?reqPage=1";
	}
	@RequestMapping(value = "/deleteNotice.do")
	public String deleteNotice(int noticeNo) {
		int result = service.deletenotice(noticeNo);
		return "redirect:/manaNotice.do?reqPage=1";
	}
	@RequestMapping(value = "/updateNoticeFrm.do")
	public String updateNoticeFrm(int noticeNo, Model model) {
		ArrayList<Notice> list = service.selectNotice(noticeNo);
		model.addAttribute("list", list);
		return "manager/updateNoticeFrm";
	}
	@RequestMapping(value = "/updateNotice.do")
	public String updateNotice(int noticeNo, String noticeTitle, String noticeContent) {
		int result = service.updateNotice(noticeNo, noticeTitle, noticeContent);
		return "redirect:/manaNotice.do?reqPage=1";
	}
	@RequestMapping(value = "/manaChart.do")
	public String manaChart(Model model) {
		Chart chart = service.selectChart();
		model.addAttribute("chart", chart);
		return "manager/managementChart";
	}
	@ResponseBody
	@RequestMapping(value = "/memberChart.do", produces = "application/json;charset=utf-8")
	public String memberChart(String year) {
		MemberChart memberChart = service.selectMemberChart(year);
		return new Gson().toJson(memberChart);
	}
	
	@ResponseBody
	@RequestMapping(value = "/salesChart.do", produces = "application/json;charset=utf-8")
	public String salesTypeChart(String year, int salesType) {
		ArrayList<SalesChart> salesTypeChart = service.selectSalesTypeChart(year, salesType);
		return new Gson().toJson(salesTypeChart);
	}
	@RequestMapping(value = "/manaAnswer.do")
	public String manaAnswer(int reqPage, int selectNum, String searchType, String keyword, Model model) {
		String wherePage = "manaAnswer.do";
		HashMap<String, Object> apd = service.PageList(reqPage, selectNum, wherePage, searchType, keyword);
		model.addAttribute("list", apd.get("answerList"));
		model.addAttribute("pageNavi", apd.get("pageNavi"));
		model.addAttribute("reqPage", reqPage);
		model.addAttribute("selectNum", selectNum);
		return "manager/managementAnswer";
	}
	@RequestMapping(value = "/manaQuestion.do")
	public String manaQuestion(int reqPage, int selectNum, String searchType, String keyword, Model model) {
		String wherePage = "manaQuestion.do";
		HashMap<String, Object> qpd = service.PageList(reqPage, selectNum, wherePage, searchType, keyword);
		model.addAttribute("list", qpd.get("qstList"));
		model.addAttribute("pageNavi", qpd.get("pageNavi"));
		model.addAttribute("reqPage", reqPage);
		model.addAttribute("selectNum", selectNum);
		return "manager/managementQuestion";
	}
	@RequestMapping(value = "/insertAnswerFrm.do")
	public String insertAnswerFrm(int qstNo, Model model) {
		Question qst = service.selectQst(qstNo);
		model.addAttribute("qst", qst);
		return "manager/insertAnswerFrm";
	}
	@RequestMapping(value = "/insertAnswer.do")
	public String insertAnswer(HttpServletRequest request, int qstNo, String ansTitle, String ansContent) {
		HttpSession session = request.getSession(false);
		Member member = (Member)session.getAttribute("member");
		HashMap<String, Object> answer = new HashMap<String, Object>();
		answer.put("memberNo", member.getMemberNo());
		answer.put("qstNo", qstNo);
		answer.put("ansTitle", ansTitle);
		answer.put("ansContent", ansContent);
		int result = service.insertAnswer(answer);
		int reulst2 = service.updateAnsState(qstNo);
		return "redirect:/manaQuestion.do?reqPage=1&selectNum=0";
	}
	@RequestMapping(value = "/myQuestionList.do")
	public String myQuestionList(HttpSession session, int memberNo, Model model,int reqPage,int selectNum) {
		String wherePage = "myQuestionList.do";
		String searchType = null;
		String keyword = Integer.toString(memberNo);
		HashMap<String, Object> qpd = service.PageList(reqPage, selectNum, wherePage, searchType, keyword);
		model.addAttribute("list", qpd.get("qstList"));
		model.addAttribute("pageNavi", qpd.get("pageNavi"));
		model.addAttribute("reqPage", reqPage);
		model.addAttribute("selectNum", selectNum);
		return "mypage/myQuestionList";
	}
	@RequestMapping(value = "/insertQuestionFrm.do")
	public String insertQuestionFrm(HttpSession session, Model model) {
		return "mypage/insertQuestionFrm";
	}
	@RequestMapping(value = "/insertQuestion.do")
	public String insertQuestion(HttpServletRequest request, String qstTitle, String qstContent) {
		HttpSession session = request.getSession(false);
		Member member = (Member)session.getAttribute("member");
		HashMap<String, Object> qst = new HashMap<String, Object>();
		qst.put("memberNo", member.getMemberNo());
		qst.put("qstTitle", qstTitle);
		qst.put("qstContent", qstContent);
		int result = service.insertQuestion(qst);
		return "redirect:/myQuestionList.do?reqPage=1&selectNum=0&memberNo="+member.getMemberNo();
	}
	@RequestMapping(value = "/detailQuestion.do")
	public String detailQuestion(int qstNo, Model model) {
		Question qst = service.selectQst(qstNo);
		Answer ans = service.selectAns(qstNo);
		model.addAttribute("qst", qst);
		model.addAttribute("ans", ans);
		return "mypage/detailQuestion";
	}
}
