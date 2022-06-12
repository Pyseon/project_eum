package kr.or.eum.community.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.eum.community.model.vo.Community;
import kr.or.eum.community.model.vo.CommunityCo;
import kr.or.eum.community.model.vo.Pick;

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

	public ArrayList<Pick> selectPickList(HashMap<String, Object> map) {
		List pickList = sqlSession.selectList("community.selectPickList", map);
		return  (ArrayList<Pick>) pickList;
	}
	
	public int communityWrite(Community comm) {
		return sqlSession.insert("community.communityWrite", comm);
	}

	public void communityUpdate(Community comm) {
		sqlSession.update("community.communityUpdate", comm);
	}

	public void communityDelete(int commNo) {
		sqlSession.delete("community.communityDelete", commNo);
	}

	public void commCoWrite(CommunityCo commCo) {
		sqlSession.insert("community.commCoWrite", commCo);
	}

	public CommunityCo commCoDetail(int cmntNo) {
		CommunityCo commCo = sqlSession.selectOne("community.commCoDetail", cmntNo);
		return commCo;
	}

	public void commCoUpdate(CommunityCo commCo) {
		sqlSession.update("community.commCoUpdate", commCo);
		
	}

	public void commCoDelete(int cmntNo) {
		sqlSession.delete("community.commCoDelete", cmntNo);
	}

	public int commentCount(HashMap<String, Object> map) { //삭제하려는 댓글에 대댓글이 있는지 확인
		return sqlSession.selectOne("community.commentCount", map);
	}

	public void pickWrite(Pick pick) {
		sqlSession.insert("community.pickWrite", pick);
	}

	public void pickUpdate(Pick pick) {
		sqlSession.update("community.pickUpdate", pick);
	}

	public void pickDel(int pickNo) {
		sqlSession.delete("community.pickDel", pickNo);
	}

	public int likeMemberCheck(HashMap<String, Object> map) {
		int result = sqlSession.selectOne("community.likeMemberCheck", map);
		return result;
	}

	public int insertLike(HashMap<String, Object> map) {
		return sqlSession.insert("community.insertLike", map);
	}

	public int deleteLike(HashMap<String, Object> map) {
		return sqlSession.delete("community.deleteLike", map);
	}

	public int selectLike(int commNo) {
		return sqlSession.selectOne("community.selectLike", commNo);
	}

	public int pickLikeUp(HashMap<String, Object> map) {
		return sqlSession.insert("community.pickLikeUp", map);
	}

	public int pickLikeDown(HashMap<String, Object> map) {
		return sqlSession.delete("community.pickLikeDown", map);
	}

	public int pickLikeCount(int pickNo) {
		return sqlSession.selectOne("community.pickLikeCount", pickNo);
	}

	public int reCommentCount(int cmntNo) { //삭제하려는 대댓글에 대대댓글이 있는지 확인
		return sqlSession.selectOne("community.reCommentCount", cmntNo);
	}



}
