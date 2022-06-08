package kr.or.eum.member.controller;


import java.util.ArrayList;
import java.util.Locale;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;


import kr.or.eum.community.model.vo.Community;
import kr.or.eum.manager.model.vo.Answer;
import kr.or.eum.manager.model.vo.Question;
import kr.or.eum.member.model.service.MemberService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.eum.member.model.vo.Member;
import kr.or.eum.product.model.vo.Payment;
import kr.or.eum.product.model.vo.Product;
import kr.or.eum.product.model.vo.ProductAndPayment;
import kr.or.eum.product.model.vo.Review;
import kr.or.eum.wishlist.model.vo.Wishlist;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;



@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	@Autowired
	private JavaMailSender mailSender;
	
	//대권 로그인페이지 이동
	@RequestMapping(value="/loginFrm.do")
	public String loginFrm() {
		return "member/loginFrm";
	}
	
	//대권 로그인 실행
	//@ResponseBody
	@RequestMapping(value="/login.do")
	public String login(Member m , HttpSession session) {
		Member member = service.selectOneMember(m);
		System.out.println(member);
		String str="";
		if(member != null) {
			session.setAttribute("member", member);
			str="1";
			return "redirect:/";
		}else {
			str="0";
			return "member/loginFrmFail";
		}
		
	}
	
	//대권 로그아웃
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session) {
	session.invalidate();
	return "redirect:/";
	}
	
	//즉시로그인
	@RequestMapping(value="/instantlogin.do")
	public String instatlogin(Member m, HttpSession session) {
		Member member = service.selectOneMember(m);
		if(member != null) {
			session.setAttribute("member", member);
		}
		return "redirect:/";
	}
	
	//대권 회원가입페이지이동
	@RequestMapping(value="/joinFrm.do")
	public String joinFrm() {
		return "member/joinFrm";
	}	
	//재민 내 정보페이지
	@RequestMapping(value="/Mypage.do")
	public String Mypage(Member m,HttpSession session) {
		
		return "mypage/Mypage";
	}
	//재민 내정보수정
	@RequestMapping(value="/updateMember.do")
	public String updateMember(Member m,HttpSession session) {
		int result = service.updateMember(m);
	
		if(result>0) {
			session.setAttribute("m", m);
		}
		return "redirect:/";
	}
	//재민 1:1 문의내역 확인
	@RequestMapping(value="/MyquestionList.do")
	public String questionList(Model model) {
		ArrayList<Question> list = service.selectQuestionList();
		model.addAttribute("list", list);
		
		return "mypage/MyquestionList";
	}
	
	//재민 1:1문의 상세내역
	@RequestMapping(value="/questionView.do")
	public String questionView(int qstNo, Model model) {
		Question q = service.selectOneQuestion(qstNo);
		model.addAttribute("q",q);
		
		return "mypage/questionView";
		
	}
	//재민 구매내역
	@RequestMapping(value="/Myproduct.do")
	public String Myproduct(Model model, HttpSession session, int memberNo) {
		ArrayList<ProductAndPayment> list = service.selectProductList(memberNo);
		
		model.addAttribute("list", list);
		System.out.println(list);
		System.out.println(memberNo+"memberNo");
		return "mypage/Myproduct";
	}
	//재민 찜내역
	
	@RequestMapping(value="/Mywishlist.do")
	public String Mywishlist(Model model,int memberNo) {
		ArrayList<Wishlist> list = service.selectWishlist(memberNo);
		model.addAttribute("list", list);
		
		return "mypage/wishlist";
	}
	//재민 리뷰목록
	@RequestMapping(value="/Myreview.do")
	public String Myreview(Model model,int memberNo) {
		ArrayList<Review> list = service.selectReviewlist(memberNo);
		model.addAttribute("list", list);
		System.out.println(list);
		return "mypage/Myreview";
	}
	//재민 전문가 신청페이지로 이동
	@RequestMapping(value="/Expertapply.do")
	public String Expertapply() {
		return "expert/Expertapply";
	}
	
	//필요서류 확인페이지
	@RequestMapping(value="/checkdocument.do")
	public String checkdocument() {
		return "expert/checkdocument";
	}
	//재민 전문가 신청페이지2로 이동
	@RequestMapping(value="/Expertapply2.do")
	public String Expertapply2() {
		return "expert/Expertapply2";
	}
	//재민 전문가 신청페이지3로 이동
	@RequestMapping(value="/Expertapply3.do", method = RequestMethod.POST)
	public String Expertapply3(Model model, String expertClass, String expertTag, String expertQual,String expertLicense,String expertIssuer) {
		
		model.addAttribute("expertClass",expertClass);
		model.addAttribute("expertTag",expertTag);
		model.addAttribute("expertQual",expertQual);
		model.addAttribute("expertLicense",expertLicense);
		model.addAttribute("expertIssuer",expertIssuer);
		return "expert/Expertapply3";
	}
	//재민 전문가 (sysout용 확인)
	@RequestMapping(value="/Expertapply4.do",method = RequestMethod.POST)
	public String Expertapply4(Model model, String expertClass, String expertTag,String expertDate,String expertQual,String expertLicense,String expertIssuer,String expertName,String expertJob,String expertPhone,String expertEmail) {
		
		System.out.println(expertClass);
		System.out.println(expertTag);
		System.out.println(expertQual);
		System.out.println(expertLicense);
		System.out.println(expertIssuer);
		System.out.println(expertDate);
		System.out.println(expertName);
		System.out.println(expertJob);
		System.out.println(expertPhone);
		System.out.println(expertEmail);
		return null;
	}

	@RequestMapping(value="/DeleteMyproduct.do")
	public String DeleteMyproduct(int payNo) {
		int result = service.DeleteMyproduct(payNo);
		return "redirect:/Myproduct";
	}
	@RequestMapping(value="/Myproductdetail.do")
	public String Myproductdetail(int payNo) {
	System.out.println(payNo+"payNo");
	ArrayList<Payment> list = service.Myproductdetail(payNo);
	System.out.println(list);
	return "mypage/Myproductdetail";
	}
	//대권 아이디찾기
	@RequestMapping(value="/findId.do")
	public String findId() { 
		return "member/findId";
	}
	//대권 비밀번호찾기
	@RequestMapping(value="/findPw.do")
	public String findPw() { 
		return "member/findPw";
	}
	//대권 회원가입
	@RequestMapping(value="/join.do",method = RequestMethod.POST)
	public String join(Member m) {
		System.out.println(m);
		System.out.println("요청!");
		int result= service.insertMember(m);
		return "redirect:/";
	}
	//대권 메일테스트
	/*
	@RequestMapping(value = "/sendMail.do", method = RequestMethod.GET)
    public void sendMailTest() throws Exception{
        
        String subject = "eum 인증메일";
        String content = "메일 테스트 내용";
        String from = "보내는이 아이디@도메인주소";
        String to = "받는이 아이디@도메인주소";
        
        try {
            MimeMessage mail = mailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");

            mailHelper.setFrom(from);
      
            mailHelper.setTo(to);
            mailHelper.setSubject(subject);
            mailHelper.setText(content, true); 
            
            mailSender.send(mail);
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        
    }
    */
	//대권 메일인증
    @RequestMapping(value="/mailCheck.do", method=RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(String email) throws Exception{
        
        //Logger.info("이메일 데이터 전송 확인");
        //Logger.info("인증번호 : " + email);
        
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        //logger.info("인증번호 " + checkNum);
        
        String setFrom = "khoven@gmail.com";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        try {            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        String num = Integer.toString(checkNum);
        
        return num;
    }
    //닉네임 유효성검사
    @ResponseBody
	@RequestMapping(value="/nickCheck.do",produces = "application/text; charset=UTF-8", method=RequestMethod.POST)
	public String memberNick(String memberNick , Model model) {
    	System.out.println(memberNick);
		Member member = service.search(memberNick);
		System.out.println("컨트롤러:"+ member);
		String str="";
		if(member != null) {
			str="1";
			return str;
		}else {
			str="0";
			return str;
		}
		
	}
}
