package kr.or.eum.review.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

}
