package kr.or.eum.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.eum.community.model.service.RequesteService;

@Controller
public class RequesteController {
	@Autowired
	private RequesteService requesteService;

}
