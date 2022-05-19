package kr.or.eum.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.eum.product.model.service.IdeamarketService;

@Controller
public class IdeamarketConroller {
	@Autowired
	private IdeamarketService ideamarketService;
}
