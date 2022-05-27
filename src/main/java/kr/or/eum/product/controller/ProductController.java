package kr.or.eum.product.controller;

import java.lang.reflect.Member;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.eum.member.model.service.MemberService;
import kr.or.eum.member.model.vo.Expert;
import kr.or.eum.member.model.vo.ExpertAndCompany;
import kr.or.eum.member.model.vo.ExpertAndMember;
import kr.or.eum.product.model.service.ProductService;
import kr.or.eum.product.model.vo.Product;
import kr.or.eum.product.model.vo.ProductAndWishList;
import kr.or.eum.product.model.vo.ProductPageData;
import kr.or.eum.product.model.vo.Review;
import kr.or.eum.product.model.vo.ProReviewMember;
import kr.or.eum.product.model.vo.Payment;

@Controller
public class ProductController {
	@Autowired
	private ProductService productService;
	@Autowired
	private MemberService memberService;
	
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
		Product product = productService.selectOneProduct(productNo);
		String productQst[] = product.getProductQst().split("/");
		String productAns[] = product.getProductAns().split("/");
		ArrayList<String> productQNA = new ArrayList<String>();
		for(int i = 0; i < productQst.length; i++) {
			productQNA.add("Q"+(i+1)+". "+productQst[i]);
			productQNA.add("A"+(i+1)+". "+productAns[i]);
		}
		ExpertAndCompany expertAndCom = memberService.selectOneExpert(expertNo);
		Expert expert = memberService.selectOneExpertOnly(expertNo);
		ExpertAndMember expertM = memberService.selectOneExpertPicture(expertNo);
		ArrayList<Review> reviewRnum = productService.selectAllReview(productNo);
		double reviewAvrbef = productService.selectReviewStar(productNo);
		String reviewAvr = String.format("%.1f", reviewAvrbef);
		int reviewCount = productService.selectReviewCount(productNo);
		int paymentCount = productService.selectPaymentExpertNoCount(productNo);
		ArrayList<ProReviewMember> prm = productService.selectReviewList(productNo); 
		int cost = product.getCost()*product.getSale()/100;
		String tag[] = product.getProductTag().split("/");
		ArrayList<ProductAndWishList> wishList = productService.selectWishList();

		model.addAttribute("p", product);
		model.addAttribute("productQNA", productQNA);
		model.addAttribute("expertAndCom", expertAndCom);
		model.addAttribute("expert", expert);
		model.addAttribute("expertM", expertM);
		model.addAttribute("review", reviewRnum);
		model.addAttribute("reviewAvr", reviewAvr);
		model.addAttribute("reviewCount",reviewCount);
		model.addAttribute("paymentCount", paymentCount);
		model.addAttribute("prm",prm);
		model.addAttribute("cost", cost);
		model.addAttribute("tag", tag);
		model.addAttribute("wishList",wishList);
		System.out.println("product : "+product);
		System.out.println("expertAndCom : "+expertAndCom);
		System.out.println("expert : "+expert);
		System.out.println("expertM : "+expertM);
		System.out.println("reviewRnum : "+reviewRnum);
		System.out.println("reviewAvr : "+reviewAvr);
		System.out.println("reviewCount : "+reviewCount);
		System.out.println("payment : "+paymentCount);
		System.out.println("prm : "+prm);
		System.out.println("cost : "+cost);
		System.out.println("wishList :"+wishList);
		return "product/productDetail";
	}
	
	//윤지
	@RequestMapping(value = "/expertCounsel.do")
	public String expertCounsel() {
		return "product/expertCounsel";
	}
	
	
}
