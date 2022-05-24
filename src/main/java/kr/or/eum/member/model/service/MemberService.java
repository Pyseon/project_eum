package kr.or.eum.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.eum.member.model.dao.MemberDao;
import kr.or.eum.member.model.vo.Member;

@Service
public class MemberService {
	@Autowired
	private MemberDao dao;

	public Member selectOneMember(Member m) {
		// TODO Auto-generated method stub
		if(m.getMemberId().isEmpty() || m.getMemberPw().isEmpty()) {
			throw new IllegalArgumentException("아이디나 패스워드를 입력해야됩니다.");
		}
		Member member = dao.selectOneMember(m);
		return member;
	}
	
	public Member instantlogin(Member m) {
		//즉시 로그인
		Member member = dao.instantlogin(m);
		return member;
	}
	
}
