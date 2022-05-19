package kr.or.eum.report.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReportDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
}
