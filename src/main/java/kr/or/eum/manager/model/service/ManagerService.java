package kr.or.eum.manager.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.eum.manager.model.dao.ManagerDao;
import kr.or.eum.member.model.vo.Member;

@Service
public class ManagerService {
	@Autowired
	private ManagerDao dao;

	public ArrayList<Member> selectAllmember() {
		return dao.selectAllMember();
	}
	
	
}
