package kr.or.eum.product.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Product {
	
	private int productNo;
	private int memberNo;
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
	private int salecost;
	private double reviewStar;
	private int revCount;
	private int productOption;
	private String productImgname;
	private String  productImgPath;
	private String memberPicturepath;
	private int marketNo;
	private int marketType;
	private String marketPath;
	private String marketName;
	

}
