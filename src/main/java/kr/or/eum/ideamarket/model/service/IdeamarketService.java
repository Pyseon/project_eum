package kr.or.eum.ideamarket.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.eum.ideamarket.model.dao.IdeamarketDao;

@Service
public class IdeamarketService {
	@Autowired
	private IdeamarketDao ideamarketDao;
			
	}
