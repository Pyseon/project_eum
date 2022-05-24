package kr.or.eum.product.model.dao;

import java.util.ArrayList;
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
	
	public ArrayList<Product> selectProductList() {
		List list = sqlSession.selectList("product.selectProductList");
		return (ArrayList<Product>)list;
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
}
