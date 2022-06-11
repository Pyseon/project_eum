package kr.or.eum.product.controller;

import kr.or.eum.member.model.vo.Member;
import kr.or.eum.member.model.vo.Expert;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import org.springframework.web.multipart.MultipartFile;


import com.google.gson.Gson;
import com.google.gson.JsonObject;

import kr.or.eum.member.model.service.MemberService;
import kr.or.eum.member.model.vo.Expert;
import kr.or.eum.member.model.vo.ExpertAndMember;
import kr.or.eum.product.model.service.ProductService;
import kr.or.eum.product.model.vo.Product;
import kr.or.eum.product.model.vo.ProductAndWishList;
import kr.or.eum.product.model.vo.ProductDetail;
import kr.or.eum.product.model.vo.ProductPageData;
import kr.or.eum.product.model.vo.Review;
import kr.or.eum.product.model.vo.ReviewPageData;
import kr.or.eum.product.model.vo.ProReviewMember;
import kr.or.eum.product.model.vo.Counsel;
import kr.or.eum.product.model.vo.Payment;

@Controller
public class ProductController{
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value="/ClassList.do")
	public String ClassList(int reqPage, String selPro, Model model, HttpServletRequest request) {
		ProductPageData ppd = productService.selectClassList(reqPage, selPro);

		model.addAttribute("list",ppd.getList());
		model.addAttribute("selPro", selPro);
		model.addAttribute("pageNavi",ppd.getPageNavi());
		model.addAttribute("reqPage", reqPage);
		System.out.println("selPro : "+selPro);
		
		HttpSession session = request.getSession(false);
        Member member = null;
        if(session != null) {
            member = (Member)session.getAttribute("member");
        }
        if(member != null) {
        	model.addAttribute("grade", member.getGrade());
			model.addAttribute("memberNo", member.getMemberNo());
			System.out.println("memberNo : "+member.getMemberNo());
			System.out.println("grade : "+member.getGrade());

		}else {
			model.addAttribute("memberNo", 0);
		}


		return "product/ClassList";
	}
	@RequestMapping(value="/classWriterFrm.do")
		public String classWriterFrm(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
        Member member = null;
        if(session != null) {
            member = (Member)session.getAttribute("member");
        }
        int memberNo = member.getMemberNo();
    
        Expert expert = productService.selectExpertNo(memberNo);
        model.addAttribute("memberNo", member.getMemberNo());
        model.addAttribute("expertNo", expert.getExpertNo());
        System.out.println("memberNo : "+member.getMemberNo());
        System.out.println("expert : "+expert);
        
 
		return "product/classWriterFrm";
	}
	
	@RequestMapping(value="/classWrite.do")
		public String classWrite(Product pro, MultipartFile file, HttpServletRequest request) {
		System.out.println(pro.getProductImgname());
		System.out.println(pro.getProductImgPath());
		System.out.println(file.getOriginalFilename());
		String savePath 
		= request.getSession().getServletContext().getRealPath("/img/product/ClassList/");
		
		//파일명이 기존파일과 겹치는 경우 기존파일을 삭제하고 새파일만 남는 현상이 생김(덮어쓰기)
		//파일명 중복처리 (뒤에 넘버를 붙인다든가..)
		//사용자가 업로드한 파일 이름
		String filename = file.getOriginalFilename();
		//test.txt -> text_1.text /  text_1.txt->text_2.txt 중복처리 로직
		//업로드한 파일명이 test.txt인경우 -> test / .txt 두부분으로 분리함
		//subString은 매개변수 두개면 첫번쨰부터 두번째까지 잘라서 반환
		//매개변수가 하나면 매개변수부터 잘라서 반환
		String onlyFilename = filename.substring(0, filename.lastIndexOf("."));
		String extension = filename.substring(filename.lastIndexOf("."));
		//실제 업로드할 파일명을 저장할 변수
		String filepath = null;
		//파일명 중복시 뒤에 붙일 숫자 변수
		int count = 0;
		while(true) {
			if(count == 0) {
				//반복 첫번째 회차에서는 원본파일명을 그대로 적용
				filepath = onlyFilename + extension; //test.txt
			}
			File checkFile = new File(savePath+filepath);
			if(!checkFile.exists()) { //경로에 파일이 존재하지않으면 (exists() method 사용)
				break; //겹치지않으면 >> while 문 종료
			}else {
				filepath = onlyFilename + "_" + count + extension;
			}
			count++; //존재하면 카운트를 ++ 하고 반복문 다시 실행
		}
		//파일명 중복검사했을때 경로에 중복 파일이 존재하지 않아서 while문나온시점
		//해당파일 업로드 작업
		try {
			//중복처리가 끝난파일명 (filepath)으로 파일을 업로드할 FileOutputStream객체 생성
			FileOutputStream fos = new FileOutputStream(new File(savePath+filepath));
			//업로드 속도증가를 위한 보조스트림 생성
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			//파일 업로드
			byte[] bytes = file.getBytes();
			bos.write(bytes);
			bos.close();
			
		}catch (FileNotFoundException e) {
			e.printStackTrace();
		}catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		pro.setProductImgname(filename);
		pro.setProductImgPath(filepath);
		
		System.out.println(pro);
		
		int result = productService.classWrite(pro);
		
		return "redirect:/ClassList.do?reqPage=1&selPro=전체";
		
	}
	
	@RequestMapping(value="/ExpertList.do")
	public String expertList(int reqPage, String selPro, Model model, HttpServletRequest request) {
		ProductPageData ppd = productService.selectExpertList(reqPage, selPro);
		model.addAttribute("list",ppd.getList());
		model.addAttribute("selPro", selPro);
		model.addAttribute("pageNavi",ppd.getPageNavi());
		model.addAttribute("reqPage", reqPage);
		System.out.println("selPro : "+selPro);
		
		HttpSession session = request.getSession(false);
        Member member = null;
        if(session != null) {
            member = (Member)session.getAttribute("member");
        }
        if(member != null) {
        	model.addAttribute("grade", member.getGrade());
			model.addAttribute("memberNo", member.getMemberNo());
			System.out.println("memberNo : "+member.getMemberNo());
			System.out.println("grade : "+member.getGrade());

		}else {
			model.addAttribute("memberNo", 0);
		}
		return "product/ExpertList";
	}
	
	@RequestMapping(value="/expertWriterFrm.do")
	public String expertWriterFrm(Model model, HttpServletRequest request) {
	HttpSession session = request.getSession(false);
    Member member = null;
    if(session != null) {
        member = (Member)session.getAttribute("member");
    }
    int memberNo = member.getMemberNo();
    Expert expert = productService.selectExpertNo(memberNo);
    model.addAttribute("expertNo", expert.getExpertNo());
    System.out.println("expert : "+expert);
	return "product/expertWriterFrm";
}

@RequestMapping(value="/expertWrite.do")
	public String expertWrite(Product pro, MultipartFile file, HttpServletRequest request) {
	System.out.println(pro.getProductImgname());
	System.out.println(pro.getProductImgPath());
	System.out.println(file.getOriginalFilename());
	String savePath 
	= request.getSession().getServletContext().getRealPath("/img/product/ExpertList/");
	
	//파일명이 기존파일과 겹치는 경우 기존파일을 삭제하고 새파일만 남는 현상이 생김(덮어쓰기)
	//파일명 중복처리 (뒤에 넘버를 붙인다든가..)
	//사용자가 업로드한 파일 이름
	String filename = file.getOriginalFilename();
	//test.txt -> text_1.text /  text_1.txt->text_2.txt 중복처리 로직
	//업로드한 파일명이 test.txt인경우 -> test / .txt 두부분으로 분리함
	//subString은 매개변수 두개면 첫번쨰부터 두번째까지 잘라서 반환
	//매개변수가 하나면 매개변수부터 잘라서 반환
	String onlyFilename = filename.substring(0, filename.lastIndexOf("."));
	String extension = filename.substring(filename.lastIndexOf("."));
	//실제 업로드할 파일명을 저장할 변수
	String filepath = null;
	//파일명 중복시 뒤에 붙일 숫자 변수
	int count = 0;
	while(true) {
		if(count == 0) {
			//반복 첫번째 회차에서는 원본파일명을 그대로 적용
			filepath = onlyFilename + extension; //test.txt
		}
		File checkFile = new File(savePath+filepath);
		if(!checkFile.exists()) { //경로에 파일이 존재하지않으면 (exists() method 사용)
			break; //겹치지않으면 >> while 문 종료
		}else {
			filepath = onlyFilename + "_" + count + extension;
		}
		count++; //존재하면 카운트를 ++ 하고 반복문 다시 실행
	}
	//파일명 중복검사했을때 경로에 중복 파일이 존재하지 않아서 while문나온시점
	//해당파일 업로드 작업
	try {
		//중복처리가 끝난파일명 (filepath)으로 파일을 업로드할 FileOutputStream객체 생성
		FileOutputStream fos = new FileOutputStream(new File(savePath+filepath));
		//업로드 속도증가를 위한 보조스트림 생성
		BufferedOutputStream bos = new BufferedOutputStream(fos);
		//파일 업로드
		byte[] bytes = file.getBytes();
		bos.write(bytes);
		bos.close();
		
	}catch (FileNotFoundException e) {
		e.printStackTrace();
	}catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	pro.setProductImgname(filename);
	pro.setProductImgPath(filepath);
	
	System.out.println(pro);
	
	int result = productService.expertWrite(pro);
	
	return "redirect:/ExpertList.do?reqPage=1&selPro=전체";
	
}	

@RequestMapping(value="/IdeamarketList.do")
public String IdeamarketList(int reqPage, String selPro, Model model, HttpServletRequest request) {
	ProductPageData ppd = productService.selectIdeamarketList(reqPage, selPro);

	model.addAttribute("list",ppd.getList());
	model.addAttribute("selPro", selPro);
	model.addAttribute("pageNavi",ppd.getPageNavi());
	model.addAttribute("reqPage", reqPage);
	System.out.println("selPro : "+selPro);

	return "product/IdeamarketList";
}
@RequestMapping(value="/ideamarketWriterFrm.do")
	public String ideamarketWriterFrm(HttpServletRequest request, Model model) {
	HttpSession session = request.getSession(false);
    Member member = null;
    if(session != null) {
        member = (Member)session.getAttribute("member");
    }
    int memberNo = member.getMemberNo();
    Expert expert = productService.selectExpertNo(memberNo);
    model.addAttribute("expertNo", expert.getExpertNo());
    System.out.println("expert : "+expert);
	return "product/ideamarketWriterFrm";
}

@RequestMapping(value="/ideamarketWrite.do")
	public String ideamarketWrite(Product pro, MultipartFile file, HttpServletRequest request) {
	System.out.println(pro.getProductImgname());
	System.out.println(pro.getProductImgPath());
	System.out.println(file.getOriginalFilename());
	String savePath 
	= request.getSession().getServletContext().getRealPath("/img/product/IdeamarketList/");
	
	//파일명이 기존파일과 겹치는 경우 기존파일을 삭제하고 새파일만 남는 현상이 생김(덮어쓰기)
	//파일명 중복처리 (뒤에 넘버를 붙인다든가..)
	//사용자가 업로드한 파일 이름
	String filename = file.getOriginalFilename();
	//test.txt -> text_1.text /  text_1.txt->text_2.txt 중복처리 로직
	//업로드한 파일명이 test.txt인경우 -> test / .txt 두부분으로 분리함
	//subString은 매개변수 두개면 첫번쨰부터 두번째까지 잘라서 반환
	//매개변수가 하나면 매개변수부터 잘라서 반환
	String onlyFilename = filename.substring(0, filename.lastIndexOf("."));
	String extension = filename.substring(filename.lastIndexOf("."));
	//실제 업로드할 파일명을 저장할 변수
	String filepath = null;
	//파일명 중복시 뒤에 붙일 숫자 변수
	int count = 0;
	while(true) {
		if(count == 0) {
			//반복 첫번째 회차에서는 원본파일명을 그대로 적용
			filepath = onlyFilename + extension; //test.txt
		}
		File checkFile = new File(savePath+filepath);
		if(!checkFile.exists()) { //경로에 파일이 존재하지않으면 (exists() method 사용)
			break; //겹치지않으면 >> while 문 종료
		}else {
			filepath = onlyFilename + "_" + count + extension;
		}
		count++; //존재하면 카운트를 ++ 하고 반복문 다시 실행
	}
	//파일명 중복검사했을때 경로에 중복 파일이 존재하지 않아서 while문나온시점
	//해당파일 업로드 작업
	try {
		//중복처리가 끝난파일명 (filepath)으로 파일을 업로드할 FileOutputStream객체 생성
		FileOutputStream fos = new FileOutputStream(new File(savePath+filepath));
		//업로드 속도증가를 위한 보조스트림 생성
		BufferedOutputStream bos = new BufferedOutputStream(fos);
		//파일 업로드
		byte[] bytes = file.getBytes();
		bos.write(bytes);
		bos.close();
		
	}catch (FileNotFoundException e) {
		e.printStackTrace();
	}catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	pro.setProductImgname(filename);
	pro.setProductImgPath(filepath);
	
	System.out.println(pro);
	
	int result = productService.ideamarketWrite(pro);
	
	return "redirect:/IdeamarketList.do?reqPage=1&selPro=전체";
	
}

	
	//윤지
	@RequestMapping(value = "/productDetail.do")
	public String productDetail(Model model, int productNo, int expertNo, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		Member member = null;
		if(session != null) {
			member = (Member)session.getAttribute("member");			
		}
		ProductDetail pd = productService.selectProductDetail(productNo, expertNo, member);
		model.addAttribute("p", pd.getProduct());
		model.addAttribute("productQNA", pd.getProductQNA());
		model.addAttribute("expert", pd.getExpert());
		model.addAttribute("expertM", pd.getExpertAndMember());
		model.addAttribute("reviewAvr", pd.getReviewAvr());
		model.addAttribute("reviewCount",pd.getReviewCount());
		model.addAttribute("paymentCount", pd.getPaymentCount());
		model.addAttribute("cost", pd.getCost());
		model.addAttribute("tag", pd.getTag());
		model.addAttribute("wishList", pd.getWishList());
		model.addAttribute("wishCount", pd.getWishCount());
		if(member != null) {
			model.addAttribute("memberNo", member.getMemberNo());			
		}else {
			model.addAttribute("memberNo", 0);
		}
		model.addAttribute("wishMemberCheck", pd.getWishMemberCheck());
		System.out.println("--------------------------------------");
		System.out.println("product : "+pd.getProduct());
		System.out.println("expert : "+pd.getExpert());
		System.out.println("expertM : "+pd.getExpertAndMember());
		System.out.println("reviewRnum : "+pd.getReviewRnum());
		System.out.println("reviewAvr : "+pd.getReviewAvr());
		System.out.println("reviewCount : "+pd.getReviewCount());
		System.out.println("payment : "+pd.getPaymentCount());
		System.out.println("cost : "+pd.getCost());
		System.out.println("wishList :"+pd.getWishList());
		System.out.println("wishCount : "+pd.getWishCount());
		if(member != null) {
			System.out.println("memberNo : "+member.getMemberNo());
		}
		System.out.println("wishMemberCheck : "+pd.getWishMemberCheck());
		System.out.println("--------------------------------------");
		return "product/productDetail";
	}
	
	//윤지
	@RequestMapping(value = "/imgVerProductDetail.do")
	public String imgVerProductDetail(Model model, int productNo, int expertNo, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		Member member = null;
		if(session != null) {
			member = (Member)session.getAttribute("member");			
		}
		ProductDetail pd = productService.selectProductDetail(productNo, expertNo, member);
		model.addAttribute("p", pd.getProduct());
		model.addAttribute("productQNA", pd.getProductQNA());
		model.addAttribute("expert", pd.getExpert());
		model.addAttribute("expertM", pd.getExpertAndMember());
		model.addAttribute("reviewAvr", pd.getReviewAvr());
		model.addAttribute("reviewCount",pd.getReviewCount());
		model.addAttribute("paymentCount", pd.getPaymentCount());
		model.addAttribute("cost", pd.getCost());
		model.addAttribute("tag", pd.getTag());
		model.addAttribute("wishList", pd.getWishList());
		model.addAttribute("wishCount", pd.getWishCount());
		if(member != null) {
			model.addAttribute("memberNo", member.getMemberNo());			
		}else {
			model.addAttribute("memberNo", 0);
		}
		model.addAttribute("wishMemberCheck", pd.getWishMemberCheck());
		return "product/imgVerProductDetail";
	}
	
	//윤지
	@ResponseBody
	@RequestMapping(value = "/review.do", produces = "application/json;charset=utf-8")
	public String productReview(Model model, int productNo, int reqPage){
		ReviewPageData rpd = productService.selectReviewList(productNo, reqPage);
		return new Gson().toJson(rpd);
	}
	
	
	@RequestMapping(value = "/purchase.do")
	public String purchase(int productNo, int expertNo, Model model) {
		//1.상품정보불러오기(product_type:1,2,3구분)
		System.out.println(productNo);
		System.out.println("expertNo>>>>"+expertNo);
		//HashMap<String, Object> paymentpage = productService.selectProduct(productNo);
		/*
		Product p = productService.selectProduct(productNo);
		System.out.println(p);		
		model.addAttribute("productNo",p.getProductNo());
		model.addAttribute("expertNo",expertNo);
		model.addAttribute("productType",p.getProductType());
		model.addAttribute("productTitle",p.getProductTitle());
		model.addAttribute("productNo",p.getProductNo());
		model.addAttribute("productCategory",p.getProductCategory());
		model.addAttribute("productIntro",p.getProductIntro());
		model.addAttribute("productTag",p.getProductTag());
		model.addAttribute("productContent",p.getProductContent());
		model.addAttribute("cost",p.getCost());
		model.addAttribute("productQst",p.getProductQst());
		model.addAttribute("productAns",p.getProductAns());
		model.addAttribute("productAddr",p.getProductAddr());
		model.addAttribute("sale",p.getSale());
		model.addAttribute("salecost",p.getSalecost());
		model.addAttribute("reviewStar",p.getReviewStar());
		model.addAttribute("revCount",p.getRevCount());
		model.addAttribute("productOption",p.getProductOption());
		model.addAttribute("productImgname",p.getProductImgname());
		model.addAttribute("productImagPath",p.getProductImgPath());
		model.addAttribute("memberPicturepath",p.getMemberPicturepath());
		*/
		return "product/payment";
	}
	
	//윤지
	@ResponseBody
	@RequestMapping(value = "/insertWish.do", produces = "application/json;charset=utf-8")
	public String insertWish(int productNo, int memberNo) {
		System.out.println("-------insertWish");
		System.out.println("productNo : "+productNo);
		System.out.println("memberNo : "+memberNo);
		int result = productService.insertWish(productNo, memberNo);
		System.out.println("result : "+result);
		int afterWishCount = productService.afterWishCount(productNo);
		return new Gson().toJson(afterWishCount);
		
	}
	
	//윤지
	@ResponseBody
	@RequestMapping(value = "/deleteWish.do", produces = "application/json;charset=utf-8")
	public String deleteWish(int productNo, int memberNo) {
		System.out.println("-------deleteWish");
		System.out.println("productNo : "+productNo);
		System.out.println("memberNo : "+memberNo);
		int result = productService.deleteWish(productNo, memberNo);
		System.out.println("result : "+result);
		int afterWishCount = productService.afterWishCount(productNo);
		return new Gson().toJson(afterWishCount);
	}
	
	//윤지
	@RequestMapping(value = "/expertCounsel.do")
	public String expertCounsel(Model model, int payNo, HttpServletRequest request) {
		HashMap<String, Object> compare = productService.compareMemberNo(payNo, request);
		System.out.println(compare.get("expertTrue"));
		System.out.println(compare.get("memberTrue"));
		if(compare.get("expertTrue").equals(false) && compare.get("memberTrue").equals(false)) {
			return "product/paymentError";
		}
		model.addAttribute("m", compare.get("member"));
		HashMap<String, Object> map = productService.selectProductAndExpertAndPayment(payNo);
		model.addAttribute("p", map.get("product"));
		model.addAttribute("e", map.get("expert"));
		model.addAttribute("em", map.get("expertM"));
		model.addAttribute("pay", map.get("payment"));
		model.addAttribute("r", map.get("review"));
		model.addAttribute("c", map.get("counsel"));
		model.addAttribute("chat", map.get("chatList"));
		model.addAttribute("firstDate", map.get("first"));
		if(!map.get("paymentState").equals(1) && !map.get("paymentState").equals(2)) {
			return "product/paymentError";
		}
		System.out.println("Counsel_member : "+compare.get("member"));
		System.out.println("Counsel_product : "+map.get("product"));
		System.out.println("Counsel_expert : "+map.get("expert"));
		System.out.println("Counsel_expertM : "+map.get("expertM"));
		System.out.println("Counsel_payment : "+map.get("payment"));
		System.out.println("Counsel_review : "+map.get("review"));
		System.out.println("Counsel_counsel : "+map.get("counsel"));
		System.out.println("Counsel_chat : "+map.get("chatList"));
		System.out.println("Counsel_firstDate : "+map.get("first"));
		
		return "product/expertCounsel";
	}
	
	//윤지
	@ResponseBody
	@RequestMapping(value = "updatePaymentState.do")
	public String updatePaymentState(int counselNo) {
		int result = productService.updatePaymentState(counselNo);
		return new Gson().toJson(result);
	}
	
	//윤지
	@RequestMapping(value = "/reviewFrm.do")
	public String reviewFrm(Model model, int payNo, HttpServletRequest request) {
		Boolean compare = productService.reviewMemberCompare(payNo, request);
		if(compare == false) {
			return "product/paymentError";
		}
		HttpSession session = request.getSession(false);
		Member member = null;
		if(session != null) {
			member = (Member)session.getAttribute("member");
		}	
		HashMap<String, Object> map = productService.reviewFrm(payNo);
		model.addAttribute("pro", map.get("product"));
		model.addAttribute("e", map.get("expert"));
		model.addAttribute("em", map.get("expertM"));
		model.addAttribute("pay", map.get("payment"));
		model.addAttribute("m", member);
		return "product/reviewFrm";
	}
	
	//대권 구매성공
	@RequestMapping(value="/purchaseSuccess.do")
	public String purchaseSuccess() {
		return "product/purchaseSuccess";
	}
	//대권 구매실패
	@RequestMapping(value="/purchaseFailed.do")
	public String purchaseFailed() {
		return "product/purchaseFailed";
	}
	
	//윤지
	@ResponseBody
	@RequestMapping(value = "/insertReview.do")
	public String insertReview(Review review) {
		//서비스를 한번만...
		//int check = productService.overlapCheckReview(review.getPayNo());
		int result = productService.insertReview(review, review.getPayNo());
		return new Gson().toJson(result);				
	}
	
	//윤지
	@RequestMapping(value = "/modifyReviewFrm.do")
	public String modifyReview(Model model, int reviewNo) {
		HashMap<String, Object> map= productService.selectReview(reviewNo);
		model.addAttribute("r", map.get("review"));
		model.addAttribute("p", map.get("product"));
		model.addAttribute("e", map.get("expertM"));
		return "product/modifyReviewFrm";
	}
	
	//윤지
	@ResponseBody
	@RequestMapping(value = "/updateReview.do")
	public String updateReview(Review review) {
		System.out.println("updateReview : "+review);
		int result = productService.updateReview(review);
		System.out.println(result);
		return new Gson().toJson(result);
	}
	
	//윤지
	@ResponseBody
	@RequestMapping(value = "/deleteReview.do")
	public String deleteReview(int reviewNo) {
		int result = productService.deleteReview(reviewNo);
		System.out.println(result);
		return new Gson().toJson(result);
	}
	
	//윤지
	@ResponseBody
	@RequestMapping(value = "updateStartTime.do")
	public String updateStartTime(String startTime, int counselNo) {
		int result = productService.updateStartTime(startTime, counselNo);
		System.out.println(result);
		System.out.println(startTime);
		return new Gson().toJson(startTime);
	}
	
	
	@ResponseBody
	@RequestMapping(value = "updateReadCheck.do")
	public String updateReadCheck(String counselNo, String memberNo) {
		int readResult = productService.updateReadCheck(counselNo, memberNo);
		return new Gson().toJson(readResult);
	}
	
	@ResponseBody
	@RequestMapping(value = "/indexPageData.do" , produces = "application/json;charset=utf-8")
	public String indexPageData() {
		ArrayList<Product> list = productService.selectPopular();
		return new Gson().toJson(list);
	}
	
}



