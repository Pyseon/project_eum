package kr.or.eum.product.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import kr.or.eum.product.model.dao.ProductDao;
import kr.or.eum.product.model.vo.Payment;
import kr.or.eum.product.model.vo.Product;
import kr.or.eum.product.model.vo.ProductPageData;
import kr.or.eum.product.model.vo.Review;


@Service
@Transactional
public class ProductService {
	@Autowired
	private ProductDao productDao;
	
	public ProductPageData selectProductList(int reqPage, String selPro) {
		int numPerPage = 12;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("selPro", selPro);
		ArrayList<Product> list = productDao.selectProductList(map);
		
		int totalCount = productDao.selectProductCount(map);
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage + 1;
		}
		int pageNaviSize = 5;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		
		String pageNavi = "<ul class='pagination'>";
		if(pageNo != 1) { 
			
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/ClassList.do?reqPage="+(pageNo-1)+"&selPro="+selPro+"'>";
			pageNavi += "<span class='material-icons'>chevron_left</span>";
			pageNavi += "</a></li>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item active-page' href='/ClassList.do?reqPage="+pageNo+"&selPro="+selPro+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}else {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item' href='/ClassList.do?reqPage="+pageNo+"&selPro="+selPro+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/ClassList.do?reqPage="+pageNo+"&selPro="+selPro+"'>";
			pageNavi += "<span class='material-icons'>chevron_right</span>";
			pageNavi += "</a></li>";
			
		}
		pageNavi += "</ul>";
		ProductPageData ppd = new ProductPageData(list, pageNavi);	
					 
		return ppd;
		
	}
	
	//윤지
	public Product selectOneProduct(int productNo) {
		return productDao.selectOneProduct(productNo);
	}
	//윤지
	public ArrayList<Review> selectAllReview() {
		return productDao.selectAllReview();
	}
	
	//윤지
	public int selectReviewCount() {
		return productDao.selectReviewCount();
	}
	//윤지
	public int selectReviewStar() {
		return productDao.selectReviewStar();
	}
	//윤지
	public int selectPaymentExpertNoCount(int productNo) {
		return productDao.selectPaymentExpertNoCount(productNo);
	}

}
