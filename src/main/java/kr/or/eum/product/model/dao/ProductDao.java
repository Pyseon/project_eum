package kr.or.eum.product.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.eum.product.model.vo.ProductAndWishList;
import kr.or.eum.product.model.vo.ProductDetail;
import kr.or.eum.member.model.vo.Expert;
import kr.or.eum.member.model.vo.Member;
import kr.or.eum.product.model.vo.Chat;
import kr.or.eum.product.model.vo.Counsel;
import kr.or.eum.product.model.vo.Payment;
import kr.or.eum.product.model.vo.Product;
import kr.or.eum.product.model.vo.Review;
import kr.or.eum.wishlist.model.vo.Wishlist;
import kr.or.eum.product.model.vo.ProReviewMember;


@Repository
public class ProductDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//재건
	public ArrayList<Product> selectClassList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("product.selectClassList", map);
		return (ArrayList<Product>)list;
	}
	//재건
	public ArrayList<Product> selectExpertList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("product.selectExpertList", map);
		return (ArrayList<Product>)list;
	}

	//재건
	public int selectClassCount(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		int totalCount = sqlSession.selectOne("product.selectClsTotalCount", map);
		return totalCount;
	}
	
	public int selectExpertCount(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		int totalCount = sqlSession.selectOne("product.selectExpTotalCount", map);
		return totalCount;
	}
	
	public int selectIdeamarketCount(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		int totalCount = sqlSession.selectOne("product.selectIdmTotalCount", map);
		return totalCount;
	}
	
	public int classWrite(Product pro) {
		// TODO Auto-generated method stub
		int result = sqlSession.insert("product.classWrite", pro);
		return result;
	}
	public int expertWrite(Product pro) {
		// TODO Auto-generated method stub
		int result = sqlSession.insert("product.expertWrite", pro);
		return result;
	}
	
	public Expert selectExpertNo(int memberNo) {
		Expert expert = sqlSession.selectOne("product.selectExpertNo", memberNo);
		return expert;
	}
	
	public Member selectMemberNo(int memberNo) {
		Member member = sqlSession.selectOne("product.selectMemberNo", memberNo);
		return member;
	}
	
	public ArrayList<Product> selectIdeamarketList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("product.selectIdeamarketList", map);
		return (ArrayList<Product>)list;
	}
	
	public int ideamarketWrite(Product pro) {
		// TODO Auto-generated method stub
		int result = sqlSession.insert("product.ideamarketWrite", pro);
		return result;
	}
	

	
	//윤지
	public Product selectOneProduct(int productNo) {
		Product product = sqlSession.selectOne("product.selectOneProduct",productNo);
		return product;
	}
	//윤지
	public ArrayList<Review> selectAllReview(int productNo) {
		List list = sqlSession.selectList("product.selectAllReview", productNo);
		return (ArrayList<Review>)list;
    
	}
	//윤지
	public int selectReviewCount(int productNo) {
		int reviewCount = sqlSession.selectOne("product.selectReviewCount", productNo);
		return reviewCount;
	}
	//윤지
	public double selectReviewStar(int productNo) {
		double reviewStar = sqlSession.selectOne("product.selectReviewStar", productNo);
		return reviewStar;
	}
	//윤지
	public int selectPaymentExpertNoCount(int productNo) {
		int paymentCount = sqlSession.selectOne("product.selectPaymentExpertNoCount",productNo);
		return paymentCount;
	}
	//윤지
	public ArrayList<ProductAndWishList> selectWishList() {
		List list = sqlSession.selectList("product.selectWishList");
		return (ArrayList<ProductAndWishList>)list;
	}
	//윤지
	public ArrayList<ProReviewMember> selectReviewList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("product.selectReviewList", map);
		return (ArrayList<ProReviewMember>)list;
	}
	
	//윤지
	public int selectwish(int productNo) {
		int result = sqlSession.selectOne("wish.selectWishCount", productNo);
		return result;
	}
	
	//윤지
	public int insertWish(HashMap<String, Object> map) {
		int result = sqlSession.insert("wish.insertWish", map);
		return result;
	}
	
	//윤지
	public int deletetWish(HashMap<String, Object> map) {
		int result = sqlSession.delete("wish.deleteWish", map);
		return result;
	}

	//윤지
	public int selectWishMemberCheck(HashMap<String, Object> map) {
		int result = sqlSession.selectOne("wish.selectWishMemberCheck", map);
		return result;
	}



	//윤지
	public Payment selectPaymentState(int payNo) {
		Payment payment = sqlSession.selectOne("product.selectPaymentState", payNo);
		return payment;
	}

	//윤지
	public int selectReviewUploadCheck(int payNo) {
		int reviewUploadCheck = sqlSession.selectOne("product.selectReviewUploadCheck", payNo);
		return reviewUploadCheck;
	}

	//윤지
	public int insertChat(HashMap<String, Object> map) {
		int result = sqlSession.insert("product.insertChat", map);
		return result;
	}
	
	//윤지
	public Product selectOneProduct2(int payNo) {
		Product product = sqlSession.selectOne("product.selectOneProduct2", payNo);
		return product;
	}
	
	//윤지
	public Counsel selectCounsel(int payNo) {
		Counsel counsel = sqlSession.selectOne("product.selectCounsel", payNo);
		return counsel;
	}
	
	//윤지
	public ArrayList<Chat> selectChat(int payNo) {
		List chatList = sqlSession.selectList("product.selectChat", payNo);
		return (ArrayList<Chat>)chatList;
	}
	

	//윤지
	public int updateReadCheck(HashMap<String, Object> map) {
		int result = sqlSession.update("product.updateReadCheck", map);
		return result;
	}

	//윤지
	public int updatePaymentState(int counselNo) {
		Payment payment = sqlSession.selectOne("product.selectPayment", counselNo);
		int result = sqlSession.update("product.updatePaymentState", payment.getPayNo());
		System.out.println(result);
		return result;
	}

	public int insertReview(Review review) {
		int result = sqlSession.insert("product.insertReview", review);
		return result;
	}




}
