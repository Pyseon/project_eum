package kr.or.eum.community.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.eum.community.model.vo.Community;

@Repository
public class CommunityDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Community> selectCommunityList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("community.selectCommunityList", map);
		return (ArrayList<Community>)list;
	}

	public int selectCommunityCount(HashMap<String, Object> map) {
		int totalCount = sqlSession.selectOne("community.selectTotalCount", map);
		return totalCount;
	}


	public ArrayList<Community> communityDetail(int commNo) {
		List list = sqlSession.selectList("community.communityDetail", commNo);
		return (ArrayList<Community>)list;
	}

	public void readCountUp(int commNo) {
		sqlSession.update("community.readCountUp", commNo);
	}
	
	
}
