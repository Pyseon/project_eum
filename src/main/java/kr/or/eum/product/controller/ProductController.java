package kr.or.eum.product.controller;

import java.lang.reflect.Member;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
		model.addAttribute("pageNavi",ppd.getPageNavi());
		model.addAttribute("reqPage", reqPage);
		return "product/ClassList";
	}
	
	//윤지
	@RequestMapping(value = "/productDetail.do")
	public String productDetail(Model model, int productNo, int expertNo) {
		ProductDetail pd = productService.selectProductDetail(productNo, expertNo);
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
		System.out.println("--------------------------------------");
		return "product/productDetail";
	}
	//윤지
	@ResponseBody
	@RequestMapping(value = "/review.do")
	public String productReview(Model model, int productNo, int reqPage){
		ReviewPageData rpd = productService.selectReviewList(productNo, reqPage);
		System.out.println(new Gson().toJson(rpd.getPrm()));
		return new Gson().toJson(rpd.getPrm());
	}
	
	//윤지
	@RequestMapping(value = "/expertCounsel.do")
	public String expertCounsel() {
		return "product/expertCounsel";
	}
	
	
}
