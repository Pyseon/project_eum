package kr.or.eum.ideamarket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.eum.ideamarket.model.service.IdeamarketService;

@Controller
public class IdeamarketConroller {
	@Autowired
	private IdeamarketService ideamarketService;
	
	@RequestMapping(value="/ideamarketList.do")
	public String ideamarketList() {
		return "product/ClassList";
	}
	
}
