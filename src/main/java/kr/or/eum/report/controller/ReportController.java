package kr.or.eum.report.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.eum.report.model.service.ReportService;
import kr.or.eum.report.model.vo.Report;

@Controller
public class ReportController {
	@Autowired
	private ReportService service;
	
	@ResponseBody
	@RequestMapping(value = "/report.do")
	public String insertReport(Report report, String reportRadio, HttpServletRequest request) {
		int result = service.insertReport(report, reportRadio, request);
		System.out.println(result);
		return new Gson().toJson(result);
	}
	
}
