package kr.or.eum.manager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.eum.manager.model.service.ManagerService;

@Controller
public class ManagerController {
	@Autowired
	private ManagerService service;
	
	
}
