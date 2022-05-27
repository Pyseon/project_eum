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
import kr.or.eum.member.model.vo.ExpertAndMember;
import kr.or.eum.member.model.vo.Member;
import kr.or.eum.product.model.vo.Product;
import kr.or.eum.product.model.vo.ProductAndPayment;
import kr.or.eum.product.model.vo.Review;
import kr.or.eum.wishlist.model.vo.Wishlist;

@Repository
public class MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	//대권 로그인
	public Member selectOneMember(Member m) {
		// TODO Auto-generated method stub
		Member member = sqlSession.selectOne("member.selectOneMember", m);
		System.out.println(member);
		return member;
	}
	//재민 내정보수정
	public int updateMember(Member m) {
		// TODO Auto-generated method stub
		
		int result = sqlSession.update("member.updateMember",m);
		return result;
	}

	
	//재민 1:1문의내역
	public ArrayList<Question> selectQuestionList() {
		List list = sqlSession.selectList("member.selectQuestionList"); 
		
		return (ArrayList<Question>)list;
	}

	//윤지
	public ExpertAndCompany selectOneExpert(int expertNo) {
		ExpertAndCompany expertAndCom = sqlSession.selectOne("member.selectOneExpert",expertNo);
		return expertAndCom;
	}
	//윤지
	public ExpertAndMember selectOneExpertPicture(int expertNo) {
		ExpertAndMember expertPicture = sqlSession.selectOne("member.selectOneExpertPicture",expertNo);
		return expertPicture;
	}
	//재민 구매목록
	public ArrayList<ProductAndPayment> selectProductList() {
		List list = sqlSession.selectList("member.selectProductList"); 
		System.out.println("list"+list);
		return (ArrayList<ProductAndPayment>)list;
		
	}

	//윤지
	public Expert selectOneExpertOnly(int expertNo) {
		Expert expert = sqlSession.selectOne("member.selectOneExpertOnly",expertNo);
		return expert;
	}
  //재민 찜목록
	public ArrayList<Wishlist> selectWishlist() {
		List list = sqlSession.selectList("member.selectWishlist");
		System.out.println("list"+list);
		return (ArrayList<Wishlist>)list;
	}
	
	//재민 리뷰테이블
	public ArrayList<Review> selectReviewlist() {
		List list = sqlSession.selectList("member.selectReviewlist");
		return (ArrayList<Review>)list;

	}

}
