package kr.or.eum.product.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ProductAndPayAndwish {
	private String productTitle;
	private String wishNo;
	private String productNo;
	private String memberNo;
	private String productImgPath;
	private String productType;
	private String expertNo;
}
