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
	public String productList(int reqPage, Model model) {
		ProductPageData ppd = productService.selectProductList(reqPage);
		model.addAttribute("list",ppd.getList());
		model.addAttribute("pageNavi",ppd.getPageNavi());
		model.addAttribute("reqPage", reqPage);
		System.out.println("리스트: "+ppd.getList());
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
		System.out.println(expertNo);
		System.out.println(expertAndCom);
		ExpertAndMember expertPicture = memberService.selectOneExpertPicture(expertNo);
		ArrayList<Review> review = productService.selectAllReview();
		int reviewCount = productService.selectReviewCount();
		model.addAttribute("p", product);
		model.addAttribute("qst", productQst);
		model.addAttribute("ans", productAns);
		model.addAttribute("expert", expertAndCom);
		model.addAttribute("picture", expertPicture);
		model.addAttribute("review", review);
		model.addAttribute("reviewCount",reviewCount);
		return "product/productDetail";
	}
	
	
}
