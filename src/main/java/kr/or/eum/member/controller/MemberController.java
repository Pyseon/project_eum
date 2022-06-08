package kr.or.eum.member.controller;


import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Locale;

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
import org.springframework.web.multipart.MultipartFile;

import kr.or.eum.member.model.vo.Expert;
import kr.or.eum.member.model.vo.Member;
import kr.or.eum.product.model.vo.Payment;
import kr.or.eum.product.model.vo.Product;
import kr.or.eum.product.model.vo.ProductAndPayment;
import kr.or.eum.product.model.vo.Review;
import kr.or.eum.wishlist.model.vo.Wishlist;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
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
			session.setAttribute("member", m);
		}
		System.out.println(m);
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
	@RequestMapping(value="/Myproject.do")
	public String Myproject(Model model, HttpSession session, int memberNo) {
		ArrayList<ProductAndExpert> list = service.selectMyproject(memberNo);
		
		model.addAttribute("list", list);
		System.out.println(list);
		return "mypage/Myproject";
	}
	@RequestMapping(value="/Myproduct.do")
	public String Myproduct(Model model, HttpSession session, int memberNo) {
		ArrayList<ProductAndPayment> list = service.selectProductList(memberNo);
		
		model.addAttribute("list", list);
		
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
	@RequestMapping(value="/Expertapply2.do", method = RequestMethod.POST)
	public String Expertapply2(Model model, int memberNo) {
		model.addAttribute("memberNo",memberNo);
		return "expert/Expertapply2";
	}
	//재민 전문가 신청페이지3로 이동
	@RequestMapping(value="/Expertapply3.do", method = RequestMethod.POST)
	public String Expertapply3(Expert ex) {
		
		/*
		String savePath 
		= request.getSession().getServletContext().getRealPath("/img/expert/");
		
			//파일명이 기존파일과 겹치는 경우 기존파일을 삭제하고 새파일만 남는 현상이 생김(덮어쓰기)
			//파일명 중복처리 (뒤에 넘버를 붙인다든가..)
			//사용자가 업로드한 파일 이름 
			String certificateName = file.getOriginalFilename();
			//test.txt -> text_1.text /  text_1.txt->text_2.txt 중복처리 로직
			//업로드한 파일명이 test.txt인경우 -> test / .txt 두부분으로 분리함
			//subString은 매개변수 두개면 첫번쨰부터 두번째까지 잘라서 반환
			//매개변수가 하나면 매개변수부터 잘라서 반환
			String onlyFilename = certificateName.substring(0, certificateName.lastIndexOf("."));//test
			String extension = certificateName.substring(certificateName.lastIndexOf("."));//.txt
			//실제 업로드할 파일명을 저장할 변수
			String certificatePath = null;
			//파일명 중복시 뒤에 붙일 숫자 변수
			int count = 0;
			while(true) {
				if(count == 0) {
					//반복 첫번째 회차에서는 원본파일명을 그대로 적용
					certificatePath = onlyFilename + extension; //test.txt
				}
				File checkFile = new File(savePath+certificatePath);
				if(!checkFile.exists()) { //경로에 파일이 존재하지않으면 (exists() method 사용)
					break; //겹치지않으면 >> while 문 종료
				}else {
					certificatePath = onlyFilename + "_" + count + extension;
				}
				count++; //존재하면 카운트를 ++ 하고 반복문 다시 실행
			}
			//파일명 중복검사했을때 경로에 중복 파일이 존재하지 않아서 while문나온시점
			//해당파일 업로드 작업
			try {
				//중복처리가 끝난파일명 (filepath)으로 파일을 업로드할 FileOutputStream객체 생성
				FileOutputStream fos = new FileOutputStream(new File(savePath+certificatePath));
				//업로드 속도증가를 위한 보조스트림 생성
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				//파일 업로드
				byte[] bytes = file.getBytes();
				bos.write(bytes);
				bos.close();
				
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
			ex.setCertificateName(certificateName);
			ex.setCertificatePath(certificatePath);
		*/
		int result = service.insertExpert(ex);
		
		System.out.println(result);

		
		return null;
	}
	
	//재민 주문취소
	@RequestMapping(value="/DeleteMyproduct.do")
	public String DeleteMyproduct(int payNo) {
		int result = service.DeleteMyproduct(payNo);
		
		System.out.println(result);
		return "redirect:/";
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
}
