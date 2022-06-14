package kr.or.eum.ideamarket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.eum.ideamarket.model.service.IdeamarketService;

@ControllerAdvice 
@Controller
public class IdeamarketConroller {
	@Autowired
	private IdeamarketService ideamarketService;
	
	@RequestMapping(value="/ideamarketList.do")
	public String ideamarketList() {
		return "product/ClassList";
	}
	
	//컨트롤러에서 발생하는 모든 에러를 처리하는 방식
	@ExceptionHandler
	public String error1(Exception e) {
		return "common/error";
	}
}
