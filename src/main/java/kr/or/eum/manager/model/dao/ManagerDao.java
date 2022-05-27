package kr.or.eum.manager.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.eum.member.model.vo.Member;
import kr.or.eum.product.model.vo.Payment;

@Repository
public class ManagerDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Member> selectMember(HashMap<String, Integer> selMembtn) {
		List list = sqlSession.selectList("manager.selectAllMember", selMembtn);
		return (ArrayList<Member>)list;
	}

	public int updateBlackList(HashMap<String, Integer> ubl) {
		int result = sqlSession.update("manager.updateBlackList", ubl);
		return result;
	}

	public ArrayList<Member> MemberPageData(HashMap<String, Object> map) {
		List list = sqlSession.selectList("manager.MemberList", map);
		return (ArrayList<Member>)list;
	}

	public int MemberCount(int selMem) {
		int totalCount = sqlSession.selectOne("manager.memberCount",selMem);
		return totalCount;
	}

	public ArrayList<Member> searchOneMember(HashMap<String, Object> map) {
		List list = sqlSession.selectList("manager.searchOneMember", map);
		return (ArrayList<Member>)list;
	}

	public ArrayList<Member> searchMemberPageData(HashMap<String, Object> map) {
		List list = sqlSession.selectList("manager.searchMemberList", map); 
		return (ArrayList<Member>)list;
	}
	
	public int searchMemberCount(HashMap<String, Object> map) {
		int totalCount = sqlSession.selectOne("manager.searchMemberCount",map);
		return totalCount;
	}

	public ArrayList<Payment> PaymentPageData(HashMap<String, Object> map) {
		List list = sqlSession.selectList("manager.paymentList", map);
		return (ArrayList<Payment>)list;
	}

	public int PaymentCount(int payState) {
		int totalCount = sqlSession.selectOne("manager.paymentCount",payState);
		return totalCount;
	}

	public ArrayList<Payment> searchPaymentPageData(HashMap<String, Object> map) {
		List list = sqlSession.selectList("manager.searchPaymentList", map);
		return (ArrayList<Payment>)list;
	}

	public int searchPaymentCount(HashMap<String, Object> map) {
		int totalCount = sqlSession.selectOne("manager.searchPaymentCount", map);
		return totalCount;
	}

	public int updatePayState(HashMap<String, Integer> ups) {
		int result = sqlSession.update("manager.updatePayState", ups);
		return result;
	}
	
}
