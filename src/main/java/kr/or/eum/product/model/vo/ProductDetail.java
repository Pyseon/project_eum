package kr.or.eum.product.model.vo;

import java.util.ArrayList;

import kr.or.eum.member.model.vo.Expert;
import kr.or.eum.member.model.vo.ExpertAndMember;
import kr.or.eum.wishlist.model.vo.Wishlist;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ProductDetail {
	private Product product;
	private ArrayList<String> productQNA;
	private Expert expert;
	private ExpertAndMember expertAndMember;
	private ArrayList<Review> reviewRnum;
	private String reviewAvr;
	private int reviewCount;
	private int paymentCount;
	private int cost;
	private String[] tag;
	private ArrayList<ProductAndWishList> wishList;
	private int wishCount;
	private int wishMemberCheck;
	
}

