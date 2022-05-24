package kr.or.eum.product.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.eum.member.model.service.MemberService;
import kr.or.eum.member.model.vo.Expert;
import kr.or.eum.product.model.service.ProductService;
import kr.or.eum.product.model.vo.Product;

@Controller
public class ProductController {
	@Autowired
	private ProductService productService;
	@Autowired
	private MemberService memberservice;
	
	@RequestMapping(value="/ClassList.do")
	public String productList(Model model) {
		ArrayList<Product> list = productService.selectProductList();
		model.addAttribute("list",list);
		System.out.println("리스트: "+list);
		return "product/ClassList";
	}
	
	//윤지
	@RequestMapping(value = "/productDetail.do")
	public String productDetail(Model model, int productNo, int expertNo) {
		Product product = productService.selectOneProduct(productNo);
		Expert expert = memberservice.selectOneExpert(expertNo);
		model.addAttribute("product", product);
		model.addAttribute("expert", expert);
		System.out.println(expert.getExpertName());
		System.out.println(expert.getExpertEmail());
		return "product/productDetail";
	}
}
