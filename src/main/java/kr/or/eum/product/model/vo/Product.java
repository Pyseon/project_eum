package kr.or.eum.product.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Product {
	
	private int productNo;
	private int expertNo;
	private int productType;
	private int productTitle;
	private String productCategory;
	private String productIntro;
	private String productTag;
	private String productContent;
	private String cost;
	private String productQst;
	private String productAns;
	private String productAddr;
	private int sale;

}
