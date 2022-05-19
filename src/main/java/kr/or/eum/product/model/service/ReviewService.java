package kr.or.eum.product.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.eum.product.model.dao.ProductDao;
import kr.or.eum.product.model.dao.ReviewDao;

@Service
public class ReviewService {
	@Autowired
	private ReviewDao reviewDao;

}
