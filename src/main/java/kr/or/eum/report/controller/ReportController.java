package kr.or.eum.report.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.eum.report.model.service.ReportService;
import kr.or.eum.report.model.vo.Report;

@Controller
public class ReportController {
	@Autowired
	private ReportService service;
	
	@RequestMapping(value = "/report.do")
	public String insertReport(Report report, String reportRadio) {
		System.out.println(report);
		System.out.println(reportRadio);
		return "redirect:/";
	}
	
}
