package kr.or.eum.manager.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.eum.manager.model.dao.ManagerDao;
import kr.or.eum.member.model.vo.Member;

@Service
public class ManagerService {
	@Autowired
	private ManagerDao dao;

	public ArrayList<Member> selectMember(int selectMemberBtn) {
		HashMap<String, Integer> selMemBtn = new HashMap<String, Integer>();
		selMemBtn.put("selectMemberBtn", selectMemberBtn);
		return dao.selectMember(selMemBtn);
	}

	public int updateBlackList(int updateNo, int memberNo) {
		HashMap<String, Integer> ubl = new HashMap<String, Integer>();
		ubl.put("updateNo",updateNo);
		ubl.put("memberNo",memberNo);
		return dao.updateBlackList(ubl);
	}
	
}
