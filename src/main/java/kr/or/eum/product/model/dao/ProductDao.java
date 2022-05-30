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
	public ArrayList<Product> selectProductList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("product.selectProductList", map);
		return (ArrayList<Product>)list;
	}

	//재건
	public int selectProductCount(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		int totalCount = sqlSession.selectOne("product.selectTotalCount", map);
		return totalCount;
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

	public Wishlist selectwish(int productNo, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("productNo", productNo);
		map.put("session", session);
		Wishlist wishCheck = sqlSession.selectOne("wish.selectwish", map);
		return wishCheck;
	}

}
