package kr.or.eum.report.model.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.eum.member.model.vo.Member;
import kr.or.eum.report.model.dao.ReportDao;
import kr.or.eum.report.model.vo.Report;

@Service
public class ReportService {
	@Autowired
	private ReportDao dao;

	public int insertReport(Report report, String reportRadio, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		Member member = null;
		if(session != null) {
			member = (Member)session.getAttribute("member");
			report.setPlaintiff(member.getMemberNo());
			report.setReportContent(reportRadio+"/"+report.getReportContent());
		}
		return dao.insertReport(report);
	}
	
	
}
