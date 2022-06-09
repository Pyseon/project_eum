package kr.or.eum.product.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ProductAndExpertDetail {

	private int memberNo;
	private int expertNo;
	private String productNo;
	private String productCategory;
	private String productTitle;
	private String productIntro;
	private String productContent;
	private int cost;
	private String productQst;
	private String productAns;
	private String productTag;
	
}
