package kr.or.eum.request.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.eum.request.model.service.RequestService;


@Controller
public class RequestController {
	@Autowired
	private RequestService requestService;

}
