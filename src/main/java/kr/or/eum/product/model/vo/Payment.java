package kr.or.eum.product.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Payment {
	private int payNo;
	private int memberNo;
	private int productNo;
	private int payState;
	private String payMethod;
	private String payDate;
	private int payment;
	private int payUsepoint;
	private int payAddpoint;
	
	private String memberId;  //영준
	private String productTitle; //영준
	private String productImgPath;  //영준
}
