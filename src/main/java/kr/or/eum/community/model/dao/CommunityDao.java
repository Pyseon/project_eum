package kr.or.eum.community.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.eum.community.model.vo.Community;
import kr.or.eum.community.model.vo.CommunityCo;

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


	public Community communityDetail(int commNo) {
		Community comm = sqlSession.selectOne("community.communityDetail", commNo);
		return comm;
	}

	public void readCountUp(int commNo) {
		sqlSession.update("community.readCountUp", commNo);
	}

	public ArrayList<CommunityCo> selectCmntList(int commNo) {
		List cmntList = sqlSession.selectList("community.selectCmntList", commNo);
		return  (ArrayList<CommunityCo>) cmntList;
	}

	public int communityWrite(Community comm) {
		return sqlSession.insert("community.communityWrite", comm);
	}

	public void communityUpdate(Community comm) {
		sqlSession.update("community.communityUpdate", comm);
	}

}
