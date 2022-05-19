package kr.or.eum.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.eum.product.model.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	private ProductService productService;
}
