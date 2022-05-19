package kr.or.eum.report.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.eum.report.model.dao.ReportDao;

@Service
public class ReportService {
	@Autowired
	private ReportDao dao;
	
	
}
