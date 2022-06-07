package kr.or.eum.manager.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.eum.manager.model.vo.Chart;
import kr.or.eum.manager.model.vo.FaQ;
import kr.or.eum.manager.model.vo.MemberChart;
import kr.or.eum.manager.model.vo.Notice;
import kr.or.eum.manager.model.vo.SalesChart;
import kr.or.eum.member.model.vo.Member;
import kr.or.eum.product.model.vo.Payment;
import kr.or.eum.report.model.vo.Report;

@Repository
public class ManagerDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Member> selectMember(HashMap<String, Integer> selMembtn) {
		List list = sqlSession.selectList("manager.selectAllMember", selMembtn);
		return (ArrayList<Member>)list;
	}

	public int updateBlackList(HashMap<String, Integer> ubl) {
		int result = sqlSession.update("manager.updateBlackList", ubl);
		return result;
	}

	public ArrayList<Member> MemberPageData(HashMap<String, Object> map) {
		List list = sqlSession.selectList("manager.MemberList", map);
		return (ArrayList<Member>)list;
	}

	public int MemberCount(int selMem) {
		int totalCount = sqlSession.selectOne("manager.memberCount",selMem);
		return totalCount;
	}

	public ArrayList<Member> searchOneMember(HashMap<String, Object> map) {
		List list = sqlSession.selectList("manager.searchOneMember", map);
		return (ArrayList<Member>)list;
	}

	public ArrayList<Member> searchMemberPageData(HashMap<String, Object> map) {
		List list = sqlSession.selectList("manager.searchMemberList", map); 
		return (ArrayList<Member>)list;
	}
	
	public int searchMemberCount(HashMap<String, Object> map) {
		int totalCount = sqlSession.selectOne("manager.searchMemberCount",map);
		return totalCount;
	}

	public ArrayList<Payment> PaymentPageData(HashMap<String, Object> map) {
		List list = sqlSession.selectList("manager.paymentList", map);
		return (ArrayList<Payment>)list;
	}

	public int PaymentCount(int payState) {
		int totalCount = sqlSession.selectOne("manager.paymentCount",payState);
		return totalCount;
	}

	public ArrayList<Payment> searchPaymentPageData(HashMap<String, Object> map) {
		List list = sqlSession.selectList("manager.searchPaymentList", map);
		return (ArrayList<Payment>)list;
	}

	public int searchPaymentCount(HashMap<String, Object> map) {
		int totalCount = sqlSession.selectOne("manager.searchPaymentCount", map);
		return totalCount;
	}

	public int updatePayState(HashMap<String, Integer> ups) {
		int result = sqlSession.update("manager.updatePayState", ups);
		return result;
	}

	public ArrayList<Payment> detailPayment(int payNo) {
		List pay = sqlSession.selectList("manager.detailPayment", payNo);
		return (ArrayList<Payment>) pay;
	}

	public ArrayList<Report> ReportPageData(HashMap<String, Object> map) {
		List list = sqlSession.selectList("manager.reportList", map);
		return (ArrayList<Report>) list;
	}

	public int ReportCount() {
		int totalCount = sqlSession.selectOne("manager.reportCount");
		return totalCount;
	}

	public ArrayList<Report> searchReportPageData(HashMap<String, Object> map) {
		List list = sqlSession.selectList("manager.searchReportList", map);
		return (ArrayList<Report>) list;
	}
	
	public int searchReportCount(HashMap<String, Object> map) {
		int totalCount = sqlSession.selectOne("manager.searchReportCount", map);
		return totalCount;
	}

	public ArrayList<Report> detailReport(int reportNo) {
		List report = sqlSession.selectList("manager.detailReport", reportNo);
		return (ArrayList<Report>) report;
	}

	public int answerReport(HashMap<String, String> map) {
		int result = sqlSession.insert("manager.answerReport", map);
		return result;
	}

	public int reportMember(int memberNo) {
		int result = sqlSession.update("manager.reportMember", memberNo);
		return result;
	}

	public int deleteArticles(HashMap<String, Integer> map) {
		int result = sqlSession.delete("manager.deleteArticles", map);
		return result;
	}

	public int updateReportIs(HashMap<String, Integer> map) {
		int result = sqlSession.update("manager.updateReportIs",map);
		return result;
	}
	
	public ArrayList<FaQ> FAQPageData(HashMap<String, Object> map) {
		List list = sqlSession.selectList("manager.FAQList", map);
		return (ArrayList<FaQ>) list;
	}

	public int FAQCount(int selectNum) {
		int totalCount = sqlSession.selectOne("manager.FAQCount", selectNum);
		return totalCount;
	}
	public ArrayList<FaQ> searchFAQPageData(HashMap<String, Object> map) {
		List list = sqlSession.selectList("manager.searchFAQList", map);
		return (ArrayList<FaQ>) list;
	}

	public int searchFAQCount(HashMap<String, Object> map) {
		int totalCount = sqlSession.selectOne("manager.searchFAQCount", map);
		return totalCount;
	}

	public int insertFAQ(HashMap<String, Object> map) {
		int result = sqlSession.insert("manager.insertFAQ",map);
		return result;
	}

	public int deleteFAQ(int FAQNo) {
		int result = sqlSession.delete("manager.deleteFAQ",FAQNo);
		return result;
	}

	public ArrayList<FaQ> selectFAQ(int FAQNo) {
		List list = sqlSession.selectList("manager.selectFAQ", FAQNo);
		return (ArrayList<FaQ>) list;
	}

	public int updateFAQ(HashMap<String, Object> map) {
		int result = sqlSession.update("manager.updateFAQ", map);
		return result;
	}

	public ArrayList<Notice> noticePageData(HashMap<String, Object> map) {
		List list = sqlSession.selectList("manager.noticeList", map);
		return (ArrayList<Notice>) list;
	}
	public int noticeCount() {
		int totalCount = sqlSession.selectOne("manager.noticeCount");
		return totalCount;
	}
	public ArrayList<Notice> searchNoticePageData(HashMap<String, Object> map) {
		List list = sqlSession.selectList("manager.searchNoticeList", map);
		return (ArrayList<Notice>) list;
	}
	public int searchNoticeCount(HashMap<String, Object> map){
		int totalCount = sqlSession.selectOne("manager.searchNoticeCount", map);
		return totalCount;
	}

	public int deleteNotice(int noticeNo) {
		int result = sqlSession.delete("manager.deleteNotice", noticeNo);
		return result;
	}

	public ArrayList<Notice> selectNotice(int noticeNo) {
		List list = sqlSession.selectList("manager.selectNotice", noticeNo);
		return (ArrayList<Notice>) list;
	}

	public int insertNotice(HashMap<String, Object> notice) {
		int result = sqlSession.insert("manager.insertNotice", notice);
		return result;
	}

	public int updateNotice(HashMap<String, Object> map) {
		int result = sqlSession.update("manager.updateNotice", map);
		return result;
	}

	public Chart selectChart() {
		Chart chart = sqlSession.selectOne("manager.selectChart");
		return chart;
	}

	public MemberChart selectMemberChart(String year) {
		MemberChart memberChart = sqlSession.selectOne("manager.selectMemberChart", year);
		return memberChart;
	}
	
	public SalesChart selectSalesChart(HashMap<String, Object> map) {
		SalesChart salesChart = sqlSession.selectOne("manager.selectSalesChart", map);
		return salesChart;
	}
	
	
	
}
