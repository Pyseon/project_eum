package kr.or.eum.member.model.service;


import java.util.ArrayList;

import kr.or.eum.manager.model.vo.Answer;
import kr.or.eum.manager.model.vo.Question;

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
	
	public int updateMember(Member m) {
		// TODO Auto-generated method stub
		int result = dao.updateMember(m);
		return result;
	}


	

	public ArrayList<Question> selectQuestionList() {
		ArrayList<Question> list = dao.selectQuestionList();
		
		return list;
	}

/*
 * 
 * public ArrayList<Answer> selectAnswerList() {
		ArrayList<Answer> list = dao.selectAnswerList();
		return list;
	}

	public Answer selectOneAnswer(int ansNo) {
		Answer a = dao.selectOneBoard(ansNo);
		
		return a;
	}
*/

}
