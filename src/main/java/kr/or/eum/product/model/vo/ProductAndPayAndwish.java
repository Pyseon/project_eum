package kr.or.eum.product.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ProductAndPayAndwish {
	private String productTitle;
	private int payMent;
	private int payNo;
	private String productImgPath;
}
