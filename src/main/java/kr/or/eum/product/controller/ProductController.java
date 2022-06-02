package kr.or.eum.product.controller;

import kr.or.eum.member.model.vo.Member;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
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
import kr.or.eum.member.model.vo.ExpertAndCompany;
import kr.or.eum.member.model.vo.ExpertAndMember;
import kr.or.eum.product.model.service.ProductService;
import kr.or.eum.product.model.vo.Product;
import kr.or.eum.product.model.vo.ProductAndWishList;
import kr.or.eum.product.model.vo.ProductDetail;
import kr.or.eum.product.model.vo.ProductPageData;
import kr.or.eum.product.model.vo.Review;
import kr.or.eum.product.model.vo.ReviewPageData;
import kr.or.eum.product.model.vo.ProReviewMember;
import kr.or.eum.product.model.vo.Payment;

@Controller
public class ProductController{
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value="/ClassList.do")
	public String productList(int reqPage, String selPro, Model model) {
		ProductPageData ppd = productService.selectClassList(reqPage, selPro);
		model.addAttribute("list",ppd.getList());
		model.addAttribute("selPro", selPro);
		model.addAttribute("pageNavi",ppd.getPageNavi());
		model.addAttribute("reqPage", reqPage);
		System.out.println("selPro : "+selPro);
		return "product/ClassList";
	}
	@RequestMapping(value="/productWriter.do")
		public String productWriter() {
		return "product/productWriter";
	}
	/*
	@ResponseBody
	@RequestMapping(value="/uploadSummernoteImageFile.do", produces="application/json; charset=utf8")
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
		
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot+"resources/fileupload/";
		
		String originalFileName = multipartFile.getOriginalFilename();
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
		
		String savedFileName = UUID.randomUUID() + extension;
		File targetFile = new File(fileRoot + savedFileName);
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);
			jsonObject.addProperty("url", "/summernote/resources/fileupload/"+savedFileName);
			jsonObject.addProperty("responseCode", "success");
			
	} catch (IOException e) {
		FileUtils.deleteQuietly(targetFile);
		jsonObject.addProperty("responseCode", "error");
		e.printStackTrace();
	}
		String a = jsonObject.toString();
		return a;
	}
	*/
	
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
		model.addAttribute("expertAndCom", pd.getExpertAndCompany());
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
		System.out.println("expertAndCom : "+pd.getExpertAndCompany());
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
		model.addAttribute("expertAndCom", pd.getExpertAndCompany());
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
	
	//윤지 return값 대권님이 만들 페이지로 수정 필요
	@RequestMapping(value = "/purchase.do")
	public String purchase(int productNo) {
		System.out.println(productNo);
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
	public String expertCounsel(Model model, int productNo, int expertNo, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		Member member = null;
		if(session != null) {
			member = (Member)session.getAttribute("member");			
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		map = productService.selectProductAndExpert(productNo, expertNo);
		model.addAttribute("p", map.get("product"));
		model.addAttribute("e", map.get("expert"));
		model.addAttribute("ec", map.get("expertC"));
		model.addAttribute("em", map.get("expertM"));
		model.addAttribute("m", member);
		System.out.println("Counsel_product : "+map.get("product"));
		System.out.println("Counsel_expert : "+map.get("expert"));
		System.out.println("Counsel_expertC : "+map.get("expertC"));
		System.out.println("Counsel_expertM : "+map.get("expertM"));
		System.out.println("counsel_member : "+member);
		return "product/expertCounsel";
	}
	
	
}



