package kr.or.eum.product.controller;

import kr.or.eum.member.model.vo.Member;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.google.gson.Gson;

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
public class ProductController {
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value="/ClassList.do")
	public String productList(int reqPage, String selPro, Model model) {
		ProductPageData ppd = productService.selectProductList(reqPage, selPro);
		model.addAttribute("list",ppd.getList());
		model.addAttribute("selPro", selPro);
		model.addAttribute("pageNavi",ppd.getPageNavi());
		model.addAttribute("reqPage", reqPage);
		System.out.println("selPro : "+selPro);
		return "product/ClassList";
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
		model.addAttribute("expertAndCom", pd.getExpertAndCompany());
		model.addAttribute("expert", pd.getExpert());
		model.addAttribute("expertM", pd.getExpertAndMember());
		model.addAttribute("reviewAvr", pd.getReviewAvr());
		model.addAttribute("reviewCount",pd.getReviewCount());
		model.addAttribute("paymentCount", pd.getPaymentCount());
		//model.addAttribute("prm",pd.getPrm());
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
		//System.out.println("prm : "+pd.getPrm());
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
	
	@RequestMapping("/imgVerproductDetail.do")
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
		//model.addAttribute("prm",pd.getPrm());
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
	
	//윤지
	@RequestMapping(value = "/expertCounsel.do")
	public String expertCounsel() {
		return "product/expertCounsel";
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
	
	
}
