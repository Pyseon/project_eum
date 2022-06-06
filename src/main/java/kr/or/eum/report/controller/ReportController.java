package kr.or.eum.report.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.eum.report.model.service.ReportService;

@Controller
public class ReportController {
	@Autowired
	private ReportService service;
	
	@RequestMapping(value = "/report.do")
	public String Report() {
		return "common/reportFrm";
	}
	
}
