package kr.or.eum.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.eum.product.model.service.ProductService;
import kr.or.eum.review.model.service.ReviewService;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService reviewService;

}
