package kr.or.eum.product.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.eum.product.model.vo.Product;
import kr.or.eum.product.model.vo.Review;


@Repository
public class ProductDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Product> selectProductList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("product.selectProductList", map);
		return (ArrayList<Product>)list;
	}


	public int selectProductCount() {
		// TODO Auto-generated method stub
		int totalCount = sqlSession.selectOne("product.selectTotalCount");
		return totalCount;
	}
	
	//윤지
	public Product selectOneProduct(int productNo) {
		Product product = sqlSession.selectOne("product.selectOneProduct",productNo);
		return product;
	}
	//윤지
	public ArrayList<Review> selectAllReview() {
		List list = sqlSession.selectList("product.selectAllReview");
		return (ArrayList<Review>)list;
    
	}
	//윤지
	public int selectReviewCount() {
		int reviewCount = sqlSession.selectOne("product.selectReviewCount");
		return reviewCount;
	}
}
