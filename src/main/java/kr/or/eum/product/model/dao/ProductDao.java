package kr.or.eum.product.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.eum.product.model.vo.Product;


@Repository
public class ProductDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Product> selectProductList() {
		List list = sqlSession.selectList("product.selectProductList");
		return (ArrayList<Product>)list;
	}
}
