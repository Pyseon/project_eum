package kr.or.eum.manager.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.eum.manager.model.dao.ManagerDao;
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
import kr.or.eum.product.model.vo.Review;
import kr.or.eum.report.model.vo.AnswerReport;
import kr.or.eum.report.model.vo.Report;

@Service
public class ManagerService {
	@Autowired
	private ManagerDao dao;
	
	public HashMap<String, Object> PageList(int reqPage, int selectNum, String wherePage,String searchType, String keyword, int faqType) {
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		
		HashMap<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("start", start);
		pageMap.put("end", end);
		pageMap.put("selectNum", selectNum);
		pageMap.put("faqType", faqType);
		
		HashMap<String, Object> pageData = new HashMap<String, Object>();
		int totalCount = 0;
		switch(wherePage) {
		case "manaMember.do":
			ArrayList<Member> memberList = new ArrayList<Member>();
			if(searchType == null) {
				memberList = dao.MemberPageData(pageMap);
				totalCount = dao.MemberCount(selectNum);
			}else {
				pageMap.put("searchType", searchType);
				pageMap.put("keyword", keyword);
				memberList = dao.searchMemberPageData(pageMap);
				totalCount = dao.searchMemberCount(pageMap);
			}
			pageData.put("memberList", memberList);
			break;
		case "manaPayment.do":
			ArrayList<Payment> paymentList = new ArrayList<Payment>();
			if(searchType == null) {
				paymentList = dao.PaymentPageData(pageMap);
				totalCount = dao.PaymentCount(selectNum);
			}else {
				pageMap.put("searchType", searchType);
				pageMap.put("keyword", keyword);
				paymentList = dao.searchPaymentPageData(pageMap);
				totalCount = dao.searchPaymentCount(pageMap);
			}
			pageData.put("paymentList", paymentList);
			break;
		case "manaReport.do":
			ArrayList<Report> reportList = new ArrayList<Report>();
			if(searchType == null) {
				reportList = dao.ReportPageData(pageMap);
				totalCount = dao.ReportCount();
			}else {
				pageMap.put("searchType", searchType);
				pageMap.put("keyword", keyword);
				reportList = dao.searchReportPageData(pageMap);
				totalCount = dao.searchReportCount(pageMap);
			}
			pageData.put("reportList", reportList);
			break;
		case "manaFAQ.do":
			ArrayList<FaQ> FAQList = new ArrayList<FaQ>();
			if(searchType == null) {
				FAQList = dao.FAQPageData(pageMap);
				totalCount = dao.FAQCount(selectNum);
			}else {
				pageMap.put("searchType", searchType);
				pageMap.put("keyword", keyword);
				FAQList = dao.searchFAQPageData(pageMap);
				totalCount = dao.searchFAQCount(pageMap);
			}
			pageData.put("FAQList", FAQList);
			break;
		case "manaNotice.do":
			ArrayList<Notice> noticeList = new ArrayList<Notice>();
			if(searchType == null) {
				noticeList = dao.noticePageData(pageMap);
				totalCount = dao.noticeCount();
			}else {
				pageMap.put("searchType", searchType);
				pageMap.put("keyword", keyword);
				noticeList = dao.searchNoticePageData(pageMap);
				totalCount = dao.searchNoticeCount(pageMap);
			}
			pageData.put("noticeList", noticeList);
			break;
		case "noticeList.do":
			ArrayList<Notice> noticeList2 = new ArrayList<Notice>();
			if(searchType == null) {
				noticeList2 = dao.noticePageData(pageMap);
				totalCount = dao.noticeCount();
			}else {
				pageMap.put("searchType", searchType);
				pageMap.put("keyword", keyword);
				noticeList2 = dao.searchNoticePageData(pageMap);
				totalCount = dao.searchNoticeCount(pageMap);
			}
			pageData.put("noticeList", noticeList2);
			break;
		case "manaAnswer.do":
			ArrayList<Answer> answerList = new ArrayList<Answer>();
			answerList = dao.answerPageData(pageMap);
			totalCount = dao.answerCount(pageMap);
			pageData.put("answerList", answerList);
			break;
		case "manaQuestion.do":
			ArrayList<Question> qst = new ArrayList<Question>();
			qst = dao.qstPageData(pageMap);
			totalCount = dao.qstCount(pageMap);
			pageData.put("qstList", qst);
			break;
		case "myQuestionList.do":
			ArrayList<Question> qstList = new ArrayList<Question>();
			pageMap.put("memberNo", keyword);
			qstList = dao.myQstPageData(pageMap);
			totalCount = dao.myQstCount(pageMap);
			pageData.put("qstList", qstList);
			break;
		case "manaExpert.do":
			ArrayList<Expert> expertList = new ArrayList<Expert>();
			if(searchType == null) {
				expertList = dao.expertPageData(pageMap);
				totalCount = dao.expertCount(pageMap);
			}else {
				pageMap.put("searchType", searchType);
				pageMap.put("keyword", keyword);
				expertList = dao.searchExpertPageData(pageMap);
				totalCount = dao.searchExpertCount(pageMap);
			}
			pageData.put("expertList", expertList);
			break;
		case "faqList.do":
			ArrayList<FaQ> FAQList2 = new ArrayList<FaQ>();
			if(searchType == null) {
				FAQList2 = dao.FAQPageData(pageMap);
				totalCount = dao.FAQCount(selectNum);
			}else {
				pageMap.put("searchType", searchType);
				pageMap.put("keyword", keyword);
				FAQList2 = dao.searchFAQPageData(pageMap);
				totalCount = dao.searchFAQCount(pageMap);
			}
			pageData.put("FAQList", FAQList2);
			break;
		}
		
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
		
		//pageNavi 생성시작
		String pageNavi = "<ul class='pagination'>";
		//이전버튼
		if(pageNo != 1) { 	//pageNo-1 :이전버튼 누르면 그룹변경 / reqPage-1 : 이전버튼 누르면 전페이지로 이동 
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/"+wherePage+"?reqPage=1&selectNum="+selectNum+"'>";
			pageNavi += "<span class='material-icons'>keyboard_double_arrow_left</span>";
			pageNavi += "</a></li>";
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/"+wherePage+"?reqPage="+(pageNo-1)+"&selectNum="+selectNum+"'>";
			pageNavi += "<span class='material-icons'>chevron_left</span>";
			pageNavi += "</a></li>";
		}
		//페이지 숫자 생성
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item active-page' href='/"+wherePage+"?reqPage="+pageNo+"&selectNum="+selectNum+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}else {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item' href='/"+wherePage+"?reqPage="+pageNo+"&selectNum="+selectNum+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		//다음버튼
		if(pageNo <= totalPage) {
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/"+wherePage+"?reqPage="+pageNo+"&selectNum="+selectNum+"'>";
			pageNavi += "<span class='material-icons'>chevron_right</span>";
			pageNavi += "</a></li>";
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/"+wherePage+"?reqPage="+totalPage+"&selectNum="+selectNum+"'>";
			pageNavi += "<span class='material-icons'>keyboard_double_arrow_right</span>";
			pageNavi += "</a></li>";
		}
		pageNavi += "</ul>";
		
		pageData.put("pageNavi", pageNavi);
		return pageData;
	}
	
	public int updateBlackList(int updateNo, int memberNo) {
		HashMap<String, Integer> ubl = new HashMap<String, Integer>();
		ubl.put("updateNo",updateNo);
		ubl.put("memberNo",memberNo);
		return dao.updateBlackList(ubl);
	}

	public ArrayList<Member> searchOneMember(String searchType, String keyword) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		return dao.searchOneMember(map);
	}

	public int updatePayState(int updateNo, int payNo) {
		HashMap<String, Integer> ups = new HashMap<String, Integer>();
		ups.put("updateNo",updateNo);
		ups.put("payNo",payNo);
		return dao.updatePayState(ups);
	}

	public Payment detailPayment(int payNo) {
		Payment payment = dao.detailPayment(payNo);
		if(payment.getMemberNo()>0) {
			String memberId = dao.selectMemberId(payNo);
			payment.setMemberId(memberId);
		}
		return payment;
	}

	public Report detailReport(int reportNo) {
		return dao.detailReport(reportNo);
	}
	
	public int reportMember(int memberNo) {
		return dao.reportMember(memberNo);
	}

	public int deleteArticles(int category, int index) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("category", category);
		map.put("index", index);
		return dao.deleteArticles(map);
	}

	public int updateReportIs(int reportNo, int selNo) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("reportNo", reportNo);
		map.put("selNo", selNo);
		return dao.updateReportIs(map);
	}
	
	public int answerReport(int reportNo, String answerTitle, String answerContent) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("answerTitle", answerTitle);
		map.put("reportNo", reportNo);
		map.put("answerContent", answerContent);
		return dao.answerReport(map);
	}

	public int insertFAQ(int FAQType, String FAQTitle, String FAQContent) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("FAQType", FAQType);
		map.put("FAQTitle", FAQTitle);
		map.put("FAQContent", FAQContent);
		return dao.insertFAQ(map);
	}

	public int deleteFAQ(int FAQNo) {
		return dao.deleteFAQ(FAQNo);
	}

	public ArrayList<FaQ> selectFAQ(int FAQNo) {
		return dao.selectFAQ(FAQNo);
	}

	public int updateFAQ(int FAQNo, int FAQType, String FAQTitle, String FAQContent) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("FAQNo", FAQNo);
		map.put("FAQType", FAQType);
		map.put("FAQTitle", FAQTitle);
		map.put("FAQContent", FAQContent);
		return dao.updateFAQ(map);
	}

	public int deletenotice(int noticeNo) {
		return dao.deleteNotice(noticeNo);
	}

	public ArrayList<Notice> selectNotice(int noticeNo) {
		return dao.selectNotice(noticeNo);
	}

	public int insertNotice(HashMap<String, Object> notice) {
		return dao.insertNotice(notice);
	}

	public int updateNotice(int noticeNo, String noticeTitle, String noticeContent) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("noticeNo", noticeNo);
		map.put("noticeTitle", noticeTitle);
		map.put("noticeContent", noticeContent);
		return dao.updateNotice(map);
	}

	public Chart selectChart() {
		return dao.selectChart();
	}

	public MemberChart selectMemberChart(String year) {
		return dao.selectMemberChart(year);
	}

	public ArrayList<SalesChart> selectSalesTypeChart(String year, int salesType) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("year", year);
		map.put("salesType", salesType);
		ArrayList<SalesChart> salesCharts = new ArrayList<SalesChart>();
		if(salesType == 1) {
			map.put("productType", 1);
			salesCharts.add(dao.selectSalesChart(map));
			map.put("productType", 2);
			salesCharts.add(dao.selectSalesChart(map));
			map.put("productType", 3);
			salesCharts.add(dao.selectSalesChart(map));
		}
		if(salesType == 2) {
			map.put("productCategory", "법률");
			salesCharts.add(dao.selectSalesChart(map));
			map.put("productCategory", "비즈니스");
			salesCharts.add(dao.selectSalesChart(map));
			map.put("productCategory", "심리/헬스");
			salesCharts.add(dao.selectSalesChart(map));
			map.put("productCategory", "학습");
			salesCharts.add(dao.selectSalesChart(map));
			map.put("productCategory", "금융");
			salesCharts.add(dao.selectSalesChart(map));
			map.put("productCategory", "라이프");
			salesCharts.add(dao.selectSalesChart(map));
			map.put("productCategory", "취미");
			salesCharts.add(dao.selectSalesChart(map));
			map.put("productCategory", "어학");
			salesCharts.add(dao.selectSalesChart(map));
			map.put("productCategory", "레저");
			salesCharts.add(dao.selectSalesChart(map));
			map.put("productCategory", "IT/테크");
			salesCharts.add(dao.selectSalesChart(map));
			map.put("productCategory", "자기계발");
			salesCharts.add(dao.selectSalesChart(map));
		}else {
			salesCharts.add(dao.selectSalesChart(map));	
		}
		return salesCharts;
	}

	public Question selectQst(int qstNo) {
		return dao.selectQst(qstNo);
	}

	public int insertAnswer(HashMap<String, Object> answer) {
		return dao.insertAnswer(answer);
	}

	public int updateAnsState(int qstNo) {
		return dao.updateAnsState(qstNo);
	}

	public int insertQuestion(HashMap<String, Object> qst) {
		return dao.insertQuestion(qst);
	}

	public Answer selectAns(int qstNo) {
		return dao.selectAns(qstNo);
	}

	public Expert selectExpert(int expertNo) {
		return dao.selectExpert(expertNo);
	}

	public int updateExpertApp(HashMap<String, Object> map) {
		return dao.updateExpertApp(map);
	}

	public int insertRefuseExpert(HashMap<String, Object> map) {
		return dao.insertRefuseExpert(map);
	}
	
	public String selectRefuseContent(int expertNo) {
		return dao.selectRefuseContnet(expertNo);
	}

	public int updateMemberGrade(int expertNo) {
		return dao.updateMemberGrade(expertNo);
	}

	public AnswerReport selectAnsrpt(int reportNo) {
		return dao.selectAnsrpt(reportNo);
	}

	public int updateAnsResult(int selectNum, int reportNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("selectNum", selectNum);
		map.put("reportNo", reportNo);
		return dao.updateAnsResult(map);
	}

	public int selectCommCategoryNum(int reportIndex) {
		return dao.selectCommCategoryNum(reportIndex);
	}

	public HashMap<String, Object> selectProductReview(int reportIndex) {
		Review productReview = dao.selectProductReview(reportIndex);
		HashMap<String, Object> reportReview = new HashMap<String, Object>();
		reportReview.put("reviewTitle", productReview.getReviewTitle());
		reportReview.put("reviewContent", productReview.getReviewContent());
		return reportReview;
	}

	public String selectCmntContent(int reportIndex) {
		return dao.selectCmntContent(reportIndex);
	}

	public int scoutReport(int categoryNo, int reportIndex) {
		HashMap<String, Object> scout = new HashMap<String, Object>();
		scout.put("category", categoryNo);
		scout.put("reportIndex", reportIndex);
		return dao.scoutReport(scout);
	}

	public ArrayList<Expert> appExpertList(int memberNo) {
		return dao.selectExpertApp(memberNo);
	}

	public RefuseExpert selectMyRefuseExpert(int expertNo) {
		return dao.selectMyRefuseExpert(expertNo);
	}

	public int deleteBeforeExpert(int memberNo) {
		return dao.deleteBeforeExpert(memberNo);
	}

	public int selectMemberNo(int expertNo) {
		return dao.selectMemberNo(expertNo);
	}

	public Notice selectNoticeDetail(int noticeNo) {
		return dao.selectNoticeDetail(noticeNo);
	}

	public FaQ selectFaqDetail(int faqNo) {
		return dao.selectFaqDetail(faqNo);
	}

	
	
}

