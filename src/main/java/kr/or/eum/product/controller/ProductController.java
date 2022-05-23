package kr.or.eum.product.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.eum.product.model.service.ProductService;
import kr.or.eum.product.model.vo.Product;

@Controller
public class ProductController {
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value="/ClassList.do")
	public String productList(Model model) {
		ArrayList<Product> list = productService.selectProductList();
		model.addAttribute("list",list);
		System.out.println("리스트: "+list);
		return "product/ClassList";
	}
	@RequestMapping(value = "/productDetail.do")
	public String productDetail() {
		return "product/productDetail";
	} //jsp로 이동하기 위한 임시 비즈니스로직, 재건님이 로직짜고 삭제해주세요.
}
