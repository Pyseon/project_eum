package kr.or.eum.request.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.eum.member.model.vo.Expert;
import kr.or.eum.member.model.vo.Member;
import kr.or.eum.product.model.vo.Product;
import kr.or.eum.request.model.vo.Request;
import kr.or.eum.request.model.vo.RequestAsk;

@Repository
public class RequestDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int requestWrite(Request req) {
		// TODO Auto-generated method stub
		int result = sqlSession.insert("request.requestWrite", req);
		return result;
	}

	public int selectRequestCount(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		int totalCount = sqlSession.selectOne("request.selectTotalCount", map);
		return totalCount;
	}

	public ArrayList<Request> selectRequestList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("request.selectRequestList", map);
		return (ArrayList<Request>)list;
	}
	
	public Request selectOneRequest(int memberNo) {
		Request request = sqlSession.selectOne("request.selectOneRequest",memberNo);
		return request;
	}

	public Request requestDetail(int reqNo) {
		// TODO Auto-generated method stub
		Request req = sqlSession.selectOne("request.requestDetail", reqNo);
		return req;
	}
	
	public ArrayList<RequestAsk> selectReqaskList(int reqNo){
		List reqaskList = sqlSession.selectList("request.selectReqAskList", reqNo);
		return (ArrayList<RequestAsk>)reqaskList;
	}

	public int insertReqask(HashMap<String, Object> map) {
		int result = sqlSession.insert("request.insertReqAsk", map);
		return result;
	}

	public Expert selectExpertNo(int memberNo) {
		Expert expert = sqlSession.selectOne("product.selectExpertNo", memberNo);
		return expert;
	}
	
	
	public ArrayList<RequestAsk>selectReqAskExpList(int reqNo){
		List list = sqlSession.selectList("request.selectReqAskExpList", reqNo);
		return (ArrayList<RequestAsk>)list;
	}
	

	
	
	
	

}
