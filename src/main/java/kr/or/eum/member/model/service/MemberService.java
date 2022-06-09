package kr.or.eum.member.model.service;


import java.util.ArrayList;
import kr.or.eum.manager.model.vo.Answer;
import kr.or.eum.manager.model.vo.Question;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.eum.member.model.dao.MemberDao;
import kr.or.eum.member.model.vo.Expert;
import kr.or.eum.member.model.vo.ExpertAndMember;
import kr.or.eum.member.model.vo.Member;
import kr.or.eum.product.model.vo.Payment;
import kr.or.eum.product.model.vo.Product;
import kr.or.eum.product.model.vo.ProductAndExpert;
import kr.or.eum.product.model.vo.ProductAndExpertDetail;
import kr.or.eum.product.model.vo.ProductAndPayment;
import kr.or.eum.product.model.vo.Review;
import kr.or.eum.wishlist.model.vo.Wishlist;

@Service
@Transactional
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
		System.out.println(member);
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
	

	//재민 1:1문의 상세페이지
	public Question selectOneQuestion(int qstNo) {
		// TODO Auto-generated method stub
		return null;
	}

	//윤지
	public ExpertAndMember selectOneExpertPicture(int expertNo) {
		return dao.selectOneExpertPicture(expertNo);
	}

	//재민 구매내역
	public ArrayList<ProductAndPayment> selectProductList(int memberNo) {
		ArrayList<ProductAndPayment> list = dao.selectProductList(memberNo);
		
		return list;
	}

	//윤지
	public Expert selectOneExpertOnly(int expertNo) {
		return dao.selectOneExpertOnly(expertNo);
	}

	//재민 찜목록
	public ArrayList<Wishlist> selectWishlist(int memberNo) {
		ArrayList<Wishlist> list = dao.selectWishlist(memberNo);
		
		return list;
	}
	//재민 리뷰목록
	public ArrayList<Review> selectReviewlist(int memberNo) {
		ArrayList<Review> list = dao.selectReviewlist(memberNo);
		
		return list;
	}
	//재민 내 구매목록 삭제
	public int DeleteMyproduct(int payNo) {
		// TODO Auto-generated method stub
		return dao.DeleteMyproduct(payNo);
	}

	public ArrayList<ProductAndExpertDetail> Myproductdetail(int productNo) {
		
		System.out.println(productNo+"서비스");
		ArrayList<ProductAndExpertDetail> list = dao.Myproductdetail(productNo);
		
		System.out.println(list);
		return list;
	}

	public Member selectMypage(Member m) {
		
		Member member = dao.selectOneMember(m);
		System.out.println(member+"Mypage");
		return member;
	}


	public int insertMember(Member m) {
		dao.insertMember(m);
		return dao.insertMember(m);
	}

	public int search(String memberNick) {
		// TODO Auto-generated method stub
		return dao.search(memberNick);
  }
  
	public ArrayList<ProductAndExpert> selectMyproject(int memberNo) {
		ArrayList<ProductAndExpert> list = dao.selectMyproject(memberNo);
		
		return list;
	}

	public int insertExpert(Expert ex) {
		// TODO Auto-generated method stub
		int result = dao.insertExpert(ex);
		return result;

	}

  //대권
	public int searchId(String memberId) {
		// TODO Auto-generated method stub
		return dao.searchId(memberId);
  }
  
	public ArrayList<ProductAndExpertDetail> selectMyprojectDetail(int productNo) {
		// TODO Auto-generated method stub
		ArrayList<ProductAndExpertDetail> list = dao.selectMyprojectDetail(productNo);
		return list;

	}

	public int DeleteMywish(int wishNo) {
		// TODO Auto-generated method stub
		
		return dao.DeleteMywish(wishNo);
	}

	public int deleteMember(int memberNo) {
		// TODO Auto-generated method stub
		return dao.deleteMember(memberNo);
	}

	public ArrayList<Payment> selectMyproductDetail(int payNo) {
		// TODO Auto-generated method stub
		ArrayList<Payment> list = dao.selectMyproductDetail(payNo);
		return list;
	}


}
