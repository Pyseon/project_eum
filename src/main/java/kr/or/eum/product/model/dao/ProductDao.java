package kr.or.eum.product.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Repository
public class ProductDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

}
