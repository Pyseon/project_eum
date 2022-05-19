package kr.or.eum.manager.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.eum.manager.model.dao.ManagerDao;

@Service
public class ManagerService {
	@Autowired
	private ManagerDao managerDao;
	
	
}
