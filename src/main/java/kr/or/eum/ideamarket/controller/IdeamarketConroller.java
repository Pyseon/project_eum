package kr.or.eum.ideamarket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.eum.ideamarket.model.service.IdeamarketService;

@Controller
public class IdeamarketConroller {
	@Autowired
	private IdeamarketService ideamarketService;
}
