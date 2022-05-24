package kr.or.eum.manager.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.eum.member.model.vo.Member;

@Repository
public class ManagerDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Member> selectAllMember() {
		List list = sqlSession.selectList("manager.selectAllMember");
		return (ArrayList<Member>)list;
	}
	
	
}
