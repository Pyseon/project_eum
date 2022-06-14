package kr.or.eum.report.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.eum.report.model.service.ReportService;
import kr.or.eum.report.model.vo.Report;

@ControllerAdvice 
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
	
	//컨트롤러에서 발생하는 모든 에러를 처리하는 방식
	@ExceptionHandler
	public String error1(Exception e) {
		System.out.println(e.getMessage());
		return "common/error";
	}
	
}
