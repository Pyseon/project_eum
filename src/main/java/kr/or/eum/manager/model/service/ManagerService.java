package kr.or.eum.manager.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.eum.manager.model.dao.ManagerDao;
import kr.or.eum.manager.model.vo.MemberPageData;
import kr.or.eum.member.model.vo.Member;

@Service
public class ManagerService {
	@Autowired
	private ManagerDao dao;
	
	public MemberPageData MemberList(int reqPage) {
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		
		HashMap<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("start", start);
		pageMap.put("end", end);
		ArrayList<Member> memberList = dao.MemberPageData(pageMap);
		
		int totalCount = dao.MemberCount();
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
					pageNavi += "<a class='page-item' href='/manaMember.do?reqPage=1'>";
					pageNavi += "<span class='material-icons'>keyboard_double_arrow_left</span>";
					pageNavi += "</a></li>";
					pageNavi += "<li>";
					pageNavi += "<a class='page-item' href='/manaMember.do?reqPage="+(pageNo-1)+"'>";
					pageNavi += "<span class='material-icons'>chevron_left</span>";
					pageNavi += "</a></li>";
				}
				//페이지 숫자 생성
				for(int i=0;i<pageNaviSize;i++) {
					if(pageNo == reqPage) {
						pageNavi += "<li>";
						pageNavi += "<a class='page-item active-page' href='/manaMember.do?reqPage="+pageNo+"'>";
						pageNavi += pageNo;
						pageNavi += "</a></li>";
					}else {
						pageNavi += "<li>";
						pageNavi += "<a class='page-item' href='/manaMember.do?reqPage="+pageNo+"'>";
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
					pageNavi += "<a class='page-item' href='/memberList.do?reqPage="+pageNo+"'>";
					pageNavi += "<span class='material-icons'>chevron_right</span>";
					pageNavi += "</a></li>";
					pageNavi += "<li>";
					pageNavi += "<a class='page-item' href='/memberList.do?reqPage="+totalPage+"'>";
					pageNavi += "<span class='material-icons'>keyboard_double_arrow_right</span>";
					pageNavi += "</a></li>";
				}
				pageNavi += "</ul>";
				MemberPageData mpd = new MemberPageData(memberList, pageNavi);
				
				return mpd;
	}

	public ArrayList<Member> selectMember(int selectMemberBtn) {
		HashMap<String, Integer> selMemBtn = new HashMap<String, Integer>();
		selMemBtn.put("selectMemberBtn", selectMemberBtn);
		return dao.selectMember(selMemBtn);
	}

	public int updateBlackList(int updateNo, int memberNo) {
		HashMap<String, Integer> ubl = new HashMap<String, Integer>();
		ubl.put("updateNo",updateNo);
		ubl.put("memberNo",memberNo);
		return dao.updateBlackList(ubl);
	}
	
}
