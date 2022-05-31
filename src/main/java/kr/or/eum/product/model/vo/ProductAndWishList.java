package kr.or.eum.product.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ProductAndWishList {
	private int productNo;
	private String productTitle;
	private int wishNo;
	private int memberNo;
	private int expertNo;
	private int productType;
}
