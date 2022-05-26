package kr.or.eum.product.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ProAndPayAndReview {
	
	private int productNo;
	private int expertNo;
	private int productType;
	private String expertName;
	private String productTitle;
	private String productCategory;
	private String productIntro;
	private String productTag;
	private String productContent;
	private int cost;
	private String productQst;
	private String productAns;
	private String productAddr;
	private int sale;
	private int productOption;
	private int payNo;
	private int memberNo;
	private int payState;
	private String payMethod;
	private String payDate;
	private int payment;
	private int payUsepoint;
	private int payAddpoint;
	private String reviewNo;
	private String reviewContent;
	private int reviewStar;
	private String reviewDate;

}
