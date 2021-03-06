package kr.or.eum.manager.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
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
import kr.or.eum.member.model.vo.Expert;
import kr.or.eum.member.model.vo.Member;
import kr.or.eum.member.model.vo.RefuseExpert;
import kr.or.eum.product.model.vo.Payment;
import kr.or.eum.report.model.vo.AnswerReport;
import kr.or.eum.report.model.vo.Report;

@ControllerAdvice 
@Controller
public class ManagerController {
	@Autowired
	private ManagerService service;
	
	@RequestMapping(value = "/manaMember.do")
	public String manaMember(HttpServletRequest request, int reqPage, int selectNum, String searchType, String keyword, Model model) {
		Member member = (Member)request.getSession().getAttribute("member");
		if(member==null) {
			request.setAttribute("msg", "로그인이 필요합니다.");
			request.setAttribute("url", "/");
			return "common/alert";
		}else {
			if(member.getGrade() != 0) {
				request.setAttribute("msg", "관리자가 아닙니다.");
				request.setAttribute("url", "/");
				return "common/alert"; 
			}
		}
		String wherePage = "manaMember.do";
		int faqType = 0;
		HashMap<String, Object> mpd = service.PageList(reqPage, selectNum, wherePage, searchType, keyword, faqType);
		model.addAttribute("list", mpd.get("memberList"));
		model.addAttribute("pageNavi", mpd.get("pageNavi"));
		model.addAttribute("reqPage", reqPage);
		model.addAttribute("selectNum", selectNum);
		return "manager/managementMember";
	}
	
	@RequestMapping(value = "/updateBlackList.do")
	public String updateBlackList(int updateNo, int memberNo, int reqPage) {
		int result = service.updateBlackList(updateNo, memberNo);
		return "redirect:/manaMember.do?reqPage="+reqPage+"&selectNum=3";
	}
	
	@RequestMapping(value = "/manaPayment.do")
	public String manaPayment(HttpServletRequest request, int reqPage, int selectNum, String searchType, String keyword, Model model) {
		Member member = (Member)request.getSession().getAttribute("member");
		if(member==null) {
			request.setAttribute("msg", "로그인이 필요합니다.");
			request.setAttribute("url", "/");
			return "common/alert";
		}else {
			if(member.getGrade() != 0) {
				request.setAttribute("msg", "관리자가 아닙니다.");
				request.setAttribute("url", "/");
				return "common/alert"; 
			}
		}
		String wherePage = "manaPayment.do";
		int faqType = 0;
		//PaymentPageData ppd = service.paymentList(reqPage, payState, searchType, keyword);
		HashMap<String, Object> ppd = service.PageList(reqPage, selectNum, wherePage, searchType, keyword, faqType);
		model.addAttribute("list", ppd.get("paymentList"));
		model.addAttribute("pageNavi", ppd.get("pageNavi"));
		model.addAttribute("reqPage", reqPage);
		model.addAttribute("payState", selectNum);
		return "manager/managementPayment";
	}
	@RequestMapping(value = "/updatePayState.do")
	public String updatePayState(int updateNo, int payNo, int reqPage) {
		int result = service.updatePayState(updateNo, payNo);
		return "redirect:/manaPayment.do?reqPage="+reqPage+"&selectNum=3";
	}
	@RequestMapping(value="/detailPayment.do")
	public String detailPayment(int payNo,int reqPage, Model model) {
		Payment pay = service.detailPayment(payNo);
		model.addAttribute("pay", pay);
		model.addAttribute("reqPage", reqPage);
		return "manager/detailPayment";
	}
	@RequestMapping(value = "/manaReport.do")
	public String manaReport(HttpServletRequest request, int reqPage, int selectNum, String searchType, String keyword, Model model) {
		Member member = (Member)request.getSession().getAttribute("member");
		if(member==null) {
			request.setAttribute("msg", "로그인이 필요합니다.");
			request.setAttribute("url", "/");
			return "common/alert";
		}else {
			if(member.getGrade() != 0) {
				request.setAttribute("msg", "관리자가 아닙니다.");
				request.setAttribute("url", "/");
				return "common/alert"; 
			}
		}
		String wherePage = "manaReport.do";
		int faqType = 0;
		HashMap<String, Object> rpd = service.PageList(reqPage, selectNum, wherePage, searchType, keyword, faqType);
		ArrayList<Object> report = new ArrayList<Object>();
		model.addAttribute("list", rpd.get("reportList"));
		model.addAttribute("pageNavi",rpd.get("pageNavi"));
		model.addAttribute("reqPage", reqPage);
		model.addAttribute("selectNum", selectNum);
		return "manager/managementReport";
	}
	
	@RequestMapping(value = "/detailReport.do")
	public String detailReport(HttpServletRequest request, int reportNo,int categoryNo,int reportIndex, Model model) {
		Member member = (Member)request.getSession().getAttribute("member");
		if(member==null) {
			request.setAttribute("msg", "로그인이 필요합니다.");
			request.setAttribute("url", "/");
			return "common/alert";
		}else {
			if(member.getGrade() != 0) {
				request.setAttribute("msg", "관리자가 아닙니다.");
				request.setAttribute("url", "/");
				return "common/alert"; 
			}
		}
		Report report = service.detailReport(reportNo);
		int scoutReport = service.scoutReport(categoryNo, reportIndex);
		if(scoutReport > 0) {
			switch(categoryNo) {
			case 0: //상품
				break;
			case 1:	//상품 후기
				HashMap<String, Object> reportReview = service.selectProductReview(reportIndex);
				model.addAttribute("reviewTitle", reportReview.get("reviewTitle"));
				model.addAttribute("reviewContent", reportReview.get("reviewContent"));
				break;
			case 2:	//개설요청
				break;
			case 3:	//커뮤니티
				int categoryNum = service.selectCommCategoryNum(reportIndex);
				model.addAttribute("commCategory", categoryNum);
				break;
			case 4:	//커뮤니티 댓글
				String cmntContent = service.selectCmntContent(reportIndex);
				model.addAttribute("cmntContent", cmntContent);
				break;
			}
		}
		
		if(report.getReportIs()!=0) {
			AnswerReport ansrpt = service.selectAnsrpt(reportNo);
			model.addAttribute("ansrpt", ansrpt);
		}

		model.addAttribute("scout", scoutReport);
		model.addAttribute("rpt", report);
		model.addAttribute("category", categoryNo);
		return "manager/detailReport";
	}
	
	@RequestMapping(value="/answerReport.do")
	public String answerReport(int reportNo, String answerTitle, String answerContent, int category, int index) {
		int selNo = 1;
		int result = service.answerReport(reportNo, answerTitle, answerContent);
		int result2 = service.updateReportIs(reportNo, selNo);
		return "redirect:/detailReport.do?reportNo="+reportNo+"&categoryNo="+category+"&reportIndex="+index;
	}
	@RequestMapping(value = "/reportMember.do")
	public String reportMember(int memberNo, int category, int index, int reportNo,int selNo) {
		int result = service.reportMember(memberNo);  //해당 멤버 정지, 리폿카운트 올림
		int result2 = service.deleteArticles(category, index);  //글 없애기
		int selectNum = 1;
		int result3 = service.updateAnsResult(selectNum, reportNo);
		return "redirect:/manaMember.do?reqPage=1&selectNum=0&searchType=memberNo&keyword="+memberNo;
	}
	@RequestMapping(value="/updateAnsResult.do")
	public String updateAnsResult(int selectNum, int reportNo) {
		int result = service.updateAnsResult(selectNum, reportNo);
		return "redirect:/manaReport.do?reqPage=1&selectNum=0";
	}
	
	@RequestMapping(value = "/manaFAQ.do")
	public String manaFAQ(HttpServletRequest request, int reqPage, int selectNum, String searchType, String keyword, Model model) {
		Member member = (Member)request.getSession().getAttribute("member");
		if(member==null) {
					request.setAttribute("msg", "로그인이 필요합니다.");
					request.setAttribute("url", "/");
					return "common/alert";
				}else {
					if(member.getGrade() != 0) {
						request.setAttribute("msg", "관리자가 아닙니다.");
						request.setAttribute("url", "/");
						return "common/alert"; 
					}
				}
		String wherePage = "manaFAQ.do";
		int faqType = 0;
		HashMap<String, Object> fpd = service.PageList(reqPage, selectNum, wherePage, searchType, keyword, faqType);
		model.addAttribute("list", fpd.get("FAQList"));
		model.addAttribute("pageNavi", fpd.get("pageNavi"));
		model.addAttribute("reqPage", reqPage);
		model.addAttribute("selectNum", selectNum);
		return "manager/managementFAQ";
	}
	@RequestMapping(value = "/insertFAQFrm.do")
	public String inorupFAQFrm(HttpServletRequest request) {
		Member member = (Member)request.getSession().getAttribute("member");
		if(member==null) {
					request.setAttribute("msg", "로그인이 필요합니다.");
					request.setAttribute("url", "/");
					return "common/alert";
				}else {
					if(member.getGrade() != 0) {
						request.setAttribute("msg", "관리자가 아닙니다.");
						request.setAttribute("url", "/");
						return "common/alert"; 
					}
				}
		return "manager/insertFAQFrm";
	}
	
	@RequestMapping(value = "/insertFAQ.do")
	public String insertFAQ(HttpServletRequest request, int FAQType, String FAQTitle, String FAQContent) {
		int result = service.insertFAQ(FAQType, FAQTitle, FAQContent);
		return "redirect:/manaFAQ.do?reqPage=1&selectNum=0";
	}
	
	@RequestMapping(value = "/deleteFAQ.do")
	public String deleteFAQ(int FAQNo, int reqPage) {
		int result = service.deleteFAQ(FAQNo);
		return "redirect:/manaFAQ.do?reqPage="+reqPage+"&selectNum=0";
	}
	
	@RequestMapping(value = "/updateFAQFrm.do")
	public String updateFAQFrm(HttpServletRequest request, int FAQNo, Model model) {
		Member member = (Member)request.getSession().getAttribute("member");
		if(member==null) {
					request.setAttribute("msg", "로그인이 필요합니다.");
					request.setAttribute("url", "/");
					return "common/alert";
				}else {
					if(member.getGrade() != 0) {
						request.setAttribute("msg", "관리자가 아닙니다.");
						request.setAttribute("url", "/");
						return "common/alert"; 
					}
				}
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
	public String manaNotice(HttpServletRequest request, int reqPage, String searchType, String keyword, Model model) {
		Member member = (Member)request.getSession().getAttribute("member");
		if(member==null) {
			request.setAttribute("msg", "로그인이 필요합니다.");
			request.setAttribute("url", "/");
			return "common/alert";
		}else {
			if(member.getGrade() != 0) {
				request.setAttribute("msg", "관리자가 아닙니다.");
				request.setAttribute("url", "/");
				return "common/alert"; 
			}
		}
		String wherePage = "manaNotice.do";
		int faqType = 0;
		int selectNum = 0;
		HashMap<String, Object> npd = service.PageList(reqPage, selectNum, wherePage, searchType, keyword, faqType);
		model.addAttribute("list", npd.get("noticeList"));
		model.addAttribute("pageNavi", npd.get("pageNavi"));
		model.addAttribute("reqPage", reqPage);
		model.addAttribute("selectNum", selectNum);
		return "manager/managementNotice";
	}
	@RequestMapping(value = "/insertNoticeFrm.do")
	public String insertNoticeFrm(HttpServletRequest request) {
		Member member = (Member)request.getSession().getAttribute("member");
		if(member==null) {
					request.setAttribute("msg", "로그인이 필요합니다.");
					request.setAttribute("url", "/");
					return "common/alert";
				}else {
					if(member.getGrade() != 0) {
						request.setAttribute("msg", "관리자가 아닙니다.");
						request.setAttribute("url", "/");
						return "common/alert"; 
					}
				}
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
	public String deleteNotice(int noticeNo, int reqPage) {
		int result = service.deletenotice(noticeNo);
		return "redirect:/manaNotice.do?reqPage="+reqPage;
	}
	@RequestMapping(value = "/updateNoticeFrm.do")
	public String updateNoticeFrm(HttpServletRequest request, int noticeNo, Model model) {
		Member member = (Member)request.getSession().getAttribute("member");
		if(member==null) {
					request.setAttribute("msg", "로그인이 필요합니다.");
					request.setAttribute("url", "/");
					return "common/alert";
				}else {
					if(member.getGrade() != 0) {
						request.setAttribute("msg", "관리자가 아닙니다.");
						request.setAttribute("url", "/");
						return "common/alert"; 
					}
				}
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
	public String manaChart(HttpServletRequest request, Model model) {
		Member member = (Member)request.getSession().getAttribute("member");
		if(member==null) {
			request.setAttribute("msg", "로그인이 필요합니다.");
			request.setAttribute("url", "/");
			return "common/alert";
		}else {
			if(member.getGrade() != 0) {
				request.setAttribute("msg", "관리자가 아닙니다.");
				request.setAttribute("url", "/");
				return "common/alert"; 
			}
		}
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
	public String manaAnswer(HttpServletRequest request, int reqPage, int selectNum, String searchType, String keyword, Model model) {
		Member member = (Member)request.getSession().getAttribute("member");
		if(member==null) {
			request.setAttribute("msg", "로그인이 필요합니다.");
			request.setAttribute("url", "/");
			return "common/alert";
		}else {
			if(member.getGrade() != 0) {
				request.setAttribute("msg", "관리자가 아닙니다.");
				request.setAttribute("url", "/");
				return "common/alert"; 
			}
		}
		String wherePage = "manaAnswer.do";
		int faqType = 0;
		HashMap<String, Object> apd = service.PageList(reqPage, selectNum, wherePage, searchType, keyword, faqType);
		model.addAttribute("list", apd.get("answerList"));
		model.addAttribute("pageNavi", apd.get("pageNavi"));
		model.addAttribute("reqPage", reqPage);
		model.addAttribute("selectNum", selectNum);
		return "manager/managementAnswer";
	}
	@RequestMapping(value = "/manaQuestion.do")
	public String manaQuestion(HttpServletRequest request, int reqPage, int selectNum, String searchType, String keyword, Model model) {
		Member member = (Member)request.getSession().getAttribute("member");
		if(member==null) {
			request.setAttribute("msg", "로그인이 필요합니다.");
			request.setAttribute("url", "/");
			return "common/alert";
		}else {
			if(member.getGrade() != 0) {
				request.setAttribute("msg", "관리자가 아닙니다.");
				request.setAttribute("url", "/");
				return "common/alert"; 
			}
		}
		String wherePage = "manaQuestion.do";
		int faqType = 0;
		HashMap<String, Object> qpd = service.PageList(reqPage, selectNum, wherePage, searchType, keyword, faqType);
		model.addAttribute("list", qpd.get("qstList"));
		model.addAttribute("pageNavi", qpd.get("pageNavi"));
		model.addAttribute("reqPage", reqPage);
		model.addAttribute("selectNum", selectNum);
		return "manager/managementQuestion";
	}
	@RequestMapping(value = "/insertAnswerFrm.do")
	public String insertAnswerFrm(HttpServletRequest request, int qstNo, Model model) {
		Member member = (Member)request.getSession().getAttribute("member");
		if(member==null) {
					request.setAttribute("msg", "로그인이 필요합니다.");
					request.setAttribute("url", "/");
					return "common/alert";
				}else {
					if(member.getGrade() != 0) {
						request.setAttribute("msg", "관리자가 아닙니다.");
						request.setAttribute("url", "/");
						return "common/alert"; 
					}
				}
		Question qst = service.selectQst(qstNo);
		if(qst.getAnsState() == 1) {
			Answer ans = service.selectAns(qstNo);
			model.addAttribute("ans", ans);
		}
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
		int faqType = 0;
		HashMap<String, Object> qpd = service.PageList(reqPage, selectNum, wherePage, searchType, keyword, faqType);
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
	public String detailQuestion(HttpServletRequest request, int qstNo, Model model) {
		Question qst = service.selectQst(qstNo);
		Answer ans = service.selectAns(qstNo);
		model.addAttribute("qst", qst);
		model.addAttribute("ans", ans);
		return "mypage/detailQuestion";
	}
	@RequestMapping(value = "/manaExpert.do")
	public String manaExpert(HttpServletRequest request, int reqPage, int selectNum, String searchType, String keyword, Model model) {
		Member member = (Member)request.getSession().getAttribute("member");
		if(member==null) {
			request.setAttribute("msg", "로그인이 필요합니다.");
			request.setAttribute("url", "/");
			return "common/alert";
		}else {
			if(member.getGrade() != 0) {
				request.setAttribute("msg", "관리자가 아닙니다.");
				request.setAttribute("url", "/");
				return "common/alert"; 
			}
		}
		String wherePage = "manaExpert.do";
		int faqType = 0;
		HashMap<String, Object> epd = service.PageList(reqPage, selectNum, wherePage, searchType, keyword, faqType);
		model.addAttribute("list", epd.get("expertList"));
		model.addAttribute("pageNavi", epd.get("pageNavi"));
		model.addAttribute("reqPage", reqPage);
		model.addAttribute("selectNum", selectNum);
		return "manager/managementExpert";
	}
	@RequestMapping(value = "/detailExpert.do")
	public String detailExpert(HttpServletRequest request, int expertNo,int expertApp, Model model) {
		Member member = (Member)request.getSession().getAttribute("member");
		if(member==null) {
					request.setAttribute("msg", "로그인이 필요합니다.");
					request.setAttribute("url", "/");
					return "common/alert";
				}else {
					if(member.getGrade() != 0) {
						request.setAttribute("msg", "관리자가 아닙니다.");
						request.setAttribute("url", "/");
						return "common/alert"; 
					}
				}
		Expert exp = service.selectExpert(expertNo);
		if(expertApp==2) {
			String refuseContent = service.selectRefuseContent(expertNo);
			model.addAttribute("refuseContent", refuseContent);
		}
		model.addAttribute("exp", exp);
		return "manager/detailExpert";
	}
	
	@RequestMapping(value = "/refuseExpert.do")
	public String refuseExpert(int expertNo, String refuseContent ) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("expertNo", expertNo);
		map.put("refuseContent", refuseContent);
		map.put("selectNum", 2);
		int result = service.updateExpertApp(map);
		int result2 = service.insertRefuseExpert(map);
		return "redirect:/manaExpert.do?reqPage=1&selectNum=0";
	}
	@RequestMapping(value = "/updateExpertApp.do")
	public String updateExpertApp(int expertNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("expertNo", expertNo);
		map.put("selectNum", 1);
		int result = service.updateExpertApp(map);
		int result2 = service.updateMemberGrade(expertNo);
		int memberNo = service.selectMemberNo(expertNo);
		if(result > 0) {
			int result3 = service.deleteBeforeExpert(memberNo);
		}
		return "redirect:/manaExpert.do?reqPage=1&selectNum=0";
	}
	@RequestMapping(value ="/appExpertList.do" )
	public String appExpertList(int memberNo, Model model) {
		ArrayList<Expert> myExpertList = service.appExpertList(memberNo);
		model.addAttribute("list", myExpertList);
		return "mypage/appExpertList";
	}
	@RequestMapping(value = "/detailMyExpert.do")
	public String detailMyExpert(int expertNo, Model model){
		Expert exp = service.selectExpert(expertNo);
		RefuseExpert rexp = service.selectMyRefuseExpert(expertNo);
		model.addAttribute("exp", exp);
		model.addAttribute("rexp", rexp);
		return "mypage/detailMyExpert";
	}
	
	@RequestMapping(value = "/noticeList.do")
	public String noticeList(int reqPage, String searchType, String keyword, Model model) {
		String wherePage = "noticeList.do";
		int selectNum = 0;
		int faqType = 0;
		HashMap<String, Object> npd = service.PageList(reqPage, selectNum, wherePage, searchType, keyword , faqType);
		model.addAttribute("list", npd.get("noticeList"));
		model.addAttribute("pageNavi", npd.get("pageNavi"));
		model.addAttribute("reqPage", reqPage);
		model.addAttribute("selectNum", selectNum);
		return "manager/noticeList";
	}
	@RequestMapping(value = "/noticeDetail.do")
	public String noticeDetail(int noticeNo, Model model) {
		Notice notice = service.selectNoticeDetail(noticeNo);
		model.addAttribute("ntc", notice);
		return "manager/noticeDetail";
	}
	
	@RequestMapping(value = "/faqList.do")
	public String faqList(int reqPage, String searchType, String keyword,int faqType, Model model) {
		String wherePage="faqList.do";
		int selectNum = 0;
		HashMap<String, Object> fpd = service.PageList(reqPage, selectNum, wherePage, searchType, keyword, faqType);
		model.addAttribute("list", fpd.get("FAQList"));
		model.addAttribute("pageNavi", fpd.get("pageNavi"));
		model.addAttribute("reqPage", reqPage);
		model.addAttribute("selectNum", selectNum);
		return "manager/faqList";
	}
	@RequestMapping(value = "/faqDetail.do")
	public String faqDetail(int faqNo, Model model) {
		FaQ faq = service.selectFaqDetail(faqNo);
		model.addAttribute("faq", faq);
		return "manager/faqDetail";
	}
	
	//컨트롤러에서 발생하는 모든 에러를 처리하는 방식
	@ExceptionHandler
	public String error1(Exception e) {
		return "common/error";
	}

}

