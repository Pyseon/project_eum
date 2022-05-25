package kr.or.eum.manager.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.eum.member.model.vo.Member;

@Repository
public class ManagerDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Member> selectMember(HashMap<String, Integer> selMembtn) {
		List list = sqlSession.selectList("manager.selectAllMember", selMembtn);
		return (ArrayList<Member>)list;
	}

	public int registBlackList(int memberNo) {
		int result = sqlSession.update("manager.registBlackList", memberNo);
		return result;
	}
	
	public int clearBlackList(int memberNo) {
		int result = sqlSession.update("manager.clearBlackList", memberNo);
		return result;
	}

	public int updateBlackList(HashMap<String, Integer> ubl) {
		int result = sqlSession.update("manager.updateBlackList", ubl);
		return 0;
	}

	public ArrayList<Member> MemberPageData(HashMap<String, Object> pageMap) {
		List list = sqlSession.selectList("manager.MemberList",pageMap);
		return (ArrayList<Member>)list;
	}

	public int MemberCount() {
		int totalCount = sqlSession.selectOne("manager.memberCount");
		return totalCount;
	}
	
}
