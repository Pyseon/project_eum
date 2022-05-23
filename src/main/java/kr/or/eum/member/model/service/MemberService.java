package kr.or.eum.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.eum.member.model.dao.MemberDao;
import kr.or.eum.member.model.vo.Member;

@Service
public class MemberService {
	
	
	@Autowired
	private MemberDao dao;
	
	
	public int updateMember(Member m) {
		// TODO Auto-generated method stub
		int result = dao.updateMember(m);
		return result;
	}

}
