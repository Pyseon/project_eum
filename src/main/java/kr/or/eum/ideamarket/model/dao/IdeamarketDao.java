package kr.or.eum.ideamarket.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class IdeamarketDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

}
