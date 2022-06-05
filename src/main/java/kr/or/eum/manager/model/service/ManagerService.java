package kr.or.eum.manager.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.eum.manager.model.dao.ManagerDao;
import kr.or.eum.manager.model.vo.FaQ;
import kr.or.eum.manager.model.vo.Notice;
import kr.or.eum.member.model.vo.Member;
import kr.or.eum.product.model.vo.Payment;
import kr.or.eum.report.model.vo.Report;

@Service
public class ManagerService {
	@Autowired
	private ManagerDao dao;
	
	public HashMap<String, Object> PageList(int reqPage, int selectNum, String wherePage,String searchType, String keyword) {
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		
		HashMap<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("start", start);
		pageMap.put("end", end);
		pageMap.put("selectNum", selectNum);
		
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

	public ArrayList<Payment> detailPayment(int payNo) {
		return dao.detailPayment(payNo);
	}

	public ArrayList<Report> detailReport(int reportNo) {
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
		map.put("reportNo", selNo);
		map.put("selNo", selNo);
		return dao.updateReportIs(map);
	}
	
	public int answerReport(String answerTitle, String answerContent) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("answerTitle", answerTitle);
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
	
	
}

