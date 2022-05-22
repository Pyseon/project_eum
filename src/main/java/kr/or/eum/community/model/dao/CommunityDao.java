package kr.or.eum.community.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.eum.community.model.vo.Community;

@Repository
public class CommunityDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Community> selectCommunityList() {
		List list = sqlSession.selectList("community.selectCommunityList");
		return (ArrayList<Community>)list;
	}
	
	
}
