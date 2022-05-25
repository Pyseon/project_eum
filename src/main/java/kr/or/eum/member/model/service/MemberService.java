package kr.or.eum.member.model.service;


import java.util.ArrayList;
import kr.or.eum.manager.model.vo.Answer;
import kr.or.eum.manager.model.vo.Question;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.or.eum.member.model.dao.MemberDao;
import kr.or.eum.member.model.vo.Expert;
import kr.or.eum.member.model.vo.ExpertAndCompany;
import kr.or.eum.member.model.vo.Member;
import kr.or.eum.product.model.vo.Product;
import kr.or.eum.product.model.vo.ProductAndPayment;

@Service
public class MemberService {

	@Autowired
	private MemberDao dao;
	
	//대권 로그인
	public Member selectOneMember(Member m) {
		// TODO Auto-generated method stub
		if(m.getMemberId().isEmpty() || m.getMemberPw().isEmpty()) {
			throw new IllegalArgumentException("아이디나 패스워드를 입력해야됩니다.");
		}
		Member member = dao.selectOneMember(m);
		return member;
	}
	
	//재민 내정보수정
	public int updateMember(Member m) {
		// TODO Auto-generated method stub
		int result = dao.updateMember(m);
		return result;
	}
	//재민 1:1문의리스트 확인
	public ArrayList<Question> selectQuestionList() {
		ArrayList<Question> list = dao.selectQuestionList();
		
		return list;
	}
	
	//윤지
	public ExpertAndCompany selectOneExpert(int expertNo) {
		return dao.selectOneExpert(expertNo);
	}
	//재민 1:1문의 상세페이지
	public Question selectOneQuestion(int qstNo) {
		// TODO Auto-generated method stub
		return null;
	}

	//윤지
	public Expert selectOneExpertPicture(int expertNo) {
		return dao.selectOneExpertPicture(expertNo);
	}
	
	//재민 구매내역
	public ArrayList<ProductAndPayment> selectProductList() {
		ArrayList<ProductAndPayment> list = dao.selectProductList();
		
		return list;
	}


}
