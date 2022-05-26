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
import kr.or.eum.product.model.vo.ProductPageData;
import kr.or.eum.product.model.vo.Review;
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
		ExpertAndCompany expertAndCom = memberService.selectOneExpert(expertNo);
		Expert expert = memberService.selectOneExpertOnly(expertNo);
		ExpertAndMember expertM = memberService.selectOneExpertPicture(expertNo);
		ArrayList<Review> review = productService.selectAllReview();
		int reviewAvrBef = productService.selectReviewStar();
		double reviewAvr = Math.round(reviewAvrBef*1.0);
		int reviewCount = productService.selectReviewCount();
		int paymentCount = productService.selectPaymentExpertNoCount(productNo);
		int cost = product.getCost()*product.getSale()/100;
		model.addAttribute("p", product);
		model.addAttribute("qst", productQst);
		model.addAttribute("ans", productAns);
		model.addAttribute("expertAndCom", expertAndCom);
		model.addAttribute("expert", expert);
		model.addAttribute("expertM", expertM);
		model.addAttribute("review", review);
		model.addAttribute("reviewAvr", reviewAvr);
		model.addAttribute("reviewCount",reviewCount);
		model.addAttribute("paymentCount", paymentCount);
		model.addAttribute("cost", cost);
		System.out.println(product);
		System.out.println(productQst);
		System.out.println(productAns);
		System.out.println(expertAndCom);
		System.out.println(expert);
		System.out.println(expertM);
		System.out.println(review);
		System.out.println(reviewAvr);
		System.out.println(reviewCount);
		System.out.println(paymentCount);
		System.out.println(cost);
		return "product/productDetail";
	}
	
	
}
