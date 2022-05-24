package kr.or.eum.product.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.eum.product.model.dao.ProductDao;
import kr.or.eum.product.model.vo.Product;

@Service
@Transactional
public class ProductService {
	@Autowired
	private ProductDao productDao;
	
	public ArrayList<Product> selectProductList() {
		return productDao.selectProductList();
	}

}
