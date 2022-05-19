package kr.or.eum.product.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.eum.product.model.dao.IdeamarketDao;

@Service
public class IdeamarketService {
	@Autowired
	private IdeamarketDao ideamarketDao;
			
	}
