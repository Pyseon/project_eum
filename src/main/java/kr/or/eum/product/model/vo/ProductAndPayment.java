package kr.or.eum.product.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ProductAndPayment {
	private int productNo;
	private String productTitle;
	private String productImgPath;
	private String payState;
	private int payMent;
	private String payDate;
	private int productType;
	private int memberNo;
	private int payNo;

	private String marketPath;
	private String marketName;

}
