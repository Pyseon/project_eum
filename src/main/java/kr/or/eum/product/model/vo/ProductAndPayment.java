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
	private String payState;
	private int payMent;
	private String payDate;
	private int productType;
}
