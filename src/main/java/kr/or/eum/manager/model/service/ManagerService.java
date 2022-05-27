package kr.or.eum.manager.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.eum.manager.model.dao.ManagerDao;
import kr.or.eum.manager.model.vo.MemberPageData;
import kr.or.eum.manager.model.vo.PaymentPageData;
import kr.or.eum.member.model.vo.Member;
import kr.or.eum.product.model.vo.Payment;

@Service
public class ManagerService {
	@Autowired
	private ManagerDao dao;
	
	public MemberPageData MemberList(int reqPage, int selMem, String searchType, String keyword) {
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		
		HashMap<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("start", start);
		pageMap.put("end", end);
		pageMap.put("selMem", selMem);
		ArrayList<Member> memberList = new ArrayList<Member>();
		int totalCount = 0;
		if(searchType == null) {
			memberList = dao.MemberPageData(pageMap);
			totalCount = dao.MemberCount(selMem);
		}else {
			pageMap.put("searchType", searchType);
			pageMap.put("keyword", keyword);
			memberList = dao.searchMemberPageData(pageMap);
			totalCount = dao.searchMemberCount(pageMap);
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
					pageNavi += "<a class='page-item' href='/manaMember.do?reqPage=1&selMem="+selMem+"'>";
					pageNavi += "<span class='material-icons'>keyboard_double_arrow_left</span>";
					pageNavi += "</a></li>";
					pageNavi += "<li>";
					pageNavi += "<a class='page-item' href='/manaMember.do?reqPage="+(pageNo-1)+"&selMem="+selMem+"'>";
					pageNavi += "<span class='material-icons'>chevron_left</span>";
					pageNavi += "</a></li>";
				}
				//페이지 숫자 생성
				for(int i=0;i<pageNaviSize;i++) {
					if(pageNo == reqPage) {
						pageNavi += "<li>";
						pageNavi += "<a class='page-item active-page' href='/manaMember.do?reqPage="+pageNo+"&selMem="+selMem+"'>";
						pageNavi += pageNo;
						pageNavi += "</a></li>";
					}else {
						pageNavi += "<li>";
						pageNavi += "<a class='page-item' href='/manaMember.do?reqPage="+pageNo+"&selMem="+selMem+"'>";
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
					pageNavi += "<a class='page-item' href='/manaMember.do?reqPage="+pageNo+"&selMem="+selMem+"'>";
					pageNavi += "<span class='material-icons'>chevron_right</span>";
					pageNavi += "</a></li>";
					pageNavi += "<li>";
					pageNavi += "<a class='page-item' href='/manaMember.do?reqPage="+totalPage+"&selMem="+selMem+"'>";
					pageNavi += "<span class='material-icons'>keyboard_double_arrow_right</span>";
					pageNavi += "</a></li>";
				}
				pageNavi += "</ul>";
				MemberPageData mpd = new MemberPageData(memberList, pageNavi);
				
				return mpd;
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

	public PaymentPageData paymentList(int reqPage, int payState, String searchType, String keyword) {
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		
		HashMap<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("start", start);
		pageMap.put("end", end);
		pageMap.put("payState", payState);
		ArrayList<Payment> paymentList = new ArrayList<Payment>();
		int totalCount = 0;
		if(searchType == null) {
			paymentList = dao.PaymentPageData(pageMap);
			totalCount = dao.PaymentCount(payState);
		}else {
			pageMap.put("searchType", searchType);
			pageMap.put("keyword", keyword);
			paymentList = dao.searchPaymentPageData(pageMap);
			totalCount = dao.searchPaymentCount(pageMap);
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
					pageNavi += "<a class='page-item' href='/manaPayment.do?reqPage=1&payState="+payState+"'>";
					pageNavi += "<span class='material-icons'>keyboard_double_arrow_left</span>";
					pageNavi += "</a></li>";
					pageNavi += "<li>";
					pageNavi += "<a class='page-item' href='/manaPayment.do?reqPage="+(pageNo-1)+"&payState="+payState+"'>";
					pageNavi += "<span class='material-icons'>chevron_left</span>";
					pageNavi += "</a></li>";
				}
				//페이지 숫자 생성
				for(int i=0;i<pageNaviSize;i++) {
					if(pageNo == reqPage) {
						pageNavi += "<li>";
						pageNavi += "<a class='page-item active-page' href='/manaPayment.do?reqPage="+pageNo+"&payState="+payState+"'>";
						pageNavi += pageNo;
						pageNavi += "</a></li>";
					}else {
						pageNavi += "<li>";
						pageNavi += "<a class='page-item' href='/manaPayment.do?reqPage="+pageNo+"&payState="+payState+"'>";
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
					pageNavi += "<a class='page-item' href='/manaPayment.do?reqPage="+pageNo+"&payState="+payState+"'>";
					pageNavi += "<span class='material-icons'>chevron_right</span>";
					pageNavi += "</a></li>";
					pageNavi += "<li>";
					pageNavi += "<a class='page-item' href='/manaPayment.do?reqPage="+totalPage+"&payState="+payState+"'>";
					pageNavi += "<span class='material-icons'>keyboard_double_arrow_right</span>";
					pageNavi += "</a></li>";
				}
				pageNavi += "</ul>";
				PaymentPageData ppd = new PaymentPageData(paymentList, pageNavi);
				
				return ppd;
	}

	public int updatePayState(int updateNo, int payNo) {
		HashMap<String, Integer> ups = new HashMap<String, Integer>();
		ups.put("updateNo",updateNo);
		ups.put("payNo",payNo);
		return dao.updatePayState(ups);
	}
	
}

