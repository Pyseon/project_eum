package kr.or.eum.member.model.service;


import java.util.ArrayList;
import java.util.List;

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
import kr.or.eum.product.model.vo.ProductAndPayment;
import kr.or.eum.product.model.vo.Review;
import kr.or.eum.product.model.vo.productAndReview;
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
	public ArrayList<productAndReview> selectReviewlist(int memberNo) {
		ArrayList<productAndReview> list = dao.selectReviewlist(memberNo);
		
		return list;
	}
	//재민 내 구매목록 삭제
	public int DeleteMyproduct(int payNo) {
		// TODO Auto-generated method stub
		return dao.DeleteMyproduct(payNo);
	}

	public Member selectMypage(Member m) {
		
		Member member = dao.selectOneMember(m);
		System.out.println(member+"Mypage");
		return member;
	}


	public int insertMember(Member m) {
		int result = dao.insertMember(m);
		System.out.println(m);
		return result;
	}

	public int search(String memberNick) {
		// TODO Auto-generated method stub
		return dao.search(memberNick);
  }
  
	public ArrayList<Product> selectMyprojectDetail(int memberNo) {
		ArrayList<Product> list = dao.selectMyprojectDetail(memberNo);
		
		return list;
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

	public int searchId(String memberId) {
		// TODO Auto-generated method stub
		return dao.searchId(memberId);
	}

	public int searchPhone(String memberPhone) {
		// TODO Auto-generated method stub
		System.out.println("서비스도착 멤버폰서치");
		return dao.searchPhone(memberPhone);
	}

	public int updatePw(int memberPw, String memberId, Member m) {
		// TODO Auto-generated method stub
		m.setMemberId(memberId);
		m.setMemberPw(Integer.toString(memberPw));
		System.out.println("이메일 : "+memberId);
        System.out.println("임시비밀번호 : "+memberPw);
        System.out.println("Member : "+ m);
		return dao.updatePw(m);
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

	public int classUpdate(Product pro) {
		
			Product product=setToken(pro);
			int result = dao.classUpdate(product);
				
				return result;
	}
	public Product setToken(Product pro) {
		
		String productQst = pro.getProductQst();
		List<String> qstList = new ArrayList<String>();
		String []tokens=productQst.split("\\|");
		for(int i=0;i<tokens.length;i++) {
			if(tokens[i] == null || tokens[i].trim().length() < 2) {
			}else {
				if(tokens[i].indexOf(",") == 0) {
					qstList.add(tokens[i].replaceFirst(",", ""));
				}else {
					qstList.add(tokens[i].trim());
				}
			}
			
		}
		productQst = "";
		
		for(int i=0;i<qstList.size();i++){
			productQst += qstList.get(i)+"/";
		}
		
		
		String productAns = pro.getProductAns();
		List<String> ansList = new ArrayList<String>();
		String []tokens2=productAns.split("\\|");
		for(int i=0;i<tokens2.length;i++){
			if(tokens2[i] == null || tokens2[i].trim().length() < 2) {
			}else {
				if(tokens2[i].indexOf(",") == 0) {
					ansList.add(tokens2[i].replaceFirst(",", ""));
				}else {
					ansList.add(tokens2[i].trim());
				}
			}
		}
		productAns = "";
		for(int i=0;i<ansList.size();i++){
			productAns += ansList.get(i)+"/";
		}
		
		
		String productTag = pro.getProductTag();
		List<String> tagList = new ArrayList<String>();
		String []tokens3=productTag.split("\\|");
		for(int i=0;i<tokens3.length;i++){
			if(tokens3[i] == null || tokens3[i].trim().length() < 2) {
			}else {
				if(tokens3[i].indexOf(",") == 0) {
					tagList.add(tokens3[i].replaceFirst(",", ""));
				}else {
					tagList.add(tokens3[i].trim());
				}
			}
		}
		productTag = "";
		for(int i=0;i<tagList.size();i++){
			productTag += "#"+tagList.get(i)+"/";
		}
		
	
		
		System.out.println("최종값>>"+productQst);
		System.out.println("최종값>>"+productAns);
		System.out.println("최종값>>"+productTag);
		
		pro.setProductQst(productQst);
		pro.setProductAns(productAns);
		pro.setProductTag(productTag);
		
		return pro;
	}

}
