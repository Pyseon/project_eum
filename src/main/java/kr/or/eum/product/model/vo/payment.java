package kr.or.eum.product.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class payment {
	private int payNo;
	private int memberNo;
	private String payState;
	private String payMethod;
	private String payDate;
	private int payMent;
	private int payUsepoint;
	private int payAddpoint;
	
}
