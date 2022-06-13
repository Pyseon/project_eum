package kr.or.eum.manager.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.eum.manager.model.vo.Answer;
import kr.or.eum.manager.model.vo.Chart;
import kr.or.eum.manager.model.vo.FaQ;
import kr.or.eum.manager.model.vo.MemberChart;
import kr.or.eum.manager.model.vo.Notice;
import kr.or.eum.manager.model.vo.Question;
import kr.or.eum.manager.model.vo.SalesChart;
import kr.or.eum.member.model.vo.Expert;
import kr.or.eum.member.model.vo.Member;
import kr.or.eum.member.model.vo.RefuseExpert;
import kr.or.eum.product.model.vo.Payment;
import kr.or.eum.product.model.vo.Review;
import kr.or.eum.report.model.vo.AnswerReport;
import kr.or.eum.report.model.vo.Report;

@Repository
public class ManagerDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Member> selectMember(HashMap<String, Integer> selectNumbtn) {
		List list = sqlSession.selectList("manager.selectAllMember", selectNumbtn);
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

	public int MemberCount(int selectNum) {
		int totalCount = sqlSession.selectOne("manager.memberCount",selectNum);
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

	public Payment detailPayment(int payNo) {
		Payment pay = sqlSession.selectOne("manager.detailPayment", payNo);
		return pay;
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

	public Report detailReport(int reportNo) {
		Report report = sqlSession.selectOne("manager.detailReport", reportNo);
		return report;
	}

	public int answerReport(HashMap<String, Object> map) {
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

	public ArrayList<Answer> answerPageData(HashMap<String, Object> map) {
		List list = sqlSession.selectList("manager.answerPageData", map);
		return (ArrayList<Answer>) list;
	}

	public int answerCount(HashMap<String, Object> map) {
		int result = sqlSession.selectOne("manager.answerCount", map);
		return result;
	}

	public Question selectQst(int qstNo) {
		Question qst = sqlSession.selectOne("manager.selectQst", qstNo);
		return qst;
	}

	public int insertAnswer(HashMap<String, Object> answer) {
		int result = sqlSession.insert("manager.insertAnswer", answer);
		return result;
	}

	public int updateAnsState(int qstNo) {
		int result = sqlSession.update("manager.updateAnsState", qstNo);
		return result;
	}
	
	public ArrayList<Question> qstPageData(HashMap<String, Object> map) {
		List list = sqlSession.selectList("manager.qstPageData", map);
		return (ArrayList<Question>) list;
	}
	
	public int qstCount(HashMap<String, Object> map) {
		int result = sqlSession.selectOne("manager.qstCount", map);
		return result;
	}
	
	public ArrayList<Question> myQstPageData(HashMap<String, Object> map) {
		List list = sqlSession.selectList("manager.myQstPageData", map);
		return (ArrayList<Question>) list;
	}
	
	public int myQstCount(HashMap<String, Object> map) {
		int result = sqlSession.selectOne("manager.myQstCount", map);
		return result;
	}

	public int insertQuestion(HashMap<String, Object> map) {
		int result = sqlSession.insert("manager.insertQuestion", map);
		return result;
	}

	public Answer selectAns(int qstNo) {
		Answer ans = sqlSession.selectOne("manager.selectAns", qstNo);
		return ans;
	}

	public ArrayList<Expert> expertPageData(HashMap<String, Object> map) {
		List list = sqlSession.selectList("manager.expertPageData", map);
		return (ArrayList<Expert>) list;
	}
	public int expertCount(HashMap<String, Object> map) {
		int result = sqlSession.selectOne("manager.expertCount", map);
		return result;
	}
	public ArrayList<Expert> searchExpertPageData(HashMap<String, Object> map) {
		List list = sqlSession.selectList("manager.searchExpertPageData", map);
		return (ArrayList<Expert>) list;
	}
	public int searchExpertCount(HashMap<String, Object> map) {
		int result = sqlSession.selectOne("manager.searchExpertCount", map);
		return result;
	}

	public Expert selectExpert(int expertNo) {
		Expert exp = sqlSession.selectOne("manager.selectExpert", expertNo);
		return exp;
	}

	public int updateExpertApp(HashMap<String, Object> map) {
		int result = sqlSession.update("manager.updateExpertApp", map);
		return result;
	}

	public int refuseExpert(HashMap<String, Object> map) {
		int result = sqlSession.update("manager.refuseExpert", map);
		return result;
	}

	public int insertRefuseExpert(HashMap<String, Object> map) {
		int result = sqlSession.insert("manager.insertRefuseExpert", map);
		return result;
	}

	public String selectRefuseContnet(int expertNo) {
		String refuseContent = sqlSession.selectOne("manager.selectRefuseContent", expertNo);
		return refuseContent;
	}

	public int updateMemberGrade(int expertNo) {
		int result= sqlSession.update("manager.updateMemberGrade", expertNo);
		return result;
	}

	public AnswerReport selectAnsrpt(int reportNo) {
		AnswerReport ansrpt = sqlSession.selectOne("manager.selectAnsrpt", reportNo);
		return ansrpt;
	}

	public int updateAnsResult(HashMap<String, Object> map) {
		int result = sqlSession.update("manager.updateAnsResult", map);
		return result;
	}

	public int selectCommCategoryNum(int reportIndex) {
		int result = sqlSession.selectOne("manager.selectCommCategoryNum", reportIndex);
		return result;
	}

	public Review selectProductReview(int reportIndex) {
		Review productReview = sqlSession.selectOne("manager.selectProductReview", reportIndex);
		return productReview;
	}

	public String selectCmntContent(int reportIndex) {
		String cmntContent = sqlSession.selectOne("manager.selectcmntContent", reportIndex);
		return cmntContent;
	}

	public int scoutReport(HashMap<String, Object> scout) {
		int result = sqlSession.selectOne("manager.scoutReport", scout);
		if(result == 0) {
			return -1;
		} else {
			return 1;
		}
	}

	public String selectMemberId(int payNo) {
		String memberId = sqlSession.selectOne("manager.selectMemberId", payNo);
		return memberId;
	}

	public ArrayList<Expert> selectExpertApp(int memberNo) {
		List list = sqlSession.selectList("manager.selectExpertApp", memberNo);
		return (ArrayList<Expert>) list;
	}

	public RefuseExpert selectMyRefuseExpert(int expertNo) {
		RefuseExpert rexp = sqlSession.selectOne("manager.selectMyRefuseExpert", expertNo);
		return rexp;
	}

	public int deleteBeforeExpert(int memberNo) {
		int result = sqlSession.delete("manager.deleteBeforeExpert", memberNo);
		return result;
	}

	public int selectMemberNo(int expertNo) {
		int memberNo = sqlSession.selectOne("manager.selectMemberNo", expertNo);
		return memberNo;
	}
	
}
