package kr.or.eum.product.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ProductAndEtc {
	private int productNo;
	private String productTitle;
	private int productType;
	private String productCategory;
	private int expertNo;
	private String productIntro;
	private int cost;
	private int sale;
	private String productImgPath;
	private int wishCount;
	private double revscore;
}
