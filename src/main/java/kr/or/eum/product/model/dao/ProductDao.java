package kr.or.eum.product.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

}
