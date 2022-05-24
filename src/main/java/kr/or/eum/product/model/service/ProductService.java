package kr.or.eum.product.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.eum.product.model.dao.ProductDao;
import kr.or.eum.product.model.vo.Product;
import kr.or.eum.product.model.vo.Review;

@Service
@Transactional
public class ProductService {
	@Autowired
	private ProductDao productDao;
	
	public ArrayList<Product> selectProductList() {
		return productDao.selectProductList();
	}
	
	//윤지
	public Product selectOneProduct(int productNo) {
		return productDao.selectOneProduct(productNo);
	}
	//윤지
	public ArrayList<Review> selectAllReview() {
		return productDao.selectAllReview();
	}

}
