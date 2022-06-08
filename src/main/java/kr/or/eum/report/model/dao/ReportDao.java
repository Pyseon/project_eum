package kr.or.eum.report.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.eum.report.model.vo.Report;

@Repository
public class ReportDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertReport(Report report) {
		int result = sqlSession.insert("member.insertReport", report);
		return result;
	}
	
	
}
