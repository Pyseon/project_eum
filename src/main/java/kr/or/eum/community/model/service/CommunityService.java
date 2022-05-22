package kr.or.eum.community.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.eum.community.model.dao.CommunityDao;
import kr.or.eum.community.model.vo.Community;

@Service
@Transactional
public class CommunityService {
	@Autowired
	private CommunityDao dao;

	public ArrayList<Community> selectCommunityList() {
		return dao.selectCommunityList();
	}

	
}
