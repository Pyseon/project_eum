package kr.or.eum.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.ArrayList;
import java.util.List;
import kr.or.eum.manager.model.vo.Answer;
import kr.or.eum.manager.model.vo.Question;
import kr.or.eum.member.model.vo.Expert;
import kr.or.eum.member.model.vo.ExpertAndMember;
import kr.or.eum.member.model.vo.Member;
import kr.or.eum.product.model.vo.Payment;
import kr.or.eum.product.model.vo.Product;
import kr.or.eum.product.model.vo.ProductAndExpert;
import kr.or.eum.product.model.vo.ProductAndPayment;
import kr.or.eum.product.model.vo.Review;
import kr.or.eum.product.model.vo.productAndReview;
import kr.or.eum.wishlist.model.vo.Wishlist;

@Repository
public class MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	//대권 로그인
	public Member selectOneMember(Member m) {
		// TODO Auto-generated method stub
		Member member = sqlSession.selectOne("member.selectOneMember", m);
		//System.out.println(member);
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
	public ExpertAndMember selectOneExpertPicture(int expertNo) {
		ExpertAndMember expertPicture = sqlSession.selectOne("member.selectOneExpertPicture",expertNo);
		return expertPicture;
	}
	
	//재민 구매목록
	public ArrayList<ProductAndPayment> selectProductList(int memberNo) {
		List list = sqlSession.selectList("member.selectProductList",memberNo); 
		return (ArrayList<ProductAndPayment>)list;
	}
	
	//윤지
	public Expert selectOneExpertOnly(int expertNo) {
		Expert expert = sqlSession.selectOne("member.selectOneExpertOnly",expertNo);
		return expert;
	}

	//재민 리뷰테이블
	public ArrayList<productAndReview> selectReviewlist(int memberNo) {
		List list = sqlSession.selectList("member.selectReviewlist",memberNo);
		return (ArrayList<productAndReview>)list;
	}
	
	//재민 찜목록
	public ArrayList<Wishlist> selectWishlist(int memberNo) {
		List list = sqlSession.selectList("member.selectWishlist",memberNo);
			
		return (ArrayList<Wishlist>)list;
	}
	
	public int DeleteMyproduct(int payNo) {
		int result = sqlSession.update("member.DeleteMyproduct",payNo);
		return result;
	}
	

	//윤지
	public Expert selectOneExpertOnly2(int payNo) {
		Expert expert = sqlSession.selectOne("member.selectOneExpertOnly2", payNo);
		return expert;
	}
	//윤지
	public ExpertAndMember selectOneExpertPicture2(int payNo) {
		ExpertAndMember expertPicture = sqlSession.selectOne("member.selectOneExpertPicture2",payNo);
		return expertPicture;
	}
	public int insertMember(Member m) {
		int result = sqlSession.insert("member.insertMember",m);
		return result;
		
	}
	public int search(String memberNick) {
		// TODO Auto-generated method stub
		int result = sqlSession.selectOne("member.search",memberNick);
		return result;
	}

	//윤지
	public ExpertAndMember selectOneExpert(int reviewNo) {
		ExpertAndMember expertM = sqlSession.selectOne("member.selectOneExpert",reviewNo);
		return expertM;
	}
  
	public ArrayList<ProductAndExpert> selectMyproject(int memberNo) {
		List list = sqlSession.selectList("member.selectMyproject",memberNo); 
		
		return (ArrayList<ProductAndExpert>)list;
	}
	public ArrayList<Product> selectMyprojectDetail(int productNo) {
		List list = sqlSession.selectList("member.selectMyprojectDetail",productNo); 
		
		return (ArrayList<Product>)list;
	}
	public int insertExpert(Expert ex) {
		int result = sqlSession.insert("member.insertexpert",ex);
		return result;
	}
	public int searchId(String memberId) {
		// TODO Auto-generated method stub
		int result = sqlSession.selectOne("member.searchId",memberId);
		return result;
	}
	public int searchPhone(String memberPhone) {
		// TODO Auto-generated method stub
		int result = sqlSession.selectOne("member.searchPhone",memberPhone);
		return result;
	}
	
	public int updatePw(Member m) {
		// TODO Auto-generated method stub
		int result = sqlSession.update("member.updatePw", m);
		return result;
	}
	public int DeleteMywish(int wishNo) {
		// TODO Auto-generated method stub
		int result = sqlSession.delete("member.DeleteMywish",wishNo);
		return result;
	}
	public int deleteMember(int memberNo) {
		// TODO Auto-generated method stub
		int result = sqlSession.delete("member.deleteMember",memberNo);
		return result;
	}
	public ArrayList<Payment> selectMyproductDetail(int payNo) {
		List list = sqlSession.selectList("member.selectMyproductDetail",payNo); 
		
		return (ArrayList<Payment>)list;
	}
	public int classUpdate(Product pro) {
		
		
	
		int result = sqlSession.update("member.classUpdate", pro);
		
		return result;
	}
	//대권 productpayment
	public Expert selectExepertPayment(int expertNo) {
		Expert expert = sqlSession.selectOne("member.selectExpertPayment", expertNo);
		return expert;
	}
	public int DeleteMyproject(int productNo) {
		int result = sqlSession.delete("member.DeleteMyproject",productNo);
		return result;
	}

}
