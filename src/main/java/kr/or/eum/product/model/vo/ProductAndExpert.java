package kr.or.eum.product.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ProductAndExpert {
	private int memberNo;
	private int expertNo;
	private int productNo;
	private String productTitle;
	private String productImgPath;
	private String productIntro;
	private String expertName;
	
}
