package kr.or.eum.community.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.eum.community.model.dao.CommunityDao;

@Service
@Transactional
public class CommunityService {
	@Autowired
	private CommunityDao dao;

	
}
