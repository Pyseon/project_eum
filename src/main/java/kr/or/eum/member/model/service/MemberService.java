package kr.or.eum.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import kr.or.eum.manager.model.vo.Answer;
import kr.or.eum.manager.model.vo.Question;
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
