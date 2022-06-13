package kr.or.eum.request.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.eum.member.model.vo.Expert;
import kr.or.eum.member.model.vo.Member;
import kr.or.eum.product.model.vo.Product;
import kr.or.eum.request.model.dao.RequestDao;
import kr.or.eum.request.model.vo.Request;
import kr.or.eum.request.model.vo.RequestAsk;
import kr.or.eum.request.model.vo.RequestAskPageData;
import kr.or.eum.request.model.vo.RequestDetailData;
import kr.or.eum.request.model.vo.RequestPageData;

@Service
@Transactional
public class RequestService {
	@Autowired
	private RequestDao dao;

	public int requestWrite(Request req) {
		// TODO Auto-generated method stub
		Request request=setToken(req);
		int result = dao.requestWrite(request);
		return result;
	}


	private Request setToken(Request req) {
		String reqTag = req.getReqTag();
		List<String> tagList = new ArrayList<String>();
		String []tokens=reqTag.split("\\|");
		for(int i=0;i<tokens.length;i++){
			if(tokens[i] == null || tokens[i].trim().length() < 2) {
			}else {
				if(tokens[i].indexOf(",") == 0) {
					tagList.add(tokens[i].replaceFirst(",", ""));
				}else {
					tagList.add(tokens[i].trim());
				}
			}
		}
		reqTag = "";
		for(int i=0;i<tagList.size();i++){
			reqTag += "#"+tagList.get(i)+" ";
		}
		
		System.out.println("태그값>>"+reqTag);
		req.setReqTag(reqTag);
		return req;
	}

	public RequestPageData selectRequestList(int reqPage, String selReq) {
		int numPerPage = 12;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("selReq", selReq);
		
		int totalCount = dao.selectRequestCount(map);
		ArrayList<Request> list = dao.selectRequestList(map);
		
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage + 1;
		}
		int pageNaviSize = 5;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		
		
		String pageNavi = "<ul class='pagination'>";
		if(pageNo != 1) { 
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/requestList.do?reqPage="+(pageNo-1)+"&selReq="+selReq+"'>";
			pageNavi += "<span class='material-icons'>chevron_left</span>";
			pageNavi += "</a></li>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item active-page' href='/requestList.do?reqPage="+pageNo+"&selReq="+selReq+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}else {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item' href='/requestList.do?reqPage="+pageNo+"&selReq="+selReq+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}if(pageNo <= totalPage) {
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/requestList.do?reqPage="+pageNo+"&selReq="+selReq+"'>";
			pageNavi += "<span class='material-icons'>chevron_right</span>";
			pageNavi += "</a></li>";
			
		}pageNavi += "</ul>";
		RequestPageData rpd = new RequestPageData(list, pageNavi);
					 
		return rpd;
	}
	
public RequestDetailData selectOneRequest(int reqNo, Member member) {
	Request req = dao.selectOneRequest(reqNo);
	
	ArrayList<RequestAsk> reqaskList = dao.selectReqaskList(reqNo);
	
	
	String[] tag = req.getReqTag().split("/");
	HashMap<String, Object> map = new HashMap<String, Object>();
	map.put("reqNo", reqNo);
	
	
	if(member != null) {
		map.put("memberNo", member.getMemberNo());			
	}else {
		map.put("memberNo", 0);
	}
	
	RequestDetailData rdd = new RequestDetailData(req, tag, reqaskList);
	return rdd;
	
}

public RequestAskPageData selectReqAskExpList(int reqNo) {
	ArrayList<RequestAsk> list = dao.selectReqAskExpList(reqNo);
	HashMap<String, Object> map = new HashMap<String, Object>();
	map.put("reqNo", reqNo);
	
	RequestAskPageData rapd = new RequestAskPageData(list);
	return rapd;
	
	
}


public int insertReqask(int reqNo, int expertNo) {
	HashMap<String, Object> map = new HashMap<String, Object>();
	map.put("reqNo", reqNo);
	map.put("expertNo", expertNo);
	
	return dao.insertReqask(map);
}


public Expert selectExpertNo(int memberNo) {
	return dao.selectExpertNo(memberNo);
}
/*
public RequestAskPageData selectReqAskExpList() {
	HashMap<String, Object> map = new HashMap<String, Object>();
	ArrayList<RequestAsk> list = dao.selectReqAskExpList(map);
	RequestAskPageData rapd = new RequestAskPageData(list);
	return rapd;
}
*/


public int updateSelectExpert(int reqNo) {
	return dao.updateSelectExpert(reqNo);
}


public int deleteUnselectExpert(int reqNo, int expertNo) {
	HashMap<String, Object> map = new HashMap<String, Object>();
	map.put("reqNo", reqNo);
	map.put("expertNo", expertNo);
	return dao.deleteUnselectExpert(map);
}


public int selectExpert(int reqNo) {
	// TODO Auto-generated method stub
	return dao.selectExpert(reqNo);
}

/*

	public Request selectOneRequest(int memberNo) {
		// TODO Auto-generated method stub
		Request req = dao.selectOneRequest(memberNo);
		String[] Tag = req.getReqTag().split("/");
		return req;
	}
*/



}
