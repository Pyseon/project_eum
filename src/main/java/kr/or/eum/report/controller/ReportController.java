package kr.or.eum.report.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.eum.report.model.service.ReportService;

@Controller
public class ReportController {
	@Autowired
	private ReportService reportService;
	
	
}
