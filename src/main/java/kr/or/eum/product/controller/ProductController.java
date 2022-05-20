package kr.or.eum.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.eum.product.model.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "/productDetail.do")
	public String productDetail() {
		return "product/productDetail";
	} //jsp로 이동하기 위한 임시 비즈니스로직, 재건님이 로직짜고 삭제해주세요.
}
