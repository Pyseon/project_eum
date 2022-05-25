package kr.or.eum.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.ArrayList;
import java.util.List;
import kr.or.eum.manager.model.vo.Answer;
import kr.or.eum.manager.model.vo.Question;
import kr.or.eum.member.model.vo.Expert;
import kr.or.eum.member.model.vo.ExpertAndCompany;
import kr.or.eum.member.model.vo.Member;
import kr.or.eum.product.model.vo.Product;

@Repository
public class MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	//대권 로그인
	public Member selectOneMember(Member m) {
		// TODO Auto-generated method stub
		Member member = sqlSession.selectOne("member.selectOneMember", m);
		return member;
	}
	
	public int updateMember(Member m) {
		// TODO Auto-generated method stub
		
		int result = sqlSession.update("member.updateMember",m);
		return result;
	}

	

	public ArrayList<Question> selectQuestionList() {
		List list = sqlSession.selectList("member.selectQuestionList"); 
		
		return (ArrayList<Question>)list;
	}

	//윤지
	public ExpertAndCompany selectOneExpert(int expertNo) {
		ExpertAndCompany expertAndCom = sqlSession.selectOne("member.selectOneExpert",expertNo);
		return expertAndCom;
	}

	public Expert selectOneExpertPicture(int expertNo) {
		Expert expertPicture = sqlSession.selectOne("member.selectOneExpertPicture",expertNo);
		return expertPicture;
	}

}
