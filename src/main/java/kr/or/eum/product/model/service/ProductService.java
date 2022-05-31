package kr.or.eum.product.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.eum.product.model.vo.ProductAndWishList;
import kr.or.eum.product.model.vo.ProductDetail;
import kr.or.eum.member.model.dao.MemberDao;
import kr.or.eum.member.model.vo.Expert;
import kr.or.eum.member.model.vo.ExpertAndCompany;
import kr.or.eum.member.model.vo.ExpertAndMember;
import kr.or.eum.member.model.vo.Member;
import kr.or.eum.product.model.dao.ProductDao;
import kr.or.eum.product.model.vo.Payment;
import kr.or.eum.product.model.vo.Product;
import kr.or.eum.product.model.vo.ProductPageData;
import kr.or.eum.product.model.vo.Review;
import kr.or.eum.product.model.vo.ReviewPageData;
import kr.or.eum.wishlist.model.vo.Wishlist;
import kr.or.eum.product.model.vo.ProReviewMember;


@Service
@Transactional
public class ProductService {
	@Autowired
	private ProductDao productDao;
	@Autowired
	private MemberDao memberDao;
	
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
	public ProductDetail selectProductDetail(int productNo, int expertNo, Member member) {
		Product product = productDao.selectOneProduct(productNo);
		ArrayList<String> productQNA = new ArrayList<String>();
		if(product.getProductQst() != null) {
			String productQst[] = product.getProductQst().split("/");
			String productAns[] = product.getProductAns().split("/");
			for(int i = 0; i < productQst.length; i++) {
				productQNA.add("Q"+(i+1)+". "+productQst[i]);
				productQNA.add("A"+(i+1)+". "+productAns[i]);
			}
		}
		ExpertAndCompany expertAndCom = memberDao.selectOneExpert(expertNo);
		Expert expert = memberDao.selectOneExpertOnly(expertNo);
		ExpertAndMember expertM = memberDao.selectOneExpertPicture(expertNo);
		ArrayList<Review> reviewRnum = productDao.selectAllReview(productNo);
		double reviewAvrbef = productDao.selectReviewStar(productNo); //null일 때 double로 resulttype 달라해서 에러
		String reviewAvr = "";
		if(reviewAvrbef != 0) {
			reviewAvr = String.format("%.1f", reviewAvrbef);			
		}
		int reviewCount = productDao.selectReviewCount(productNo);
		int paymentCount = productDao.selectPaymentExpertNoCount(productNo);
		//ArrayList<ProReviewMember> prm = productDao.selectReviewList(productNo); 
		int cost = product.getCost()*product.getSale()/100;
		String[] tag = product.getProductTag().split("/");
		ArrayList<ProductAndWishList> wishList = productDao.selectWishList();
		int wishCount = productDao.selectwish(productNo);
		ProductDetail pd = new ProductDetail(product, productQNA, expertAndCom, expert, expertM, reviewRnum, reviewAvr, reviewCount, paymentCount, cost, tag, wishList, wishCount);
		return pd;
	}//selectProductDetail
	
	//윤지
	public ReviewPageData selectReviewList(int productNo,int reqPage) {
		int numPerPage = 5;
		int end = reqPage*numPerPage;
		int start = end - numPerPage + 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("productNo", productNo);
		map.put("start", start);
		map.put("end", end);
		
		ArrayList<ProReviewMember> list = productDao.selectReviewList(map); 
		System.out.println(list);
		//전체 페이지 계산을 위한 전체 게시물 수 조회
		int totalCount = productDao.selectReviewCount(productNo);
		
		//전체페이지 수
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage + 1;
		}
		//페이지 네비게이션의 길이 지정
		int pageNaviSize = 5;
		//페이지 모양 지정
		//1~5페이지 요청시 > 1 2 3 4 5
		//6~10페이지 요청시 > 6 7 8 9 10
		//페이지 네비게이션 시작번호 계산
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
		
		String pageNavi = "<ul class='pagination'>";
		//이전버튼
		if(pageNo != 1) {
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' data-page='"+(pageNo-1)+"'>";
			pageNavi += "<span class='meterial-icons'>chevron_left</span>";
			pageNavi += "</a></li>";
			//html '' 자바 ""
		}
		//페이지숫자
		for(int i = 0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item active-page' data-page='"+pageNo+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}else {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item' data-page='"+pageNo+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		//다음버튼
		if(pageNo<=totalPage) {
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' data-page='"+(pageNo+1)+"'>";
			pageNavi += "<span class='meterial-icons'>chevron_right</span>";
			pageNavi += "</a></li>";
		}
		pageNavi += "</ul>";
		ReviewPageData rpd = new ReviewPageData(list, pageNavi);
		
		return rpd;
	}//selectReviewList
	

}
