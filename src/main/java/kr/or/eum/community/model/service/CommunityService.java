package kr.or.eum.community.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.eum.community.model.dao.CommunityDao;
import kr.or.eum.community.model.vo.Community;
import kr.or.eum.community.model.vo.CommunityCo;
import kr.or.eum.community.model.vo.CommunityDetailData;
import kr.or.eum.community.model.vo.CommunityPageData;
import kr.or.eum.community.model.vo.Pick;

@Service
@Transactional
public class CommunityService {
	@Autowired
	private CommunityDao dao;

	public CommunityPageData selectCommunityList(int category, int reqPage) {
		// 한 페이지당 보여줄 게시물 수 : 12개
		int numPerPage = 12;
		// 게시물 갯수정의내리고 hashMap으로 쿼리문에 사용할 start, end 값 리턴
		HashMap<String, Object> map = startEnd(category, reqPage, numPerPage);
		ArrayList<Community> list = dao.selectCommunityList(map); // 리스트 불러오기 완료 (12개씩 불러옴)

		// pageNavi 작성
		// 전체게시물 수 알야야 페이지수를 알 수 있음 >> db에서 전체 게시물수 조회해오기
		int totalCount = dao.selectCommunityCount(map); // 전체게시물수 완료
		
		// 링크할 uri 정보
		String uriData = "communityList";
		// 페이징 처리
		String pageNavi = pageNavi(totalCount, category, reqPage, numPerPage, uriData);

		CommunityPageData cpd = new CommunityPageData(list, pageNavi);
		return cpd;
	}
//>>>>>>>>>> 읽기
	//0번 카테고리 커뮤니티글내용 + 댓글리스트
	public CommunityDetailData communityDetail0(int commNo) {
		Community comm = dao.communityDetail(commNo);
		// 댓글 불러옴 (대댓글 포함)
		ArrayList<CommunityCo> cmntList = dao.selectCmntList(commNo);
		
		
		if (comm != null) {
			dao.readCountUp(commNo);
		}
		CommunityDetailData cdd = new CommunityDetailData();
		cdd.setComm(comm);
		cdd.setCmntList(cmntList);
		
		return cdd;
	}
	
	//1번 카테고리 커뮤니티글내용 + 픽 리스트
	public CommunityDetailData communityDetail1(int commNo) {
		Community comm = dao.communityDetail(commNo);
		// 댓글 불러옴 (대댓글 포함)
		ArrayList<Pick> pickList = dao.selectPickList(commNo);
		if (comm != null) {
			dao.readCountUp(commNo);
		}
		CommunityDetailData cdd = new CommunityDetailData();
		cdd.setComm(comm);
		cdd.setPickList(pickList);
		return cdd;
	}
	
	
	//댓글없이 내용만 가져오기
	public Community communityDetailNotCmnt(int commNo) {
		return dao.communityDetail(commNo);
	}
	
	//댓글번호로 댓글 하나 불러오기
	public CommunityCo commCoDetail(int cmntNo) {
		return dao.commCoDetail(cmntNo);
	}
	
//>>>>>>>>>> 쓰기
	public int communityWrite(Community comm) {
		Community community = setToken(comm);
		return dao.communityWrite(community);
	}

	public void commCoWrite(CommunityCo commCo) {
		dao.commCoWrite(commCo);
	}
	
	public void pickWrite(Pick pick) {
		dao.pickWrite(pick);
	}
	

//>>>>>>>>>> 수정
	public void communityUpdate(Community comm) {
		Community community = setToken(comm);
		dao.communityUpdate(community);
	}
	
	public void commCoUpdate(CommunityCo commCo) {
		dao.commCoUpdate(commCo);
	}
	
	public void pickUpdate(Pick pick) {
		dao.pickUpdate(pick);
	}
	
//>>>>>>>>>> 삭제
	public void communityDelete(int commNo) {
		dao.communityDelete(commNo);
	}
	
	public void commCoDelete(int cmntNo, int commNo) {
		//게시글번호와 댓글번호를 commGroup으로 조회해서 카운팅숫자가 1이면 단독댓글
		//1보다 크면 대댓글이 있으므로 삭제하지말고 수정으로 바꿈
		//cmntNo 는 댓글번호 이므로 cmntGroup에 들어가는데 
		//댓글인경우 cmntNo=cmntGroup이고 / 대댓글이면 원댓글의 cmntNo=cmntGroup이므로 대댓글이 있으면 무조건 2이상 나옴
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("commNo", commNo);
		map.put("cmntGroup", cmntNo);
		int result = dao.commentCount(map);
		
		//대댓글이 있는 댓글은 삭제시 댓글을 삭제하지않고 내용만 업데이트 해준다
		
		if(result > 1) { //대댓글이 있는경우
			CommunityCo commCo = new CommunityCo();
			String delCommentMsg = "[사용자가 삭제한 댓글 입니다.]";
			commCo.setCmntNo(cmntNo);
			commCo.setCmntContent(delCommentMsg);
			dao.commCoUpdate(commCo);
		}else {
			dao.commCoDelete(cmntNo);
		}
	}
	
	public void pickDel(int pickNo) {
		dao.pickDel(pickNo);
	}

	

	
	
/////////////////////////////   장점,단점 처리 함수      //////////////////////////////	
	public Community setToken(Community comm) {
	
		//장점 토큰 , 으로된거 짤라서 붙임
		String advantage = comm.getAdvantage();
		List<String> advList = new ArrayList<String>();
			
		String []tokens=advantage.split("\\|");
			
		for(int i=0;i<tokens.length;i++){
			if(tokens[i] == null || tokens[i].trim().length() < 2) { // null or 빈칸일때
			}else { //문자가 정석으로 있을때
				if(tokens[i].indexOf(",") == 0) { //첫번째글자에 쉼표가 있을경우
					advList.add(tokens[i].replaceFirst(",", "")); //첫번째 쉼표는 빈칸으로 변환
				}else {
					advList.add(tokens[i].trim()); //문자 앞뒤로 빈칸만 삭제 (문자열 중간 빈칸은 삭제 안함)
				}
			}
		}
		
		advantage = "";
		
		for(int i=0;i<advList.size();i++){
			advantage += advList.get(i)+"|";
		}
		
		
		
		//단점토큰 , 으로된거 짤라서 붙임
		String weakness = comm.getWeakness();
		List<String> weakList = new ArrayList<String>();
			
		String []tokens2=weakness.split("\\|");
			
		for(int i=0;i<tokens2.length;i++){
			if(tokens2[i] == null || tokens2[i].trim().length() < 2) { // null or 빈칸일때
			}else { //문자가 정석으로 있을때
				if(tokens2[i].indexOf(",") == 0) { //첫번째글자에 쉼표가 있을경우
					weakList.add(tokens2[i].replaceFirst(",", "")); //첫번째 쉼표는 빈칸으로 변환
				}else {
					weakList.add(tokens2[i].trim()); //문자 앞뒤로 빈칸만 삭제 (문자열 중간 빈칸은 삭제 안함)
				}
			}
		}
		
		weakness = "";
		
		for(int i=0;i<weakList.size();i++){
			weakness += weakList.get(i)+"|";
		}
		System.out.println("최종값>>"+advantage);
		System.out.println("최종값>>"+weakness);
		
		comm.setAdvantage(advantage);
		comm.setWeakness(weakness);
		
		return comm;
	}
	
	
	

/////////////////////////////   페이징처리 함수      //////////////////////////////
	public HashMap<String, Object> startEnd(int category, int reqPage, int numPerPage) {
		// reqPage 1 >> 1~ 16, reqPage 2 >> 17~32
		// 해당페이지 마지막 게시물 번호
		int end = reqPage * numPerPage;
		// 해당페이지 첫번째 게시물 번호
		int start = end - numPerPage + 1;

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("start", start);
		map.put("end", end);

		return map;
	}

	public String pageNavi(int totalCount, int category, int reqPage, int numPerPage, String uriData) {

		// 전체 게시물수로 전체페이지 수 계산
		int totalPage = 0;
		if (totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}
		// 페이지 내비 길이
		int pageNaviSize = 5;
		// 페이지 내비 시작번호

		/*
		 * 이렇게하면 12345 > 4클릭시 23456 이렇게 나옴 int pageNo = 1; if(reqPage > 3) { //3보다 작으면
		 * -값이 나올 수 있음. pageNo = reqPage - 2; }
		 */
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1; // 12345 > 4클릭해도 12345

		// pageNavi 생성시작
		String pageNavi = "<ul class='pagination'>";
		// 이전버튼
		if (pageNo != 1) { // pageNo-1 :이전버튼 누르면 그룹변경 / reqPage-1 : 이전버튼 누르면 전페이지로 이동
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/" + uriData + ".do?menu=yes&category=" + category + "&reqPage=1'>";
			pageNavi += "<span class='material-icons'>keyboard_double_arrow_left</span>";
			pageNavi += "</a></li>";
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/" + uriData + ".do?menu=yes&category=" + category + "&reqPage="
					+ (pageNo - 1) + "'>";
			pageNavi += "<span class='material-icons'>chevron_left</span>";
			pageNavi += "</a></li>";
		}
		// 페이지 숫자 생성
		for (int i = 0; i < pageNaviSize; i++) {
			if (pageNo == reqPage) {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item active-page' href='/" + uriData + ".do?menu=yes&category=" + category
						+ "&reqPage=" + pageNo + "'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			} else {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item' href='/" + uriData + ".do?menu=yes&category=" + category + "&reqPage="
						+ pageNo + "'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}
		// 다음버튼
		if (pageNo <= totalPage) {
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/" + uriData + ".do?menu=yes&category=" + category + "&reqPage="
					+ pageNo + "'>";
			pageNavi += "<span class='material-icons'>chevron_right</span>";
			pageNavi += "</a></li>";
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/" + uriData + ".do?menu=yes&category=" + category + "&reqPage="
					+ totalPage + "'>";
			pageNavi += "<span class='material-icons'>keyboard_double_arrow_right</span>";
			pageNavi += "</a></li>";
		}
		pageNavi += "</ul>";

		return pageNavi;
	}











}
